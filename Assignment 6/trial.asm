		.data
NUM_OF_BUCKETS:
		.word 	10
array:	.float	0.89, 0.56, 0.65, 0.12, 0.66, 0.34, 0.11, 0.55, 0.33, 0.67, 0.36, 0.99
P:		.word	12
buckets:
		.space 480
countArray:
		.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		# count array is used to store the number of elements in each bucket
endl:	.asciiz "\n"

		.text
insertionSort:
		addi	$sp, $sp -12
		sw		$ra, 8($sp)
		sw		$s1, 4($sp)
		sw		$s0, 0($sp)
		
		addi	$s0, $zero, 0	
insertionLoop:
		slt		$t0, $s0, $a1
		beq		$t0, $zero, exitInsertion
		sll		$t1, $s0, 2
		add 	$t1, $t1, $a0
		lwc1	$f0, 0($t1)		# $f0(val) = arr[i]
		
		add		$s1, $s0, $zero
innerloop:
		blez	$s1, exitinner
		addi	$t1, $s1, -1
		sll		$t1, $s1, 2
		add		$t1, $t1, $a0
		lwc1	$f2, -4($t1)		
		c.le.s	$f2, $f0
		bc1t	exitinner		# exit innerloop if arr[j-1] <= val
		
		sll		$t1, $s1, 2
		add		$t1, $t1, $a0
		lwc1	$f2, -4($t1)
		swc1	$f2, 0($t1)
		addi	$s1, $s1, -1
		
		j 		innerloop

exitinner:
		sll		$t1, $s1, 2
		add		$t1, $t1, $a0	
		swc1	$f0, 0($t1)
		
		addi	$s0, $s0, 1
		
		j		insertionLoop

exitInsertion:
		lw		$ra, 8($sp)
		lw		$s1, 4($sp)
		lw		$s0, 0($sp)
		addi	$sp, $sp, 12

		jr		$ra

main:
        la      $a0, array
        lw      $a1, P

        jal     insertionSort

        li      $t1, 0
        add     $t0, $a0, $zero
print_loop:
        beq     $t1, $a1, exit_print_loop
        lwc1    $f12, ($t0)
        li      $v0, 2
        syscall
        li      $v0, 4
        la      $a0, endl
        syscall
        addi    $t0, $t0, 4
        addi    $t1, $t1, 1
        j       print_loop
exit_print_loop:
        li      $v0, 10
        syscall