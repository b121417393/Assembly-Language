/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

main:
    mov ip, sp
    stmfd sp!, {fp, ip, lr, pc}
    sub fp, ip, #4

    mov r0, #38        	/* set argument value a = 38 */
    mov r1, #24         /* set argument value b = 24 */

    bl gcd
    nop

    ldmea fp, {fp, sp, pc}
    .end
