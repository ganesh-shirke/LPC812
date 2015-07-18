	.syntax unified
	.thumb
	.text
	.align
	.thumb_func
	.global memory

memory:

# myint loaded in R1
	ldr R0, =myint
	ldm R0, {R1}

# string loaded in R1,R2,R3,R4
	ldr R0, =hellostring
	ldm R0!, {R1-R4}

# load array in R1,R2,R3,R4,R5
	ldr R0, =array_initialized
	ldm R0!, {R1-R5}

# copy array to RAM.
	ldr R0, =ram_start
	ldm R0, {R0}
	stm R0!, {R1-R5}

#stack usage
	push {R1-R5}
	movs R1,#12
	movs R2,#13
	movs R3,#14
	movs R4,#15
	movs R5,#16
	pop {R1-R5}
	bx lr

#.rodata declaration
	.section .rodata
	.align 2                    /* Align to a 4-byte (2^2) boundary */
	myint:
	.word  0x01234567           /* A 32-bit variable named myint */

	/***
	 * STRINGS
	 * =======
	 *
	 * Declare a label called "hellostring" which points to the zero-terminated
	 * string "Hello World"
	 ***/
	hellostring:
	.string "Hello World"

	/***
	 * ARRAYS
	 * =======
	 *
	 * Declare "array_initialized" with 5 32-bit words, also declare an
	 * uninitialized array called "array_uninitialized" with space for 10
	 * 32-bit words (40 bytes).
	 ***/
	.align 2
	array_initialized:
	.word 1,2,3,4,5

	array_uninitialized:
	.skip 40

	.align 2
	ram_start:
	.word 0x10000000
