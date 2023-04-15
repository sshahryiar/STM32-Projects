################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq_tsc.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_dxs.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_ecs.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_filter.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_globals.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_linrot.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_object.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_time.c \
../Middlewares/ST/STM32_TouchSensing_Library/src/tsl_touchkey.c 

OBJS += \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq_tsc.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_dxs.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_ecs.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_filter.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_globals.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_linrot.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_object.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_time.o \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_touchkey.o 

C_DEPS += \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq_tsc.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_dxs.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_ecs.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_filter.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_globals.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_linrot.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_object.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_time.d \
./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_touchkey.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/ST/STM32_TouchSensing_Library/src/%.o: ../Middlewares/ST/STM32_TouchSensing_Library/src/%.c Middlewares/ST/STM32_TouchSensing_Library/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F051x8 -c -I../Core/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F0xx/Include -I../Drivers/CMSIS/Include -I../TOUCHSENSING/App -I../Middlewares/ST/STM32_TouchSensing_Library/inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Middlewares-2f-ST-2f-STM32_TouchSensing_Library-2f-src

clean-Middlewares-2f-ST-2f-STM32_TouchSensing_Library-2f-src:
	-$(RM) ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq_tsc.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_acq_tsc.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_dxs.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_dxs.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_ecs.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_ecs.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_filter.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_filter.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_globals.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_globals.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_linrot.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_linrot.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_object.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_object.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_time.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_time.o ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_touchkey.d ./Middlewares/ST/STM32_TouchSensing_Library/src/tsl_touchkey.o

.PHONY: clean-Middlewares-2f-ST-2f-STM32_TouchSensing_Library-2f-src

