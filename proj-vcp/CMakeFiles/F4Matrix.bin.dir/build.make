# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/shouldsee/stm32/STM32RGBMatrixDriver/proj-vcp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/repos/stm32/STM32RGBMatrixDriver/proj-vcp

# Utility rule file for F4Matrix.bin.

# Include the progress variables for this target.
include CMakeFiles/F4Matrix.bin.dir/progress.make

CMakeFiles/F4Matrix.bin: F4Matrix
	/usr/bin/arm-none-eabi-objcopy -S -O binary F4Matrix F4Matrix.bin

F4Matrix.bin: CMakeFiles/F4Matrix.bin
F4Matrix.bin: CMakeFiles/F4Matrix.bin.dir/build.make

.PHONY : F4Matrix.bin

# Rule to build all files generated by this target.
CMakeFiles/F4Matrix.bin.dir/build: F4Matrix.bin

.PHONY : CMakeFiles/F4Matrix.bin.dir/build

CMakeFiles/F4Matrix.bin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/F4Matrix.bin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/F4Matrix.bin.dir/clean

CMakeFiles/F4Matrix.bin.dir/depend:
	cd /data/repos/stm32/STM32RGBMatrixDriver/proj-vcp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shouldsee/stm32/STM32RGBMatrixDriver/proj-vcp /home/shouldsee/stm32/STM32RGBMatrixDriver/proj-vcp /data/repos/stm32/STM32RGBMatrixDriver/proj-vcp /data/repos/stm32/STM32RGBMatrixDriver/proj-vcp /data/repos/stm32/STM32RGBMatrixDriver/proj-vcp/CMakeFiles/F4Matrix.bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/F4Matrix.bin.dir/depend

