all: hw6.exe

hw6.exe: hw6_test.c gcd.s
	arm-none-eabi-gcc hw6_test.c gcd.s -O0 -g -o hw6.exe

clean:
	rm hw6.exe
