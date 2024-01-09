# Assignment 1 Template

	.text
       	.globl main

#declaring section of code tag
  main:

    lui $s0, 0x1000 # set up a base register for memory access 



# Print prompts and read 2 integers

    # print string input1

     addi $a0, $s0, 12 # load address of input1 into $a0 (la $a0, input1)
     addi $v0, $0, 4 # syscall to print string
     syscall



    # read first integer

     addi $v0, $0, 5 # syscall to print string
     syscall
     add $t0, $0, $v0 #$t0 = 0 + $v0

     



    # print string input2
     addi $a0, $s0, 29 # load address of input1 into $a0 (la $a0, input1)
     addi $v0, $0, 4 # syscall to print string
     syscall



    # read second integer
	
     addi $v0, $0, 5 # syscall to print string
     syscall
     add $t1, $0, $v0 #$t1 = 0 + $v0
     



    # compare them and store the smaller in $t0 and the larger in $t1

    slt $t2 $t1,$t0 # $t2 = ($t1 < $t0)  
    beq $t2,$0,location # If In the correct order go to location
    add $t3,$0,$t1 # $t3 = 0 + $t1
    add $t1,$0,$t0 # $t1 = 0 + $t0 
    add $t0,$0,$t3 # $t0 = 0 + $t3 



location:
    sw $t0, 0($s0) # store $t0 in A (smaller) 
    sw $t1, 4($s0) # store $t1 in B (larger) 

# Subtract the smaller from the larger and store the result in C


   sub $t3, $t1, $t0  #$t3 = $t1 - $t0
   sw $t3, 8($s0)  # switch 8($s0) to $t3




# Print A, B, and C with the corresponding label first

     # print the label and B
       addi $a0, $s0, 46 # load address of string larger
       addi $v0, $0, 4 # syscall to print string
       syscall
       lw $a0, 4($s0) # load B in $a0
       addi $v0, $0, 1 # syscall to print integer
       syscall

     # print the label and A
       addi $a0, $s0, 64 # load address of string larger
       addi $v0, $0, 4 # syscall to print string
       syscall
       lw $a0, 0($s0) # load B in $a0
       addi $v0, $0, 1 # syscall to print integer
       syscall

     # print the label and C
       addi $a0, $s0, 83 # load address of string larger
       addi $v0, $0, 4 # syscall to print string
       syscall
       lw $a0, 8($s0) # load B in $a0
       addi $v0, $0, 1 # syscall to print integer
       syscall

     addi $v0, $0, 10  # syscall to end the program
     syscall

.data 0x10000000

A:  .word 0 # store here the smaller integer
B:  .word 0 # store here the larger integer
C:  .word 0 # store here the quotient

input1:     .asciiz "First integer : "
input2:     .asciiz "Second integer: "
larger:     .asciiz "\nLarger Integer: "
smaller:    .asciiz "\nSmaller Integer: "
difference: .asciiz "\nDifference: "

