		.data
NUM_OF_BUCKETS:
		.word 	10
array:	.float	0.89, 0.56, 0.65, 0.12, 0.66, 0.34, 0.11, 0.55, 0.33, 0.67, 0.36, 0.99
P:		.word	12        				# to be changed if tested (length of the above error)
buckets:
		.space 480						# to be changed if tested (NUM_OF_BUCKETS(10) * P * 4)
countArray:
		.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		# count array is used to store the number of elements in each bucket
endl:	.asciiz "\n"

		.text

main:
        lw		$t0, P					# size of the array
		lw		$t1, NUM_OF_BUCKETS
		la		$t2, array				# base address of the array
		la		$t3, buckets			# base address of the buckets
		la		$t4, countArray			# base address of the countArray

        # BUCKET SORT IMPLEMENTATION
        # initializing the bucket and count array
        # for (int i = 0; i < size_of_arr; i++)
		# {	
		# 	int index = (int)(arr[i]*NUM_OF_BUCKETS);
		# 	buckets[index*size_of_arr + countArray[index]] = arr[i];
		# 	countArray[index]++;
		# }
        li      $t5, 0
init_loop:
        bge     $t5, $t0, sorting       # exit if i >= size of the array    

        sll     $t6, $t5, 2             # $t6 = i*4
        add     $t6, $t6, $t2           # $t6 = &arr[i]
        lwc1    $f0, ($t6)              # $f0 = arr[i]

        mtc1    $t1, $f1                # $f1 = NUM_OF_BUCKETS
        cvt.s.w $f1, $f1                # $f1 = (float)NUM_OF_BUCKETS
        mul.s   $f2, $f0, $f1           # $f2 = arr[i]*NUM_OF_BUCKETS
        cvt.w.s $f2, $f2                # $f2 = (int)(arr[i]*NUM_OF_BUCKETS)  
        mfc1    $t7, $f2                # $t7 = (int)(arr[i]*NUM_OF_BUCKETS)
        
        sll     $t8, $t7, 2             # $t8 = (int)(arr[i]*NUM_OF_BUCKETS)*4
        add     $t8, $t8, $t4           # $t8 = &countArray[(int)(arr[i]*NUM_OF_BUCKETS)]
        lw      $t9, ($t8)              # $t9 = countArray[(int)(arr[i]*NUM_OF_BUCKETS)]

        mul     $t8, $t7, $t0           # $t8 = (int)(arr[i]*NUM_OF_BUCKETS)*size_of_array
        add     $t8, $t8, $t9           # $t8 = (int)(arr[i]*NUM_OF_BUCKETS)*size_of_array + countArray[(int)(arr[i]*NUM_OF_BUCKETS)]
        sll     $t8, $t8, 2             # $t8 = ((int)(arr[i]*NUM_OF_BUCKETS)*size_of_array + countArray[(int)(arr[i]*NUM_OF_BUCKETS)])*4
        add     $t8, $t8, $t3           # $t8 = &buckets[((int)(arr[i]*NUM_OF_BUCKETS)*size_of_array + countArray[(int)(arr[i]*NUM_OF_BUCKETS)])]
        swc1    $f0, ($t8)              # buckets[((int)(arr[i]*NUM_OF_BUCKETS)*size_of_array + countArray[(int)(arr[i]*NUM_OF_BUCKETS)])] = arr[i]

        addi    $t9, $t9, 1             # countArray[(int)(arr[i]*NUM_OF_BUCKETS)]++
        sll     $t8, $t7, 2             # $t8 = (int)(arr[i]*NUM_OF_BUCKETS)*4
        add     $t8, $t8, $t4           # $t8 = &countArray[(int)(arr[i]*NUM_OF_BUCKETS)]
        sw      $t9, ($t8)              # countArray[(int)(arr[i]*NUM_OF_BUCKETS)] = countArray[(int)(arr[i]*NUM_OF_BUCKETS)] + 1

        addi    $t5, $t5, 1             # i++
        j       init_loop

sorting:
        # Sorting each bucket
        # for (int i = 0; i < NUM_OF_BUCKETS; i++)
        # {
        # 	insertionSort(&buckets[i*size_of_array], countArray[i]);
        # }

        li      $t5, 0                  # $t5 = i
sort_loop:
        bge     $t5, $t1, exit_sort_loop        # exit if i >= NUM_OF_BUCKETS

        mul     $t6, $t5, $t0           # $t6 = i*size_of_array
        sll     $t6, $t6, 2             # $t6 = (i*size_of_array)*4
        add     $t6, $t6, $t3           # $t6 = &buckets[i*size_of_array] = A
        sll     $t7, $t5, 2             # $t7 = i*4
        add     $t7, $t7, $t4           # $t7 = &countArray[i]
        lw      $t8, ($t7)              # $t8 = countArray[i] = lenA

		# applying insertionSort now
		# for (int i = 0; i < lenA; i++)
		# {
		# 	int j = i;
		# 	while (j > 0 && A[j-1] > A[j]) {
		# 		int temp = A[j-1];
		# 		A[j-1] = A[j];
		# 		A[j] = temp;
		#		j--;
		# 	}
		# }

		addi	$s0, $zero, 0			# i = 0
insertion_sort_outer_loop:
		slt		$t7, $s0, $t8		
		beq		$t7, $zero, exit_insertion_outer_loop
		sll		$t9, $s0, 2
		add		$t9, $t9, $t6
		lwc1	$f0, 0($t9)

		add		$s1, $s0, $zero
insertion_sort_inner_loop:
		blez	$s1, exit_insertion_inner_loop
		addi	$t9, $s1, -1
		sll		$t9, $s1, 2
		add		$t9, $t9, $t6
		lwc1	$f2, -4($t9)
		c.le.s  $f2, $f0
		bc1t	exit_insertion_inner_loop

		sll		$t9, $s1, 2
		add		$t9, $t9, $t6
		lwc1	$f2, -4($t9)
		swc1	$f2, 0($t9)
		addi	$s1, $s1, -1

		j		insertion_sort_inner_loop

exit_insertion_inner_loop:
		sll		$t9, $s1, 2
		add		$t9, $t9, $t6
		swc1	$f0, 0($t9)

		addi	$s0, $s0, 1
		j		insertion_sort_outer_loop

exit_insertion_outer_loop:

		addi	$t5, $t5, 1
		j		sort_loop

exit_sort_loop:
        
        # MERGING THE BUCKETS
        # int index = 0;
        # for (int i = 0; i < NUM_OF_BUCKETS; i++)
        # {
        # 	for (int j = 0; j < countArray[i]; j++)
        # 	{
        # 		arr[index++] = buckets[i*size_of_array + j];
        # 	}
        # }
        li      $t5, 0
        li      $t6, 0
merge_outer_loop:
        bge     $t5, $t1, exit_merge_outer_loop
        li      $t7, 0              # $t7 = j
merge_inner_loop:
        sll     $t8, $t5, 2         # $t8 = i*4
        add     $t8, $t8, $t4       # $t8 = &countArray[i]
        lw      $t9, ($t8)          # $t9 = countArray[i]
        bge     $t7, $t9, exit_merge_inner_loop

        mul     $t8, $t5, $t0       # $t8 = i*size_of_array
        add     $t8, $t8, $t7       # $t8 = i*size_of_array + j
        sll     $t8, $t8, 2         # $t8 = (i*size_of_array + j)*4
        add     $t8, $t8, $t3       # $t8 = &buckets[(i*size_of_array + j)]
        lwc1    $f0, ($t8)          # $f0 = buckets[(i*size_of_array + j)]

        sll     $t8, $t6, 2         # $t8 = index*4
        add     $t8, $t8, $t2       # $t8 = &arr[index]
        swc1    $f0, ($t8)          # arr[index] = buckets[(i*size_of_array + j)]

        addi    $t6, $t6, 1         # index++
        addi    $t7, $t7, 1         # j++
        j       merge_inner_loop
exit_merge_inner_loop:
        addi    $t5, $t5, 1         # i++
        j       merge_outer_loop
exit_merge_outer_loop:
        

        # print the sorted array

        add     $a0, $t2, $zero         # $a0 = &buckets
        add     $a1, $t0, $zero         # $a1 = size_of_array
        # mul     $a1, $t0, $t1           # $a1 = size_of_array*NUM_OF_BUCKETS

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