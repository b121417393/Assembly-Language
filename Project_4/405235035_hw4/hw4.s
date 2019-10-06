/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

main:
    mov r0, #40        	/* a = 40 */
    mov r1, #24         /* b = 24 */

    cmp r0, r1
    bne loop            /* if a != b , then start the loop */
    b   end             /* if a == b , then it ends */

loop:
    cmp r0, r1
    subgt r0, r0, r1    /* If a > b , then a = a - b */
    suble r1, r1, r0    /* If a <= b , then b = b - a */

    cmp r0, r1
    bne loop            /* if a != b , then continue to loop */
    b end               /* if a == b , then it ends */

end:
    nop
    .end
