all: hw5.exe

hw5.exe: hw5_test.s gcd.s
	arm-none-eabi-gcc hw5_test.s gcd.s -O0 -g -o hw5.exe

clean:
	rm hw5.exe
