################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/DS18B20.c \
../Core/Src/HW_I2C.c \
../Core/Src/I2C_LCD.c \
../Core/Src/PCF8574.c \
../Core/Src/SW_I2C.c \
../Core/Src/lcd_print.c \
../Core/Src/main.c \
../Core/Src/one_wire.c \
../Core/Src/stm32f0xx_hal_msp.c \
../Core/Src/stm32f0xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f0xx.c \
../Core/Src/timer_delay.c 

OBJS += \
./Core/Src/DS18B20.o \
./Core/Src/HW_I2C.o \
./Core/Src/I2C_LCD.o \
./Core/Src/PCF8574.o \
./Core/Src/SW_I2C.o \
./Core/Src/lcd_print.o \
./Core/Src/main.o \
./Core/Src/one_wire.o \
./Core/Src/stm32f0xx_hal_msp.o \
./Core/Src/stm32f0xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f0xx.o \
./Core/Src/timer_delay.o 

C_DEPS += \
./Core/Src/DS18B20.d \
./Core/Src/HW_I2C.d \
./Core/Src/I2C_LCD.d \
./Core/Src/PCF8574.d \
./Core/Src/SW_I2C.d \
./Core/Src/lcd_print.d \
./Core/Src/main.d \
./Core/Src/one_wire.d \
./Core/Src/stm32f0xx_hal_msp.d \
./Core/Src/stm32f0xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f0xx.d \
./Core/Src/timer_delay.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F030x6 -c -I../Core/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/DS18B20.cyclo ./Core/Src/DS18B20.d ./Core/Src/DS18B20.o ./Core/Src/DS18B20.su ./Core/Src/HW_I2C.cyclo ./Core/Src/HW_I2C.d ./Core/Src/HW_I2C.o ./Core/Src/HW_I2C.su ./Core/Src/I2C_LCD.cyclo ./Core/Src/I2C_LCD.d ./Core/Src/I2C_LCD.o ./Core/Src/I2C_LCD.su ./Core/Src/PCF8574.cyclo ./Core/Src/PCF8574.d ./Core/Src/PCF8574.o ./Core/Src/PCF8574.su ./Core/Src/SW_I2C.cyclo ./Core/Src/SW_I2C.d ./Core/Src/SW_I2C.o ./Core/Src/SW_I2C.su ./Core/Src/lcd_print.cyclo ./Core/Src/lcd_print.d ./Core/Src/lcd_print.o ./Core/Src/lcd_print.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/one_wire.cyclo ./Core/Src/one_wire.d ./Core/Src/one_wire.o ./Core/Src/one_wire.su ./Core/Src/stm32f0xx_hal_msp.cyclo ./Core/Src/stm32f0xx_hal_msp.d ./Core/Src/stm32f0xx_hal_msp.o ./Core/Src/stm32f0xx_hal_msp.su ./Core/Src/stm32f0xx_it.cyclo ./Core/Src/stm32f0xx_it.d ./Core/Src/stm32f0xx_it.o ./Core/Src/stm32f0xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f0xx.cyclo ./Core/Src/system_stm32f0xx.d ./Core/Src/system_stm32f0xx.o ./Core/Src/system_stm32f0xx.su ./Core/Src/timer_delay.cyclo ./Core/Src/timer_delay.d ./Core/Src/timer_delay.o ./Core/Src/timer_delay.su

.PHONY: clean-Core-2f-Src

