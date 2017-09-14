################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/main.asm \
/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_gpio.asm 

C_SRCS += \
/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/main.c \
/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_gpio.c \
/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_it.c \
/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_tim2.c 

OBJS += \
./src/main.o \
./src/stm8s_gpio.o \
./src/stm8s_it.o \
./src/stm8s_tim2.o 

C_DEPS += \
./src/main.d \
./src/stm8s_gpio.d \
./src/stm8s_it.d \
./src/stm8s_tim2.d 


# Each subdirectory must supply rules for building sources it contributes
src/main.o: /home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/main.asm
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Assembler'
	-o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/main.o: /home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	sdcc -c "$<" -DSTM8S003 -I"/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/include" -I/usr/share/sdcc/include -I/home/boris/programy/stm8s-sdcc/inc -O0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)"
	@echo 'Finished building: $<'
	@echo ' '

src/stm8s_gpio.o: /home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_gpio.asm
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Assembler'
	-o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/stm8s_gpio.o: /home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	sdcc -c "$<" -DSTM8S003 -I"/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/include" -I/usr/share/sdcc/include -I/home/boris/programy/stm8s-sdcc/inc -O0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)"
	@echo 'Finished building: $<'
	@echo ' '

src/stm8s_it.o: /home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	sdcc -c "$<" -DSTM8S003 -I"/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/include" -I/usr/share/sdcc/include -I/home/boris/programy/stm8s-sdcc/inc -O0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)"
	@echo 'Finished building: $<'
	@echo ' '

src/stm8s_tim2.o: /home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/src/stm8s_tim2.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	sdcc -c "$<" -DSTM8S003 -I"/home/boris/dokumenty/pokusy/c++/voliera/voliera_stm8/include" -I/usr/share/sdcc/include -I/home/boris/programy/stm8s-sdcc/inc -O0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)"
	@echo 'Finished building: $<'
	@echo ' '


