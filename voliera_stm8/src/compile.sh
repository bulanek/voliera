sdcc  -mstm8 -o stm8s_gpio.rel -c stm8s_gpio.c  -L/usr/share/sdcc/lib/stm8/ -lstm8 -I/usr/share/sdcc/include/stm8/  -I ../include/ -I /home/boris/programy/stm8s-sdcc/inc -DSTM8S003 --verbose
sdcc  -mstm8 -o main.rel -c main.c  -L/usr/share/sdcc/lib/stm8/ -lstm8 -I/usr/share/sdcc/include/stm8/  -I ../include/ -I /home/boris/programy/stm8s-sdcc/inc -DSTM8S003 --verbose

sdcc  -mstm8 -o voliera.hex stm8s_gpio.rel main.rel -L/usr/share/sdcc/lib/stm8/ -lstm8 -I/usr/share/sdcc/include/stm8 -DSTM8S003 -I../include --verbose
