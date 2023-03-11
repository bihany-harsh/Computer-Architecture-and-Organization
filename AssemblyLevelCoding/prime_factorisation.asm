        .data
q:      .asciiz "Enter a number to factor "
r:      .asciiz "The prime factorization of "
r2:     .asciiz " is "
comma:  .asciiz ", "
n1:     .asciiz "\n"
        .text

main:
        # Request a number from the user
        li      $v0, 4
        la      $a0, q
        syscall

        li      $v0, 5
        syscall
        move    $t0, $v0        # transfer the number to $t0

        # Display the prime factorization
        li      $v0, 4
        la      $a0, r
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 4
        la      $a0, r2    
        syscall

        # CODE

# while (i < n) {
#     if (n%i == 0) {
#         printf("%d", i);
#         n /= i;
#     }
#     else {
#         i++;
#     }
# }
# printf("%d\n", n);

        li      $t1, 2          # counter, starting from 2

while:  bge     $t1, $t0, endLoop

        div     $t0, $t1
        mfhi    $t2             # n % i
        bne     $t2, $zero, else
        
        # "if" condition
        li      $v0, 1
        move    $a0, $t1
        syscall

        li      $v0, 4
        la      $a0, comma
        syscall

        mflo    $t0             # n /= i
        j       while

else:   addi    $t1, $t1, 1
        j       while        

endLoop:
        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 4
        la      $a0, n1
        syscall
