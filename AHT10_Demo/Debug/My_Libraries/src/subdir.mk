################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../My_Libraries/src/AHT10.c \
../My_Libraries/src/ST7735.c 

OBJS += \
./My_Libraries/src/AHT10.o \
./My_Libraries/src/ST7735.o 

C_DEPS += \
./My_Libraries/src/AHT10.d \
./My_Libraries/src/ST7735.d 


# Each subdirectory must supply rules for building sources it contributes
My_Libraries/src/%.o My_Libraries/src/%.su: ../My_Libraries/src/%.c My_Libraries/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"E:/Current_Works/AHT10 Relative-Humidity-Temperature Sensor Demo/AHT10_Demo/My_Libraries/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-My_Libraries-2f-src

clean-My_Libraries-2f-src:
	-$(RM) ./My_Libraries/src/AHT10.d ./My_Libraries/src/AHT10.o ./My_Libraries/src/AHT10.su ./My_Libraries/src/ST7735.d ./My_Libraries/src/ST7735.o ./My_Libraries/src/ST7735.su

.PHONY: clean-My_Libraries-2f-src

