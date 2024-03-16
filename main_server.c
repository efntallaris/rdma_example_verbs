#include <stdio.h>
#include <string.h>
#include "rdma_server.h"

int main() {
	struct rdma_context ctx;
	memset(&ctx, 0, sizeof(ctx));

	build_context(&ctx);

	return 0;
}

