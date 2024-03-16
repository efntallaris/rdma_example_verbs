cmake_minimum_required(VERSION 3.0)
project(YourProjectName C)

# Add the executable
add_executable(server main_server.c rdma_server.h rdma_server.c)
add_executable(client main_client.c rdma_client.h rdma_client.c)

# Include the directory containing rdma_server.h if needed
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(server LINK_PRIVATE ibverbs)
target_link_libraries(client LINK_PRIVATE ibverbs)

# Optionally, you can set additional compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")

