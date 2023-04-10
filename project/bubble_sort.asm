.data
array: .space 40
prompt: .asciiz "Enter a number: "
spacee: .asciiz " "
output: .asciiz "\n The numbers are: "
avg: .asciiz "\n Average :"
med: .asciiz "\n Median :"
fp1: .float 10.0
fp2: .float 00.0
bucket: .space 80
.text

main:
li $t1,10    #load 10 into $t1
la $a1,array #load a pointer to array into $a1

loop:
   addi $t1,$t1,-1 #subtract 1 from $t1 to update loop
   li $v0,4        #print string
   la $a0 , prompt
   syscall        #taking input float
   li $v0,6       
   syscall
   swc1 $f0,0($a1)      #storing float
   addi $a1,$a1,4        #add 4 to $a1
   bnez $t1,loop     #if $t1 is not zero go to loop
   li $t1,9            # if zero load 9 into $t1
   li $t2,9           # load 9 into $t2
   la $a1,array     # load array pointer into $a1

loop1:
    beqz $t2,here    #if $t2 is zeo go to here
    addi $t2,$t2,-1   # subtract 1 from $t2 save to $t2
    lwc1 $f1,0($a1)      # load an input int into $t5
    lwc1 $f2,4($a1)      #load the next into $t6
    addi $a1,$a1,4      # add 4 to $a1 , save to $a1    
    c.le.s $f1,$f2   #if $t5<=$t6 goto loop1  
    bc1t loop1
    swc1 $f1,0($a1)        #else store $t5 in $a1
    swc1 $f2,-4($a1)      # and store $t6 in $a1 -4 (swaPPING)
    bnez $t2,loop1       # go back to loop

here:
    la $a1,array       # load array into $ a1
    addi $t1,$t1,-1    # subtract 1 frpm $t1 loop counter
    add $t2,$t2,$t1   # add $t2 to $t1 save to $t2
    bnez $t1,loop1     #if t1 is not zero goto loop1
    li $v0,4            #print string
    la $a0,output      
    syscall         #displaying message
    la $a1, array     
    li $t1, 10

loop2:
    li $v0,2      # print float
    lwc1 $f12,0($a1)
    syscall
    li $v0,4
    la $a0,spacee
    syscall
    addi $a1,$a1,4    # array shift
    addi $t1,$t1,-1   # loop counter
    bnez $t1,loop2

print:
    li$v0,4
    la $a0,spacee
    syscall
    li $v0,4
    syscall
    move $a0,$t7
    li $v0,1
    syscall
li $v0,10
syscall