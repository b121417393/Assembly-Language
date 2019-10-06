/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable A --- */
	.type A, %object
	.size A, 24
A:
	.word 1     /*  Matrix A  */
	.word 2     /* ---------- */
   	.word 3     /*    1   2   */
    .word 4     /*    3   4   */
    .word 5     /*    5   6   */
    .word 6     /* ---------- */

/* --- variable B --- */
	.type B, %object
	.size B, 24
B:
	.word 1     /*   Matrix B   */
    .word 2     /* ------------ */
    .word 3     /*  1   2   3   */
    .word 4     /*  4   5   6   */
    .word 5     /* ------------ */
    .word 6

/* --- variable C --- */
C:
	.space 36, 0    /*   Matrix C   */
                    /* ------------ */
                    /*  ?   ?   ?   */
                    /*  ?   ?   ?   */
                    /*  ?   ?   ?   */
                   	/* ------------ */

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

.matrix:
	.word A
	.word B
	.word C

main:

    ldr r0, .matrix         	/* Load Matrix A's address to r0 */
    ldr r9, .matrix + 8     	/* Load Matrix C's address to r9 */
    mov r10, #0             	/* Use r10 as the flag of the loop */

loop:
    add r10, r10, #1        	/* Calculate the first row and flag plus one */

    /* First loop caclulate C(1,1), second loop caclulate C(2,1), third loop caclulate C(3,1) */
    ldr r1, [r0], #4        	/* r1 := mem32[r0] := A(1,1) , and then r0 := r0 + 4 */
    ldr r2, [r0], #4        	/* r2 := mem32[r0] := A(1,2) , and then r0 := r0 + 4 */

    ldr r3, .matrix + 4     	/* Load Matrix B's address to r3 */
    ldr r4, [r3], #12       	/* r4 := mem32[r3] := B(1,1) , and then r3 := r3 + 12 */
    ldr r5, [r3]            	/* r5 := mem32[r3] := B(2,1) */

    mul r6, r1, r4      
    mul r7, r2, r5
    add r8, r6, r7          	/* r8 := A(1,1) * B(1,1) + A(1,2) * B(2,1) */
    str r8, [r9], #4        	/* C(1,1) := mem32[r9] := r8 , and then r9 := r9 + 4 */
     
    /* First loop caclulate C(1,2), second loop caclulate C(2,2), third loop caclulate C(3,2) */
    ldr r3, .matrix + 4         /* Load Matrix B's address to r3 */
    add r3, r3, #4              /* Displace r3 to the position of B(1,2) */
    ldr r4, [r3], #12     	    /* r4 := mem32[r3] := B(1,2) , and then r3 := r3 + 12 */
    ldr r5, [r3]                /* r5 := mem32[r3] := B(2,2) */

    mul r6, r1, r4      
    mul r7, r2, r5
    add r8, r6, r7      	    /* r8 := A(1,1) * B(1,2) + A(1,2) * B(2,2) */
    str r8, [r9], #4   		    /* C(1,2) := mem32[r9] := r8 , and then r8 := r8 + 4 */

    /* First loop caclulate C(1,3), second loop caclulate C(2,3), third loop caclulate C(3,3) */
    ldr r3, .matrix + 4     	/* Load Matrix B's address to r3 */
    add r3, r3, #8          	/* Displace r3 to the position of B(1,3) */
    ldr r4, [r3], #12       	/* r4 := mem32[r3] := B(1,3) , and then r3 := r3 + 12 */
    ldr r5, [r3]            	/* r5 := mem32[r3] := B(2,3) */

    mul r6, r1, r4      
    mul r7, r2, r5
    add r8, r6, r7      	    /* r8 := A(1,1) * B(1,3) + A(1,2) * B(2,3) */
    str r8, [r9], #4    	    /* C(1,3) := mem32[r9] := r8 , and then r8 := r8 + 4 */

    /* Start calculating the next row of the matrix C */
    cmp r10, #3
    blt loop

    ldr r1, .matrix + 8     	/* Load Matrix C's address to r1 */
    nop
    .end
