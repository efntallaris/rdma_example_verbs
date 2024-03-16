#include "rdma_server.h"
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h> // Include the header file that declares close()
#include <infiniband/verbs.h>
#include "rdma_common.h"

void build_context(struct rdma_context *ctx) {
	int num_devices;
	const char *target_device = "qedr0";
	struct ibv_device** device_list = ibv_get_device_list(&num_devices);

	for (int i = 0; i < num_devices; i++){
		if(strcmp(target_device, ibv_get_device_name(device_list[i])) == 0){


			printf("opening device:%s and setting it as ctx\n", ibv_get_device_name(device_list[i]));
			ctx->context = ibv_open_device(device_list[i]);
			break;
		}
	}
	if (!ctx->context) {
		perror("ibv_open_device");
		exit(EXIT_FAILURE);
	}

	ctx->pd = ibv_alloc_pd(ctx->context);
	if (!ctx->pd) {
		perror("ibv_alloc_pd");
		exit(EXIT_FAILURE);
	}
	createQueuePair(ctx);

}

void createQueuePair(struct rdma_context *ctx) {
	struct ibv_qp_attr init_attr;
	int cq_size = CQ_CAPACITY;
	struct ibv_cq* cq = ibv_create_cq(ctx->context, cq_size, NULL, NULL, 0);
	struct ibv_qp_init_attr queue_pair_init_attr;
	memset(&queue_pair_init_attr, 0, sizeof(queue_pair_init_attr));
	queue_pair_init_attr.qp_type = IBV_QPT_RC;
	queue_pair_init_attr.sq_sig_all = 1;       // if not set 0, all work requests submitted to SQ will always generate a Work Completion.
	queue_pair_init_attr.send_cq = cq;         // completion queue can be shared or you can use distinct completion queues.
	queue_pair_init_attr.recv_cq = cq;         // completion queue can be shared or you can use distinct completion queues.
	queue_pair_init_attr.cap.max_send_wr = MAX_SEND_WR;  // increase if you want to keep more send work requests in the SQ.
	queue_pair_init_attr.cap.max_recv_wr = MAX_RECV_WR;  // increase if you want to keep more receive work requests in the RQ.
	queue_pair_init_attr.cap.max_send_sge = MAX_SEND_SGE; // increase if you allow send work requests to have multiple scatter gather entry (SGE).
	queue_pair_init_attr.cap.max_recv_sge = MAX_RECV_SGE; // increase if you allow receive work requests to have multiple scatter gather entry (SGE).

	ctx->qp = ibv_create_qp(ctx->pd, &queue_pair_init_attr);


	// SET THE STATE TO INIT
	memset(&init_attr, 0, sizeof(init_attr));
	init_attr.qp_state = IBV_QPS_INIT;
	init_attr.port_num = 1;
	init_attr.pkey_index = 0;
	init_attr.qp_access_flags = IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_READ | IBV_ACCESS_REMOTE_WRITE;

	bool modify_ok = ibv_modify_qp(ctx->qp, &init_attr, IBV_QP_STATE | IBV_QP_PKEY_INDEX | IBV_QP_PORT | IBV_QP_ACCESS_FLAGS) == 0 ? true : false;
	if(!modify_ok){
		printf("SOMETHING WENT WRONG ibv_modify_qp\n");

	}

	// we have to exchange the data now so we can create the qp

	struct ibv_port_attr port_attr;
	ibv_query_port(ctx->context, 1, &port_attr);
	ctx->qp_num = ctx->qp->qp_num;
	ctx->port_lid = port_attr.lid;

	printf("qpnum is:%d\n", ctx->qp->qp_num);
	printf("port addr is:%d\n", port_attr.lid);

	client_exh_data(ctx);


}

void client_exh_data(struct rdma_context *ctx){

	printf("client here");
	// TCP socket setup
	int client_socket;
	struct sockaddr_in server_addr;

	client_socket = socket(AF_INET, SOCK_STREAM, 0);
	if (client_socket == -1) {
		perror("socket");
		exit(EXIT_FAILURE);
	}

	memset(&server_addr, 0, sizeof(server_addr));
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(TCP_MANAGEMENT_PORT); // Define TCP_PORT in rdma_common.h
	server_addr.sin_addr.s_addr = inet_addr("127.0.0.1"); // Server IP address

	if (connect(client_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1) {
		perror("connect");
		exit(EXIT_FAILURE);
	}
	printf("CLIENT CONNECTED");

	struct rdma_socket_payload payload;
	struct rdma_socket_payload recv_payload;
	payload.lid = ctx->port_lid;
	payload.qp_num = ctx->qp_num;
	//printf("SENT %d, %d \n", payload.lid, payload.qp_num);
	recv(client_socket, &recv_payload, sizeof(struct rdma_socket_payload), MSG_WAITALL);
	send(client_socket, &payload, sizeof(struct rdma_socket_payload), 0);
	//printf("RECEIVED %d, %d \n", recv_payload.lid, recv_payload.qp_num);
	ctx->remote_data = recv_payload;

	modify_qp_state_rtr(ctx);
	// Close socket
	close(client_socket);

}


void modify_qp_state_rtr(struct rdma_context *ctx){
	struct ibv_qp_attr  qp_attr = {
	    .qp_state           = IBV_QPS_RTR,
	    .path_mtu           = IB_MTU,
	    .dest_qp_num        = ctx->remote_data.qp_num,
	    .rq_psn             = 0,
	    .max_dest_rd_atomic = 1,
	    .min_rnr_timer      = 12,
	    .ah_attr.is_global  = 0,
	    .ah_attr.dlid       = ctx->remote_data.lid,
	    .ah_attr.sl         = IB_SL,
	    .ah_attr.src_path_bits = 0,
	    .ah_attr.port_num      = IB_PORT,
	};

	int ret = ibv_modify_qp(ctx->qp, &qp_attr,
			    IBV_QP_STATE | IBV_QP_AV |
			    IBV_QP_PATH_MTU | IBV_QP_DEST_QPN |
			    IBV_QP_RQ_PSN | IBV_QP_MAX_DEST_RD_ATOMIC |
			    IBV_QP_MIN_RNR_TIMER);

}

void destroy_context(struct rdma_context *ctx) {
	if (ctx->mr)
		ibv_dereg_mr(ctx->mr);

	if (ctx->buf)
		free(ctx->buf);

	if (ctx->qp)
		ibv_destroy_qp(ctx->qp);

	if (ctx->pd)
		ibv_dealloc_pd(ctx->pd);

	if (ctx->context)
		ibv_close_device(ctx->context);
}

