.data
array: .space 20         # preallocate space for 5 integers
input_msg: .asciiz "Enter integer: "
output_msg: .asciiz "Array contents: "
newline: .asciiz "\n"

.text
main:
  # initialize variables
  li $t0, 0             # counter for loop
  la $t1, array         # pointer to start of array

  # loop to take input and store in array
  loop:
    bge $t0, 5, print   # if counter >= 5, exit loop and print array
    li $v0, 4           # print input message
    la $a0, input_msg
    syscall
    li $v0, 5           # read integer from user input
    syscall
    sw $v0, ($t1)        # store integer in array
    addi $t0, $t0, 1    # increment counter
    addi $t1, $t1, 4    # move pointer to next array element
    j loop              # repeat loop

  # print array contents
  print:
    li $t0, 0           # reset counter to 0
    li $v0, 4           # print output message
    la $a0, output_msg
    syscall
	la $t1, array
    loop2:
      bge $t0, 5, exit  # if counter >= 5, exit loop
      lw $a0, ($t1)      # load integer from array
      li $v0, 1         # print integer
      syscall
      li $v0, 4         # print newline
      la $a0, newline
      syscall
      addi $t0, $t0, 1  # increment counter
      addi $t1, $t1, 4  # move pointer to next array element
      j loop2           # repeat loop

  # exit program
  exit:
    li $v0, 10          # system call to exit program
    syscall