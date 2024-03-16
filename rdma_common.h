#ifndef __RDMAC_H
#define __RDMAC_H
//#include "zmalloc.h"
#define MAX_CONNECTIONS 0
/* Capacity of the completion queue (CQ) */
#define CQ_CAPACITY (2)
/* MAX SGE capacity */
#define MAX_SGE (1)
/* MAX work requests */
#define MAX_WR (2)

#define MAX_SEND_WR (2);
#define MAX_SEND_SGE (1);
#define MAX_RECV_WR (2);
#define MAX_RECV_SGE (1);


#define SG_SIG_ALL (0);

#define TCP_MANAGEMENT_PORT 4339



#define IB_MTU			IBV_MTU_4096
#define IB_PORT			1
#define IB_SL			0
#define IB_WR_ID_STOP		0xE000000000000000
#define NUM_WARMING_UP_OPS      500000
#define TOT_NUM_OPS             10000000
#define SIG_INTERVAL            1000

struct rdma_socket_payload {
	uint16_t lid;
	uint32_t qp_num;
};

struct rdma_context {
    struct ibv_context *context;
    struct ibv_pd *pd;
    struct ibv_comp_channel *comp_channel;
    struct ibv_cq *cq;
    struct ibv_qp *qp;
    struct ibv_port_attr port_attr;
    struct rdma_socket_payload remote_data;
    uint16_t port_lid;
    uint32_t qp_num;
    void *buf;
    struct ibv_mr *mr;
};

#endif /* RDMA_SERVER_H */

