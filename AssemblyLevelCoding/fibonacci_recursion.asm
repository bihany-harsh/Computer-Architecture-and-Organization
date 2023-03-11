fibonacci:
        # check termination conditions
        li      $t0, 1
        bgt     $a0, $t0, recurse

        bne     $a0, $zero, one
        li      $v0, 0
        jr      $ra
one:
        li      $v0, 1
        jr      $ra

recurse:
        # f(n) = f(n-1) + f(n-2)
        addi    $sp, $sp, -12
        sw      $ra, 8($sp)
        sw      $a0, 4($sp)

        addi    $a0, $a0, -1    # x-1
        jal     fibonacci       # f(x-1)
        sw      $v0, 0($sp)

        lw      $a0, 4($sp)
        addi    $a0, $a0, -2    # x-2
        jal     fibonacci       # f(x-2)

        lw      $t0, 0($sp)
        add     $v0, $t0, $v0

        lw      $ra, 8($sp)
        addi    $sp, $sp, 12
        jr      $ra
