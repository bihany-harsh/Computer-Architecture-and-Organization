        .data
prompt: .asciiz "Enter your number "
return: .asciiz "Your entered "
endl:   .asciiz "\n"
        .text

main:   
        li		$v0, 4 # print string
        la      $a0, prompt
        syscall

        li      $v0, 5 # read from the console
        syscall

        move    $t0, $v0 # store the value in $t0

        li      $v0, 4 # print string
        la      $a0, endl
        syscall
        la      $a0, return
        syscall

        li      $v0, 1 # print integer
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall