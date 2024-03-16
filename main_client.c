#include <stdio.h>
#include <string.h>
#include "rdma_client.h"

int main() {
	struct rdma_context ctx;
	memset(&ctx, 0, sizeof(ctx));
	printf("CLIENT");

	build_context(&ctx);

	return 0;
}

