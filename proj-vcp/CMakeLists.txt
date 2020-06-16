cmake_minimum_required(VERSION 3.2.0)
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)


# Set cross compiler
project(F4Matrix C ASM)
set(CMAKE_C_COMPILER "arm-none-eabi-gcc")
set(CMAKE_ASM_COMPILER "arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++")
find_program(OBJCOPY "arm-none-eabi-objcopy")
# find_program(ST_FLASH "st-flash")
set(ST_FLASH "/data/local/repos/stm32/stlink/build/Release/bin/st-flash")

set(STM32F4_DSP_PERIPH_LIB 
	"/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0"
	)
# "/data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.4.0"
set(STM32F4_STDPERIPH_DRIVER_DIR "${STM32F4_DSP_PERIPH_LIB}/Libraries/STM32F4xx_StdPeriph_Driver")
set(CMSIS_DIR "${STM32F4_DSP_PERIPH_LIB}/Libraries/CMSIS")

#file(GLOB globbed "teeny_usb_stack/src/*.c")

file(GLOB globbed "/data/repos/stm32f429/00-STM32F429_LIBRARIES/usb_cdc_device/*.c")
set(MATRIX_FILES
#	src/teeny_usb_desc.c
#	"/data/repos/stm32f429/00-STM32F429_LIBRARIES/usb_cdc_device/usbd_usr.c"
	${globbed}
	"/data/repos/stm32f429/00-STM32F429_LIBRARIES/tm_stm32f4_usb_vcp.c"
	"/data/repos/stm32f429/00-STM32F429_LIBRARIES/tm_stm32f4_disco.c"
	"/data/repos/stm32f429/00-STM32F429_LIBRARIES/tm_stm32f4_gpio.c"
	src/main.c
#	src/stm32f4xx_it.c
	#board/system_stm32f4xx.c
	src/system_stm32f4xx.c
	)

set(STARTUP_FILES
	startup_src/startup_stm32f40xx.S
	)

set(STDPERIPH_FUNCTIONS
	"rcc"
	"usart"
	"dma"
	"tim"
	"gpio"
	"exti"
	)

set(STDPERIPH_FILES "${STM32F4_STDPERIPH_DRIVER_DIR}/src/misc.c")
foreach(STDPERIPH_FUNCTION ${STDPERIPH_FUNCTIONS})
	list(APPEND STDPERIPH_FILES ${STM32F4_STDPERIPH_DRIVER_DIR}/src/stm32f4xx_${STDPERIPH_FUNCTION}.c)
endforeach()

include_directories(
	"src"
	"${STM32F4_STDPERIPH_DRIVER_DIR}/inc"
	#"${CMSIS_DIR}/Device/ST/STM32F4xx/Include"
	"${CMSIS_DIR}/Include"
	"teeny_usb_stack/inc"
	// "/data/local/repos/stm32/TeenyUSB/usb_stack/inc"
#	"/data/repos/stm32/TeenyUSB"
#	"/data/repos/stm32/stm32lib/STM32F4xx_HAL_Driver/Inc"
#	"/data/repos/stm32/stm32lib/CMSIS/STM32F4xx/Include/"
	"./board"
	"/data/repos/stm32f429/00-STM32F429_LIBRARIES/"
	"/data/repos/stm32f429/00-STM32F4xx_STANDARD_PERIPHERAL_DRIVERS/CMSIS/Device/ST/STM32F4xx/Include/"
	"/data/repos/stm32f429/00-STM32F429_LIBRARIES/usb_cdc_device/"

)
link_libraries(m c gcc)

get_filename_component(LINKERSCRIPT startup_src/stm32_flash.ld ABSOLUTE)

# Set linker script
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${LINKERSCRIPT}")
# Set gc-sections to cleanup unused sections
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")
# Processor features
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=${CMAKE_SYSTEM_PROCESSOR} -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp --std=c99")

add_definitions(-DSTM32F40_41xxx)
add_definitions(-DUSE_STDPERIPH_DRIVER)
add_definitions(-DHSE_VALUE=80000000)

add_definitions(-DSTM32F407xx)
add_definitions(-DUSE_HAL_DRIVER)
add_definitions(-DNO_HOST)

add_definitions(-DTM_DISCO_STM32F4_DISCOVERY)
add_definitions(-DSTM32F407VG)
add_definitions(-DUSE_USB_OTG_FS)

add_executable(
	F4Matrix
	${MATRIX_FILES}
	${STARTUP_FILES}
	${STDPERIPH_FILES}
)

add_custom_target(F4Matrix.bin ALL
	COMMAND ${OBJCOPY} -S -O binary F4Matrix F4Matrix.bin
	DEPENDS F4Matrix
	)

add_custom_target(flash
	COMMAND ${ST_FLASH} write F4Matrix.bin 0x08000000
	DEPENDS F4Matrix.bin
	)
