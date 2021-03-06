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
CMAKE_SOURCE_DIR = /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver

# Include any dependencies generated for this target.
include CMakeFiles/F4Matrix.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/F4Matrix.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/F4Matrix.dir/flags.make

CMakeFiles/F4Matrix.dir/src/main.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/src/main.c.obj: src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/F4Matrix.dir/src/main.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/src/main.c.obj   -c /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/src/main.c

CMakeFiles/F4Matrix.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/src/main.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/src/main.c > CMakeFiles/F4Matrix.dir/src/main.c.i

CMakeFiles/F4Matrix.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/src/main.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/src/main.c -o CMakeFiles/F4Matrix.dir/src/main.c.s

CMakeFiles/F4Matrix.dir/src/main.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/src/main.c.obj.requires

CMakeFiles/F4Matrix.dir/src/main.c.obj.provides: CMakeFiles/F4Matrix.dir/src/main.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/src/main.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/src/main.c.obj.provides

CMakeFiles/F4Matrix.dir/src/main.c.obj.provides.build: CMakeFiles/F4Matrix.dir/src/main.c.obj


CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj: src/system_stm32f4xx.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj   -c /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/src/system_stm32f4xx.c

CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/src/system_stm32f4xx.c > CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.i

CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/src/system_stm32f4xx.c -o CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.s

CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.requires

CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.provides: CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.provides

CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.provides.build: CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj


CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj: /data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj   -c /data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c > CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.i

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.s

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.requires

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.provides: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.provides

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.provides.build: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj


CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj: startup_src/startup_stm32f40xx.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building ASM object CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj"
	arm-none-eabi-gcc  $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj -c /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/startup_src/startup_stm32f40xx.S

CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.requires

CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.provides: CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.provides

CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.provides.build: CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj


CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj: /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj   -c /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c > CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.i

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.s

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.requires

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.provides: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.provides

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.provides.build: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj


CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj: /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj   -c /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c > CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.i

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.s

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.requires

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.provides: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.provides

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.provides.build: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj


CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj: /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj   -c /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c > CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.i

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.s

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.requires

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.provides: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.provides

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.provides.build: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj


CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj: /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj   -c /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c > CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.i

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.s

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.requires

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.provides: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.provides

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.provides.build: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj


CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj: /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj   -c /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c > CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.i

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.s

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.requires

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.provides: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.provides

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.provides.build: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj


CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj: CMakeFiles/F4Matrix.dir/flags.make
CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj: /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj   -c /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.i"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c > CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.i

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.s"
	arm-none-eabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c -o CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.s

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.requires:

.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.requires

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.provides: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.requires
	$(MAKE) -f CMakeFiles/F4Matrix.dir/build.make CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.provides.build
.PHONY : CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.provides

CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.provides.build: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj


# Object files for target F4Matrix
F4Matrix_OBJECTS = \
"CMakeFiles/F4Matrix.dir/src/main.c.obj" \
"CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj" \
"CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj" \
"CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj" \
"CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj" \
"CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj" \
"CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj" \
"CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj" \
"CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj" \
"CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj"

# External object files for target F4Matrix
F4Matrix_EXTERNAL_OBJECTS =

F4Matrix: CMakeFiles/F4Matrix.dir/src/main.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj
F4Matrix: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj
F4Matrix: CMakeFiles/F4Matrix.dir/build.make
F4Matrix: CMakeFiles/F4Matrix.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking C executable F4Matrix"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/F4Matrix.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/F4Matrix.dir/build: F4Matrix

.PHONY : CMakeFiles/F4Matrix.dir/build

CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/src/main.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/src/system_stm32f4xx.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32RGBMatrixDriver/lib-funky-led/led_matrix.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/startup_src/startup_stm32f40xx.S.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/misc.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c.obj.requires
CMakeFiles/F4Matrix.dir/requires: CMakeFiles/F4Matrix.dir/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c.obj.requires

.PHONY : CMakeFiles/F4Matrix.dir/requires

CMakeFiles/F4Matrix.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/F4Matrix.dir/cmake_clean.cmake
.PHONY : CMakeFiles/F4Matrix.dir/clean

CMakeFiles/F4Matrix.dir/depend:
	cd /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver /data/local/repos/stm32/STM32RGBMatrixDriver/led-driver/CMakeFiles/F4Matrix.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/F4Matrix.dir/depend

