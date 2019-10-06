.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set SWI_Write, 0x5
.set SWI_Read, 0x6
.set SWI_FLen, 0xC
.set AngelSWI, 0x123456

/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

.input_filename:
	.ascii "input.txt\000"

.readbuffer:
	.space 4

.output_filename:
	.ascii "output.txt\000"

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

.open_inputfile_param:
	.word .input_filename       /* the address of file name (path) */
	.word 0x2                   /* argument (Read) */
	.word 0x9                   /* length of file name */
.open_outputfile_param:
	.word .output_filename      /* the address of file name (path) */
	.word 0x4                   /* argument (Write) */
	.word 0xA                   /* length of file name */

.flen_param:
	.space 4                /* file descriptor */

.read_param:
	.space 4                /* file descriptor */
	.word .readbuffer       /* address of the read buffer */
	.word 0x1               /* # of bytes to be read */
.write_param:
	.space 4        /* file descriptor */
	.space 4        /* address of the string */
	.word 0x1       /* length of the string */

.close_param:
	.space 4        /* file descriptor */

main:
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4

    /* open the input file */
	mov r0, #SWI_Open
	adr r1, .open_inputfile_param
	swi AngelSWI
	mov r7, r0          /* r7 is input file descriptor */

    /* open the output file */
	mov r0, #SWI_Open
	adr r1, .open_outputfile_param
	swi AngelSWI
	mov r8, r0          /* r8 is output file descriptor */

    /* get the number of characters in the input file */
    mov r0, #SWI_FLen
    adr r1, .flen_param
    str r7, [r1, #0]
	swi AngelSWI
    mov r9 ,r0          /* r9 is the number of characters in the input file */
     

loop:
    cmp r9, #0
    beq end

    /* read a charater from input file */
    mov r0, #SWI_Read
    adr r1, .read_param
    str r7, [r1, #0]    /* r7 is input file descriptor */
    swi AngelSWI

    /* Determine if the character is uppercase */
    ldr r5, [r1, #4]    /* r5 is the address of readbuffer */
    ldrb r4, [r5, #0]   /* r4 is the read data */
    cmp r4, #97
    blt copy
    cmp r4, #122
    bgt copy

    /* the character is lower case letters */
	sub r4, r4, #32
    strb r4, [r5, #0]
    /* write data to a file */
    mov r0, #SWI_Write
    adr r1, .write_param
	str r8, [r1, #0]    /* store file descriptor */
	str r5, [r1, #4]    /* store the address of string */
    swi AngelSWI

    /* continue the loop */
    sub r9, #1
    b loop

copy:
    /* the character isn't lower case letters */
    /* write data to a file */
    mov r0, #SWI_Write
    adr r1, .write_param
    str r8, [r1, #0]    /* store file descriptor */
    str r5, [r1, #4]    /* store the address of string */
    swi AngelSWI

    /* continue the loop */
    sub r9, #1
    b loop

end:
	ldmea fp, {fp, sp, pc}

