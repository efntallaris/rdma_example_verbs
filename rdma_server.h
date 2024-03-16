#ifndef __RDMAS_H
#define __RDMAS_H
#include <netdb.h>
#include <errno.h>
#include <getopt.h>
#include "rdma_buffer.h"

#include "rdma_common.h"
#ifndef RDMA_SERVER_H
#define RDMA_SERVER_H


struct rdma_server_info {
    char dummy[10];
    char serverPort[60];

    struct rdma_context     context;
    pthread_t  		    listen_thread;


    struct {
        void (*dummy_func)();
        void (*create_ctx)(struct rdma_context *);
        void (*destroy_ctx)(struct rdma_context *);
    } server_ops;

    struct {
        void (*rdma_send)(struct rdma_server_info *, struct rdma_buffer_info *,  size_t );
        void (*rdma_recv)(struct rdma_server_info *, struct rdma_buffer_info *,  size_t );
	void (*wait_for_recv_completion)(struct rdma_server_info *);
	void (*wait_for_send_completion)(struct rdma_server_info *);

    } buffer_ops;
};

void build_context(struct rdma_context *ctx);
void createQueuePair(struct rdma_context *ctx);
void destroy_context(struct rdma_context *ctx);

#endif /* RDMA_SERVER_H */

#endif /* __RDMAS_H */
