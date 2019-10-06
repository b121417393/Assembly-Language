/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global gcd
	.type gcd,%function

gcd:
    mov ip, sp
    stmfd sp!, {fp, ip, lr, pc}
    sub fp, ip, #4

    cmp r0, r1          /* r0 = a = 65 , r1 = b = 45 */
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
    ldmea fp, {fp, sp, pc}
    .end
