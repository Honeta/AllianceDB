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
CMAKE_BINARY_DIR = /home/tony/Projects/AllianceDB/build

# Include any dependencies generated for this target.
include CMakeFiles/IntelliStream.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/IntelliStream.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/IntelliStream.dir/flags.make

CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.o: ../src/Common/Types.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.o -c /home/tony/Projects/AllianceDB/src/Common/Types.cpp

CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Common/Types.cpp > CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.i

CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Common/Types.cpp -o CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.s

CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.o: ../src/Common/DatasetTool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.o -c /home/tony/Projects/AllianceDB/src/Common/DatasetTool.cpp

CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Common/DatasetTool.cpp > CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.i

CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Common/DatasetTool.cpp -o CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.s

CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.o: ../src/Common/MultiThreadHashTable.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.o -c /home/tony/Projects/AllianceDB/src/Common/MultiThreadHashTable.cpp

CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Common/MultiThreadHashTable.cpp > CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.i

CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Common/MultiThreadHashTable.cpp -o CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.s

CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.o: ../src/JoinAlgo/JoinAlgoTable.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.o -c /home/tony/Projects/AllianceDB/src/JoinAlgo/JoinAlgoTable.cpp

CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/JoinAlgo/JoinAlgoTable.cpp > CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.i

CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/JoinAlgo/JoinAlgoTable.cpp -o CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.s

CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.o: ../src/JoinAlgo/AbstractJoinAlgo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.o -c /home/tony/Projects/AllianceDB/src/JoinAlgo/AbstractJoinAlgo.cpp

CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/JoinAlgo/AbstractJoinAlgo.cpp > CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.i

CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/JoinAlgo/AbstractJoinAlgo.cpp -o CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.s

CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.o: ../src/JoinAlgo/NPJ.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.o -c /home/tony/Projects/AllianceDB/src/JoinAlgo/NPJ.cpp

CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/JoinAlgo/NPJ.cpp > CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.i

CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/JoinAlgo/NPJ.cpp -o CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.s

CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.o: ../src/JoinProcessor/AbstractJP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.o -c /home/tony/Projects/AllianceDB/src/JoinProcessor/AbstractJP.cpp

CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/JoinProcessor/AbstractJP.cpp > CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.i

CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/JoinProcessor/AbstractJP.cpp -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.s

CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.o: ../src/JoinProcessor/AbstractLazyJP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.o -c /home/tony/Projects/AllianceDB/src/JoinProcessor/AbstractLazyJP.cpp

CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/JoinProcessor/AbstractLazyJP.cpp > CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.i

CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/JoinProcessor/AbstractLazyJP.cpp -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.s

CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.o: ../src/JoinProcessor/SimpleHashJP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.o -c /home/tony/Projects/AllianceDB/src/JoinProcessor/SimpleHashJP.cpp

CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/JoinProcessor/SimpleHashJP.cpp > CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.i

CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/JoinProcessor/SimpleHashJP.cpp -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.s

CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.o: ../src/JoinProcessor/HandShakeHashJP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.o -c /home/tony/Projects/AllianceDB/src/JoinProcessor/HandShakeHashJP.cpp

CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/JoinProcessor/HandShakeHashJP.cpp > CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.i

CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/JoinProcessor/HandShakeHashJP.cpp -o CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.s

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.o: ../src/WindowSlider/AbstractWS.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.o -c /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractWS.cpp

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractWS.cpp > CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.i

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractWS.cpp -o CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.s

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.o: ../src/WindowSlider/AbstractEagerWS.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.o -c /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractEagerWS.cpp

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractEagerWS.cpp > CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.i

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractEagerWS.cpp -o CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.s

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.o: ../src/WindowSlider/AbstractLazyWS.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.o -c /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractLazyWS.cpp

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractLazyWS.cpp > CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.i

CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/WindowSlider/AbstractLazyWS.cpp -o CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.s

CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.o: ../src/WindowSlider/HandShakeWS.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.o -c /home/tony/Projects/AllianceDB/src/WindowSlider/HandShakeWS.cpp

CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/WindowSlider/HandShakeWS.cpp > CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.i

CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/WindowSlider/HandShakeWS.cpp -o CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.s

CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.o: ../src/Utils/UtilityFunctions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.o -c /home/tony/Projects/AllianceDB/src/Utils/UtilityFunctions.cpp

CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Utils/UtilityFunctions.cpp > CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.i

CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Utils/UtilityFunctions.cpp -o CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.s

CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.o: ../src/Utils/concurrentqueue.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.o -c /home/tony/Projects/AllianceDB/src/Utils/concurrentqueue.cpp

CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Utils/concurrentqueue.cpp > CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.i

CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Utils/concurrentqueue.cpp -o CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.s

CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.o: ../src/Utils/MicroDataset.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.o -c /home/tony/Projects/AllianceDB/src/Utils/MicroDataset.cpp

CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Utils/MicroDataset.cpp > CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.i

CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Utils/MicroDataset.cpp -o CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.s

CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.o: ../src/Utils/ThreadPerf.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building CXX object CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.o -c /home/tony/Projects/AllianceDB/src/Utils/ThreadPerf.cpp

CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Utils/ThreadPerf.cpp > CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.i

CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Utils/ThreadPerf.cpp -o CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.s

CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.o: CMakeFiles/IntelliStream.dir/flags.make
CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.o: ../src/Utils/AbstractC20Thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building CXX object CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.o -c /home/tony/Projects/AllianceDB/src/Utils/AbstractC20Thread.cpp

CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tony/Projects/AllianceDB/src/Utils/AbstractC20Thread.cpp > CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.i

CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tony/Projects/AllianceDB/src/Utils/AbstractC20Thread.cpp -o CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.s

# Object files for target IntelliStream
IntelliStream_OBJECTS = \
"CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.o" \
"CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.o"

# External object files for target IntelliStream
IntelliStream_EXTERNAL_OBJECTS =

libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Common/Types.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Common/DatasetTool.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Common/MultiThreadHashTable.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/JoinAlgo/JoinAlgoTable.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/JoinAlgo/AbstractJoinAlgo.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/JoinAlgo/NPJ.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractJP.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/JoinProcessor/AbstractLazyJP.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/JoinProcessor/SimpleHashJP.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/JoinProcessor/HandShakeHashJP.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractWS.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractEagerWS.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/WindowSlider/AbstractLazyWS.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/WindowSlider/HandShakeWS.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Utils/UtilityFunctions.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Utils/concurrentqueue.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Utils/MicroDataset.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Utils/ThreadPerf.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/src/Utils/AbstractC20Thread.cpp.o
libIntelliStream.so: CMakeFiles/IntelliStream.dir/build.make
libIntelliStream.so: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
libIntelliStream.so: CMakeFiles/IntelliStream.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tony/Projects/AllianceDB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Linking CXX shared library libIntelliStream.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/IntelliStream.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/IntelliStream.dir/build: libIntelliStream.so

.PHONY : CMakeFiles/IntelliStream.dir/build

CMakeFiles/IntelliStream.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/IntelliStream.dir/cmake_clean.cmake
.PHONY : CMakeFiles/IntelliStream.dir/clean

CMakeFiles/IntelliStream.dir/depend:
	cd /home/tony/Projects/AllianceDB/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tony/Projects/AllianceDB /home/tony/Projects/AllianceDB /home/tony/Projects/AllianceDB/build /home/tony/Projects/AllianceDB/build /home/tony/Projects/AllianceDB/build/CMakeFiles/IntelliStream.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/IntelliStream.dir/depend

