# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tony/Projects/AllianceDB

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tony/Projects/AllianceDB/armbuild

# Include any dependencies generated for this target.
include benchmark/CMakeFiles/benchmark.dir/depend.make

# Include the progress variables for this target.
include benchmark/CMakeFiles/benchmark.dir/progress.make

# Include the compile flags for this target's objects.
include benchmark/CMakeFiles/benchmark.dir/flags.make

benchmark/CMakeFiles/benchmark.dir/src/Benchmark.cpp.o: benchmark/CMakeFiles/benchmark.dir/flags.make
benchmark/CMakeFiles/benchmark.dir/src/Benchmark.cpp.o: ../benchmark/src/Benchmark.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/armbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object benchmark/CMakeFiles/benchmark.dir/src/Benchmark.cpp.o"
	cd /home/tony/Projects/AllianceDB/armbuild/benchmark && /home/tony/Platforms/bananapi/buildroot-2021.11.1/output/host/bin/arm-buildroot-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/benchmark.dir/src/Benchmark.cpp.o -c /home/tony/Projects/AllianceDB/benchmark/src/Benchmark.cpp

benchmark/CMakeFiles/benchmark.dir/src/Benchmark.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/benchmark.dir/src/Benchmark.cpp.i"
	cd /home/tony/Projects/AllianceDB/armbuild/benchmark && /home/tony/Platforms/bananapi/buildroot-2021.11.1/output/host/bin/arm-buildroot-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/benchmark/src/Benchmark.cpp > CMakeFiles/benchmark.dir/src/Benchmark.cpp.i

benchmark/CMakeFiles/benchmark.dir/src/Benchmark.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/benchmark.dir/src/Benchmark.cpp.s"
	cd /home/tony/Projects/AllianceDB/armbuild/benchmark && /home/tony/Platforms/bananapi/buildroot-2021.11.1/output/host/bin/arm-buildroot-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/benchmark/src/Benchmark.cpp -o CMakeFiles/benchmark.dir/src/Benchmark.cpp.s

# Object files for target benchmark
benchmark_OBJECTS = \
"CMakeFiles/benchmark.dir/src/Benchmark.cpp.o"

# External object files for target benchmark
benchmark_EXTERNAL_OBJECTS =

benchmark/benchmark: benchmark/CMakeFiles/benchmark.dir/src/Benchmark.cpp.o
benchmark/benchmark: benchmark/CMakeFiles/benchmark.dir/build.make
benchmark/benchmark: libIntelliStream.so
benchmark/benchmark: /home/tony/Platforms/bananapi/buildroot-2021.11.1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblog4cxx.so
benchmark/benchmark: benchmark/CMakeFiles/benchmark.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tony/Projects/AllianceDB/armbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable benchmark"
	cd /home/tony/Projects/AllianceDB/armbuild/benchmark && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/benchmark.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
benchmark/CMakeFiles/benchmark.dir/build: benchmark/benchmark

.PHONY : benchmark/CMakeFiles/benchmark.dir/build

benchmark/CMakeFiles/benchmark.dir/clean:
	cd /home/tony/Projects/AllianceDB/armbuild/benchmark && $(CMAKE_COMMAND) -P CMakeFiles/benchmark.dir/cmake_clean.cmake
.PHONY : benchmark/CMakeFiles/benchmark.dir/clean

benchmark/CMakeFiles/benchmark.dir/depend:
	cd /home/tony/Projects/AllianceDB/armbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tony/Projects/AllianceDB /home/tony/Projects/AllianceDB/benchmark /home/tony/Projects/AllianceDB/armbuild /home/tony/Projects/AllianceDB/armbuild/benchmark /home/tony/Projects/AllianceDB/armbuild/benchmark/CMakeFiles/benchmark.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : benchmark/CMakeFiles/benchmark.dir/depend

