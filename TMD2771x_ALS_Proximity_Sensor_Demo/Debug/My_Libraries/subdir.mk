################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../My_Libraries/LCD.c \
../My_Libraries/TMD2771x.c \
../My_Libraries/lcd_print.c 

OBJS += \
./My_Libraries/LCD.o \
./My_Libraries/TMD2771x.o \
./My_Libraries/lcd_print.o 

C_DEPS += \
./My_Libraries/LCD.d \
./My_Libraries/TMD2771x.d \
./My_Libraries/lcd_print.d 


# Each subdirectory must supply rules for building sources it contributes
My_Libraries/%.o: ../My_Libraries/%.c My_Libraries/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"E:/Current Works/TMD2771x_ALS_Proximity_Sensor_Demo/ALS_Prox/My_Libraries" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-My_Libraries

clean-My_Libraries:
	-$(RM) ./My_Libraries/LCD.d ./My_Libraries/LCD.o ./My_Libraries/TMD2771x.d ./My_Libraries/TMD2771x.o ./My_Libraries/lcd_print.d ./My_Libraries/lcd_print.o

.PHONY: clean-My_Libraries

