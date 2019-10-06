/* ===================== */
/*	TEXT section     */
/* ===================== */
	.section .text
	.global main
	.type main,%function

main:
	mov r1, #10	/* set r1 = 10 */
	mov r2, #20	/* set r2 = 20 */
	mov r3, #30	/* set r3 = 30 */
	mov r4, #40	/* set r4 = 40 */

	ADD r0,r1,r2	/* r0 = r1 + r2 */
	ADD r0,r0,r3	/* r0 = r0 + r3 */
	ADD r0,r0,r4	/* r0 = r0 + r4 */

	nop
	.end
