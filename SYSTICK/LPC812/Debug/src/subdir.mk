################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cr_startup_lpc8xx.c \
../src/crp.c \
../src/main.c \
../src/mtb.c \
../src/sysinit.c 

OBJS += \
./src/cr_startup_lpc8xx.o \
./src/crp.o \
./src/main.o \
./src/mtb.o \
./src/sysinit.o 

C_DEPS += \
./src/cr_startup_lpc8xx.d \
./src/crp.d \
./src/main.d \
./src/mtb.d \
./src/sysinit.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__MTB_BUFFER_SIZE=256 -D__USE_LPCOPEN -DNO_BOARD_LIB -DCR_INTEGER_PRINTF -DCR_PRINTF_CHAR -D__LPC8XX__ -D__REDLIB__ -I"C:\Users\pc-hp\Documents\LPC812\SYSTICK\LPC812\inc" -I"C:\Users\pc-hp\Documents\LPC812\SYSTICK\lpc_chip_8xx\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


