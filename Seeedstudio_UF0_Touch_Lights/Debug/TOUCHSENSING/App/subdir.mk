################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TOUCHSENSING/App/stmCriticalSection.c \
../TOUCHSENSING/App/touchsensing.c \
../TOUCHSENSING/App/tsl_user.c 

OBJS += \
./TOUCHSENSING/App/stmCriticalSection.o \
./TOUCHSENSING/App/touchsensing.o \
./TOUCHSENSING/App/tsl_user.o 

C_DEPS += \
./TOUCHSENSING/App/stmCriticalSection.d \
./TOUCHSENSING/App/touchsensing.d \
./TOUCHSENSING/App/tsl_user.d 


# Each subdirectory must supply rules for building sources it contributes
TOUCHSENSING/App/%.o: ../TOUCHSENSING/App/%.c TOUCHSENSING/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F051x8 -c -I../Core/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F0xx/Include -I../Drivers/CMSIS/Include -I../TOUCHSENSING/App -I../Middlewares/ST/STM32_TouchSensing_Library/inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TOUCHSENSING-2f-App

clean-TOUCHSENSING-2f-App:
	-$(RM) ./TOUCHSENSING/App/stmCriticalSection.d ./TOUCHSENSING/App/stmCriticalSection.o ./TOUCHSENSING/App/touchsensing.d ./TOUCHSENSING/App/touchsensing.o ./TOUCHSENSING/App/tsl_user.d ./TOUCHSENSING/App/tsl_user.o

.PHONY: clean-TOUCHSENSING-2f-App

