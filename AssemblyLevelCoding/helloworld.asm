        .data
hello:  .asciiz "Hello World!"
        .text

main:   li $v0, 4 # print string
        la $a0, hello # load address of string
        syscall

        li $v0, 10 # exit
        syscall