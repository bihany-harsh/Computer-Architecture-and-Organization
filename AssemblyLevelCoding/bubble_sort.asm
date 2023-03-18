swap:	
		sll		$t1, $a1, 2
		add		$t1, $a0, $t1
		
		lw		$t0, 0($t1)
		lw		$t2, 4($t1)
		
		sw		$t0, 0($t1)
		sw		$t2, 4($t1)
		
		jr		$ra
		
		
sort:
		# saving the registers
		addi	$sp, $sp, -20
		sw		$ra, 16($sp)
		sw		$s3, 12($sp)
		sw		$s2, 8($sp)
		sw		$s1, 4($sp)
		sw		$s0, 0($sp)
		#####################
		
		# moving the parameters
		move	$s2, $a0
		move 	$s3, $a1
		#####################
		
		# outer loop
		move	$s0, $zero
for1tst:
		slt		$t0, $s0, $s3
		beq		$t0, $zero, exit1
		#####################
		
		# inner loop
		addi	$s1, $s0, -1
for2tst:
		slti	$t0, $s1, 0
		bne		$t0, $zero, exit2
		sll		$t1, $s1, 2
		add		$t2, $s2, $t1
		lw		$t3, 0($t2)
		lw		$t4, 4($t2)
		slt		$t0, $t4, $t3
		beq		$t0, $zero, exit2
		######################
		
		# pass parameters and call
		move	$a0, $s2
		move	$a1, $s1
		jal		swap
		######################
		
		# completing the inner loop
		addi	$s1, $s1, -1
		j 		for2tst
		######################
		
		# completing the outer loop
exit2:	
		addi	$s0, $s0, 1
		j 		for1tst
		######################
		
		# restoring registers
exit1:	
		lw		$s0, 0($sp)
		lw		$s1, 4($sp)
		lw		$s2, 8($sp)
		lw		$s3, 12($sp)
		lw		$ra, 16($sp)
		addi	$sp, $sp, 20
		
		jr		$ra


		# DRIVER CODE
.data
array: .word 5, 3, 1, 4, 2   # array to be sorted
size: .word 5                 # size of the array
newline: .asciiz "\n"

.text
main:
  # load array and size
  la $a0, array
  lw $a1, size
  
  # print original array
  li $v0, 4
  la $a0, newline
  syscall
  la $a0, array
  li $a1, 5
  li $v0, 1
print_loop:
  beq $a1, $zero, sort_array
  lw $t0, ($a0)
  move $a0, $t0
  syscall
  li $v0, 4
  la $a0, newline
  syscall
  addi $a0, $a0, 4
  addi $a1, $a1, -1
  j print_loop

sort_array:
  # call sort function
  jal sort

  # print sorted array
  li $v0, 4
  la $a0, newline
  syscall
  la $a0, array
  li $a1, 5
  li $v0, 1
print_loop2:
  beq $a1, $zero, exit
  lw $t0, ($a0)
  move $a0, $t0
  syscall
  li $v0, 4
  la $a0, newline
  syscall
  addi $a0, $a0, 4
  addi $a1, $a1, -1
  j print_loop2

exit:
  li $v0, 10  # exit program
  syscall
