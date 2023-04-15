################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/BME280.c \
../Src/SSD1306.c \
../Src/gpio.c \
../Src/main.c \
../Src/spi.c \
../Src/stm32f1xx_hal_msp.c \
../Src/stm32f1xx_it.c \
../Src/system_stm32f1xx.c 

OBJS += \
./Src/BME280.o \
./Src/SSD1306.o \
./Src/gpio.o \
./Src/main.o \
./Src/spi.o \
./Src/stm32f1xx_hal_msp.o \
./Src/stm32f1xx_it.o \
./Src/system_stm32f1xx.o 

C_DEPS += \
./Src/BME280.d \
./Src/SSD1306.d \
./Src/gpio.d \
./Src/main.d \
./Src/spi.d \
./Src/stm32f1xx_hal_msp.d \
./Src/stm32f1xx_it.d \
./Src/system_stm32f1xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/BME280.o: C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Src/BME280.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xE -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Inc" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/STM32F1xx_HAL_Driver/Inc" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/SSD1306.o: C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Src/SSD1306.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xE -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Inc" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/STM32F1xx_HAL_Driver/Inc" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xE -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Inc" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/STM32F1xx_HAL_Driver/Inc" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"C:/Users/sshah/Desktop/BME280_Environment_Sensor_Demo/BME280_demo/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


