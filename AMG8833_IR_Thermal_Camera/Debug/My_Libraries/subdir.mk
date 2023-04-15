################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../My_Libraries/AMG8833.c \
../My_Libraries/ILI9341.c \
../My_Libraries/font.c 

OBJS += \
./My_Libraries/AMG8833.o \
./My_Libraries/ILI9341.o \
./My_Libraries/font.o 

C_DEPS += \
./My_Libraries/AMG8833.d \
./My_Libraries/ILI9341.d \
./My_Libraries/font.d 


# Each subdirectory must supply rules for building sources it contributes
My_Libraries/AMG8833.o: E:/Current\ Works/AMG8833_IR_Thermal_Camera_Demo/Thermal_Camera/My_Libraries/AMG8833.c My_Libraries/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"E:/Current Works/AMG8833_IR_Thermal_Camera_Demo/Thermal_Camera/My_Libraries" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
My_Libraries/ILI9341.o: E:/Current\ Works/AMG8833_IR_Thermal_Camera_Demo/Thermal_Camera/My_Libraries/ILI9341.c My_Libraries/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"E:/Current Works/AMG8833_IR_Thermal_Camera_Demo/Thermal_Camera/My_Libraries" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
My_Libraries/font.o: E:/Current\ Works/AMG8833_IR_Thermal_Camera_Demo/Thermal_Camera/My_Libraries/font.c My_Libraries/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"E:/Current Works/AMG8833_IR_Thermal_Camera_Demo/Thermal_Camera/My_Libraries" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-My_Libraries

clean-My_Libraries:
	-$(RM) ./My_Libraries/AMG8833.d ./My_Libraries/AMG8833.o ./My_Libraries/ILI9341.d ./My_Libraries/ILI9341.o ./My_Libraries/font.d ./My_Libraries/font.o

.PHONY: clean-My_Libraries

