# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/rd/rdma_example

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/rd/rdma_example

# Include any dependencies generated for this target.
include CMakeFiles/rdma_client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/rdma_client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rdma_client.dir/flags.make

CMakeFiles/rdma_client.dir/rdma_client.c.o: CMakeFiles/rdma_client.dir/flags.make
CMakeFiles/rdma_client.dir/rdma_client.c.o: rdma_client.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/rd/rdma_example/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/rdma_client.dir/rdma_client.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rdma_client.dir/rdma_client.c.o   -c /root/rd/rdma_example/rdma_client.c

CMakeFiles/rdma_client.dir/rdma_client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rdma_client.dir/rdma_client.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/rd/rdma_example/rdma_client.c > CMakeFiles/rdma_client.dir/rdma_client.c.i

CMakeFiles/rdma_client.dir/rdma_client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rdma_client.dir/rdma_client.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/rd/rdma_example/rdma_client.c -o CMakeFiles/rdma_client.dir/rdma_client.c.s

# Object files for target rdma_client
rdma_client_OBJECTS = \
"CMakeFiles/rdma_client.dir/rdma_client.c.o"

# External object files for target rdma_client
rdma_client_EXTERNAL_OBJECTS =

rdma_client: CMakeFiles/rdma_client.dir/rdma_client.c.o
rdma_client: CMakeFiles/rdma_client.dir/build.make
rdma_client: CMakeFiles/rdma_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/rd/rdma_example/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable rdma_client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rdma_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rdma_client.dir/build: rdma_client

.PHONY : CMakeFiles/rdma_client.dir/build

CMakeFiles/rdma_client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rdma_client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rdma_client.dir/clean

CMakeFiles/rdma_client.dir/depend:
	cd /root/rd/rdma_example && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/rd/rdma_example /root/rd/rdma_example /root/rd/rdma_example /root/rd/rdma_example /root/rd/rdma_example/CMakeFiles/rdma_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rdma_client.dir/depend
