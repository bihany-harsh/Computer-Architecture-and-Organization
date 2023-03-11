factorial:
        bgt     $a0, $zero, recurse
        li      $v0, 1
        jr      $ra

recurse:
        addi    $sp, $sp, -8
        sw      $ra, 4($sp)
        sw      $a0, 0($sp)

        addi    $a0, $a0, -1
        jal     factorial

        lw      $t0, 0($sp)
        multu   $v0, $t0
        mflo    $v0

        lw      $ra, 4($sp)
        addi    $sp, $sp, 8
        jr      $ra

            .data
prompt:     .asciiz "Input an integer x:\n"
result:     .asciiz "Fact(x) = "
            .text
main:
        # show prompt
        li      $v0, 4
        la      $a0, prompt
        syscall
        # read x
        li      $v0, 5
        syscall


        # function call
        move    $a0, $v0
        jal     factorial # jump factorial and save position to $ra
        move    $t0, $v0 # $t0 = $v0
        # show prompt
        li      $v0, 4
        la      $a0, result
        syscall

# print the result
        li      $v0, 1 # system call #1 - print int
        move    $a0, $t0 # $a0 = $t0
        syscall # execute

# return 0
        li      $v0, 10 # $v0 = 10
        syscall