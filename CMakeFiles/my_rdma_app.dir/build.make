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
include CMakeFiles/my_rdma_app.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/my_rdma_app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_rdma_app.dir/flags.make

CMakeFiles/my_rdma_app.dir/main.cpp.o: CMakeFiles/my_rdma_app.dir/flags.make
CMakeFiles/my_rdma_app.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/rd/rdma_example/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/my_rdma_app.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/my_rdma_app.dir/main.cpp.o -c /root/rd/rdma_example/main.cpp

CMakeFiles/my_rdma_app.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_rdma_app.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/rd/rdma_example/main.cpp > CMakeFiles/my_rdma_app.dir/main.cpp.i

CMakeFiles/my_rdma_app.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_rdma_app.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/rd/rdma_example/main.cpp -o CMakeFiles/my_rdma_app.dir/main.cpp.s

CMakeFiles/my_rdma_app.dir/rdma_server.c.o: CMakeFiles/my_rdma_app.dir/flags.make
CMakeFiles/my_rdma_app.dir/rdma_server.c.o: rdma_server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/rd/rdma_example/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/my_rdma_app.dir/rdma_server.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/my_rdma_app.dir/rdma_server.c.o   -c /root/rd/rdma_example/rdma_server.c

CMakeFiles/my_rdma_app.dir/rdma_server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/my_rdma_app.dir/rdma_server.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/rd/rdma_example/rdma_server.c > CMakeFiles/my_rdma_app.dir/rdma_server.c.i

CMakeFiles/my_rdma_app.dir/rdma_server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/my_rdma_app.dir/rdma_server.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/rd/rdma_example/rdma_server.c -o CMakeFiles/my_rdma_app.dir/rdma_server.c.s

# Object files for target my_rdma_app
my_rdma_app_OBJECTS = \
"CMakeFiles/my_rdma_app.dir/main.cpp.o" \
"CMakeFiles/my_rdma_app.dir/rdma_server.c.o"

# External object files for target my_rdma_app
my_rdma_app_EXTERNAL_OBJECTS =

my_rdma_app: CMakeFiles/my_rdma_app.dir/main.cpp.o
my_rdma_app: CMakeFiles/my_rdma_app.dir/rdma_server.c.o
my_rdma_app: CMakeFiles/my_rdma_app.dir/build.make
my_rdma_app: /usr/lib/libibverbs.so
my_rdma_app: /usr/lib/libibverbs.so
my_rdma_app: CMakeFiles/my_rdma_app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/rd/rdma_example/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable my_rdma_app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_rdma_app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_rdma_app.dir/build: my_rdma_app

.PHONY : CMakeFiles/my_rdma_app.dir/build

CMakeFiles/my_rdma_app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_rdma_app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_rdma_app.dir/clean

CMakeFiles/my_rdma_app.dir/depend:
	cd /root/rd/rdma_example && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/rd/rdma_example /root/rd/rdma_example /root/rd/rdma_example /root/rd/rdma_example /root/rd/rdma_example/CMakeFiles/my_rdma_app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/my_rdma_app.dir/depend

