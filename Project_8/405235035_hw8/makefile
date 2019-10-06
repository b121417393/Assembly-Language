all: hw8 hw8simd random

hw8: hw8.c
	gcc hw8.c -g -msse4 -o hw8
hw8simd: hw8simd.c
	gcc hw8simd.c -g -msse4 -o hw8simd	
random: random.c
	gcc random.c -g -o random

clean:
	rm hw8 hw8simd random
