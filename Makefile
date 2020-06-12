# This Makefile was created by STM32CubeMX and was then stripped down to remove unwanted HAL libraries
# 2018-09-12

######################################
# project
######################################
TARGET = led_project


######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
C_SOURCES =  \
src/main.c \
src/system_stm32f4xx.c  \
# src/interrupts.c \
# src/systick.c \
# src/led.c

# ASM sources
DRIVER_DIR = /data/repos/stm32/led_matrix
ASM_SOURCES =  \
$(DRIVER_DIR)/startup/startup_stm32f407xx.s


#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

# STDPERIPH_FUNCTIONS = rcc usart dma tim gpio
# OpenOCD
# OPENOCD_PATH = /home/dmartins/STM32Toolchain/openocd
# OPENOCD_SCRIPTS = $(OPENOCD_PATH)/scripts
# OPENOCD_OPTS = -f board/st_nucleo_f4.cfg
# OPENOCD = $(OPENOCD_PATH)/bin/openocd


#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m4

# fpu
FPU = -mfpu=fpv4-sp-d16 

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DSTM32F40_41xxx \
-DUSE_STDPERIPH_DRIVER \
-DHSE_VALUE=8000000 \


# AS includes
AS_INCLUDES = 

# C includes
CMSIS_DIR = /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/CMSIS
C_INCLUDES =  \
-I include \
-I ${CMSIS_DIR}/Device/ST/STM32F4xx/Include \
-I ${CMSIS_DIR}/Include \
-I /data/repos/stm32/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver/inc/


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections -std=c99 -mthumb -mfpu=fpv4-sp-d16 
# -mfloat-abi=softfp

ifeq ($(DEBUG), 1)
CFLAGS += -gdwarf-2 -g3
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
# LDSCRIPT = STM32F446RETx_FLASH.ld
LDSCRIPT = /data/repos/LEDMatrixHUB75/F4Matrix/startup_src/stm32_flash.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)

#######################################
# write to flash memory
#######################################
ST_FLASH =  "/data/local/repos/stm32/stlink/build/Release/bin/st-flash"
flash: $(BUILD_DIR)/$(TARGET).elf
	arm-none-eabi-objcopy -S -O binary $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).bin	 
	$(ST_FLASH) write $(BUILD_DIR)/$(TARGET).bin 0x08000000
# 	$(OPENOCD) -s $(OPENOCD_SCRIPTS) $(OPENOCD_OPTS) -c "program $(BUILD_DIR)/$(TARGET).elf verify reset exit"


.PHONY: all clean flash
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
