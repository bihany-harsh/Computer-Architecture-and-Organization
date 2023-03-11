power:
        bne     $a1, $zero, recursion
        li      $v0, 1
        jr      $ra

recursion:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
        addi    $a1, $a1, -1
        jal     power
        mul     $v0, $v0, $a0
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra

main:
        li      $a0, 5
        li      $a1, 3
        jal     power

        move    $a0, $v0        # display the result
        li      $v0, 1
        syscall

        li      $v0, 10
        syscall