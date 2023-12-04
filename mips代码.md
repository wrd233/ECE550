```assembly
j main



# over()
addi $1 $0 1
OverLoop:
beq $30 $1 Overrnt0		# if($30 == 1)，那么就是over了
addi $2 $0 0 					#2=result
addi $3 $0 0
beq $3 $28 OverEndLoop
lw $4 20($0)
srl $4 $4 $3
and $4 $1 $4
or $2 $2 $4
addi $3 $3 1
j OverLoop
add $30 $0 $2
j endOver
addi $30 $0 0
jr $31




# clearLine()
addi $22 $29 -1
bgt $0 $22 clearLineEndLoop
addi $23 $0 0
beq $23 $28 wholeLineIsOneEndLoop
lw $7 20($22)
srl $7 $7 $23
addi $25 $0 1
and $7 $7 $25
beq $7 $25 wholeLineIsOneLoopContinue
addi $9 $0 0
j endwholeLineIsOne
addi $23 $23 1
j wholeLineIsOneLoop
addi $9 $0 1
beq $9 $0 clearLineContinue
add $26 $0 $22
beq $0 $26 moveDownBackgroundFromEndLoop1
addi $1 $28 -1
addi $8 $26 -1
lw $7 20($8)
sw $7 20($26)
addi $26 $26 -1
j moveDownBackgroundFromLoop1
sw $0 20($0)
addi $17 $17 10
addi $22 $22 1
addi $22 $22 -1
j clearLineLoop
add $0 $0 $0
jr $31



# currentBlockCanMoveDown()
addi $22 $0 0
addi $23 $0 15
bgt $22 $23 currentBlockCanMoveDownendloop
addi $24 $0 2
srl $25 $22 $24
addi $3 $0 3
and $26 $22 $3
srl $12 $18 $22
addi $1 $0 1
and $12 $12 $1
beq $12 $0 currentBlockCanMoveDowncontinue
add $11 $14 $25
sub $12 $29 $1
beq $11 $12 currentBlockCanMoveDownrnt0
addi $11 $11 1
bgt $0 $11 currentBlockCanMoveDowncontinue
lw $12 20($11)
add $11 $13 $26
srl $12 $12 $11
addi $11 $0 1
and $12 $12 $11
beq $12 $11 currentBlockCanMoveDownrnt0
addi $22 $22 1
j currentBlockCanMoveDownloop
add $0 $0 $0
addi $30 $0 1
j endcurrentBlockCanMoveDown
addi $30 $0 0
jr $31




addi $3 $0 3
addi $5 $0 5
addi $15 $15 1
bgt $5 $15 1
addi $15 $15 -5
addi $2 $0 2
sll $4 $15 $2
add $4 $4 $16
lw $18 0($4)
addi $13 $0 7
addi $14 $0 -3
jr $31


# renewBackground()
add $0 $0 $0
addi $22 $0 0
addi $23 $0 15
bgt $22 $23 renewBackgroundendloop
srl $5 $18 $22
addi $1 $0 1
and $5 $5 $1
beq $5 $1 renewBackgroundnormalcase
addi $22 $22 1
j renewBackgroundloop
addi $24 $0 2
srl $26 $22 $24
addi $1 $0 3
and $27 $22 $1
add $11 $26 $14
bgt $0 $11 renewBackgroundcontinue
lw $12 20($11)
add $24 $13 $27
addi $1 $0 1
sll $1 $1 $24
or $12 $12 $1
sw $12 20($11)
j renewBackgroundcontinue
addi $17 $17 1
jr $31



# renewinfo()
addi $22 $0 97
beq $22 $21 left
addi $22 $0 100
beq $22 $21 right
addi $22 $0 119
beq $22 $21 rotate
j endrenewInfo
add $0 $0 $0
addi $23 $0 -1
addi $25 $0 15
addi $24 $0 0
bgt $24 $25 canmove0endloop
srl $26 $18 $24
addi $1 $0 1
and $26 $26 $1
beq $26 $0 canmove0continue
addi $1 $0 2
srl $3 $24 $1
addi $1 $0 3
and $2 $24 $1
add $2 $2 $13
add $2 $2 $23
add $3 $3 $14
bgt $0 $2 canmove0blockOverlaprnt1
addi $5 $28 -1
bgt $2 $5 canmove0blockOverlaprnt1
addi $5 $29 -1
bgt $3 $5 canmove0blockOverlaprnt1
bgt $0 $3 canmove0blockOverlaprnt0
lw $6 20($3)
srl $6 $6 $2
addi $8 $0 1
and $6 $6 $8
beq $6 $8 canmove0blockOverlaprnt1
addi $4 $0 0
j canmove0endblockOverlap
addi $4 $0 1
addi $8 $0 1
beq $4 $8 canmove0rnt0
addi $24 $24 1
j canmove0loop
add $0 $0 $0
addi $9 $0 1
j endcanmove0
addi $9 $0 0
beq $9 $0 endrenewInfo
addi $13 $13 -1
j endrenewInfo
add $0 $0 $0
add $0 $0 $0
addi $23 $0 1
addi $25 $0 15
addi $24 $0 0
bgt $24 $25 canmove1endloop
srl $26 $18 $24
addi $1 $0 1
and $26 $26 $1
beq $26 $0 canmove1continue
addi $1 $0 2
srl $3 $24 $1
addi $1 $0 3
and $2 $24 $1
add $2 $2 $13
add $2 $2 $23
add $3 $3 $14
bgt $0 $2 canmove1blockOverlaprnt1
addi $5 $28 -1
bgt $2 $5 canmove1blockOverlaprnt1
addi $5 $29 -1
bgt $3 $5 canmove1blockOverlaprnt1
bgt $0 $3 canmove1blockOverlaprnt0
lw $6 20($3)
srl $6 $6 $2
addi $8 $0 1
and $6 $6 $8
beq $6 $8 canmove1blockOverlaprnt1
addi $4 $0 0
j canmove1endblockOverlap
addi $4 $0 1
addi $8 $0 1
beq $4 $8 canmove1rnt0
addi $24 $24 1
j canmove1loop
add $0 $0 $0
addi $9 $0 1
j endcanmove1
addi $9 $0 0
beq $9 $0 endrenewInfo
addi $13 $13 1
j endrenewInfo
add $0 $0 $0
add $0 $0 $0
addi $1 $16 1
addi $3 $0 3
and $1 $1 $3
addi $2 $0 2
sll $4 $15 $2
add $1 $4 $1
lw $1 0($1)
addi $25 $0 15
addi $24 $0 0
bgt $24 $25 canRotateendloop
srl $26 $1 $24
addi $10 $0 1
and $26 $26 $10
beq $26 $0 canRotatecontinue
addi $10 $0 2
srl $3 $24 $10
addi $10 $0 3
and $2 $24 $10
add $2 $2 $13
add $3 $3 $14
bgt $0 $2 canRotateblockOverlaprnt1
addi $5 $28 -1
bgt $2 $5 canRotateblockOverlaprnt1
addi $5 $29 -1
bgt $3 $5 canRotateblockOverlaprnt1
bgt $0 $3 canRotateblockOverlaprnt0
lw $6 20($3)
srl $6 $6 $2
addi $8 $0 1
and $6 $6 $8
beq $6 $8 canRotateblockOverlaprnt1
addi $4 $0 0
j canRotateendblockOverlap
addi $4 $0 1
addi $8 $0 1
beq $4 $8 canRotaternt0
addi $24 $24 1
j canRotateloop
add $0 $0 $0
addi $9 $0 1
j endcanRotate
addi $9 $0 0
beq $9 $0 endrenewInfo
addi $16 $16 1
addi $3 $0 3
and $16 $16 $3
addi $2 $0 2
sll $4 $15 $2
add $1 $4 $16
lw $18 0($1)
j endrenewInfo
jr $31





# 可能是updateregs()
addi $22 $0 0
addi $24 $0 15
lw $1 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $1 $1 $23
addi $22 $22 1
lw $2 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $2 $2 $23
addi $22 $22 1
lw $3 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $3 $3 $23
addi $22 $22 1
lw $4 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $4 $4 $23
addi $22 $22 1
lw $5 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $5 $5 $23
addi $22 $22 1
lw $6 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $6 $6 $23
addi $22 $22 1
lw $7 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $7 $7 $23
addi $22 $22 1
lw $8 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $8 $8 $23
addi $22 $22 1
lw $9 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $9 $9 $23
addi $22 $22 1
lw $10 40($22)
addi $22 $22 1
lw $23 40($22)
sll $23 $23 $24
or $10 $10 $23
jr $31




# refreshBackground()
add $0 $0 $0
addi $27 $0 0
addi $1 $0 0
addi $3 $0 20
beq $3 $1 endreplaceloop
lw $2 20($1)
sw $2 40($1)
addi $1 $1 1
j replaceloop
add $0 $0 $0
beq $27 $29 refreshBackgroundendloop1
addi $26 $0 0
beq $26 $28 refreshBackgroundendloop2
lw $19 40($27)
srl $22 $19 $26
addi $1 $0 1
and $22 $22 $1
bgt $13 $26 refreshBackgroundendif1
addi $24 $13 3
bgt $26 $24 refreshBackgroundendif1
bgt $14 $27 refreshBackgroundendif1
addi $24 $14 3
bgt $27 $24 refreshBackgroundendif1
sub $24 $27 $14
addi $25 $0 2
sll $24 $24 $25
add $24 $24 $26
sub $24 $24 $13
srl $25 $18 $24
and $25 $25 $1
or $22 $25 $22
sll $22 $22 $26
or $19 $19 $22
sw $19 40($27)
addi $26 $26 1
j refreshBackgroundloop2
addi $27 $27 1
j refreshBackgroundloop1
jr $31




# init()
add $0 $0 $0
addi $1 $0 0
addi $2 $0 0
addi $3 $0 0
addi $4 $0 0
addi $5 $0 0
addi $6 $0 0
addi $7 $0 0
addi $8 $0 0
addi $9 $0 0
addi $10 $0 0
input $21
addi $22 $0 45
beq $21 $22 init
sw $1 20($0)
sw $1 21($0)
sw $1 22($0)
sw $1 23($0)
sw $1 24($0)
sw $1 25($0)
sw $1 26($0)
sw $1 27($0)
sw $1 28($0)
sw $1 29($0)
sw $1 30($0)
sw $1 31($0)
sw $1 32($0)
sw $1 33($0)
sw $1 34($0)
sw $1 35($0)
sw $1 36($0)
sw $1 37($0)
sw $1 38($0)
sw $1 39($0)
sw $1 40($0)
addi $12 $0 0
addi $11 $0 1632
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1632
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1632
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1632
sw $11 0($12)
addi $12 $12 1
addi $11 $0 17476
sw $11 0($12)
addi $12 $12 1
addi $11 $0 3840
sw $11 0($12)
addi $12 $12 1
addi $11 $0 8738
sw $11 0($12)
addi $12 $12 1
addi $11 $0 240
sw $11 0($12)
addi $12 $12 1
addi $11 $0 610
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1248
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1124
sw $11 0($12)
addi $12 $12 1
addi $11 $0 3648
sw $11 0($12)
addi $12 $12 1
addi $11 $0 736
sw $11 0($12)
addi $12 $12 1
addi $11 $0 17504
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1856
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1570
sw $11 0($12)
addi $12 $12 1
addi $11 $0 3616
sw $11 0($12)
addi $12 $12 1
addi $11 $0 8800
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1136
sw $11 0($12)
addi $12 $12 1
addi $11 $0 1604
sw $11 0($12)
addi $12 $12 1
addi $13 $0 7
addi $14 $0 -3
addi $15 $0 0
addi $16 $0 0
addi $17 $0 0
addi $28 $0 15
addi $29 $0 20
addi $22 $0 1
addi $20 $0 2
sll $18 $15 $20
add $18 $18 $16
lw $18 0($18)
addi $23 $0 1
addi $24 $0 21
sll $23 $23 $24
sw $23 70($0)
addi $1 $0 0
addi $2 $0 0
addi $3 $0 0
addi $4 $0 0
addi $5 $0 0
addi $6 $0 0
addi $7 $0 0
addi $8 $0 0
addi $9 $0 0
addi $10 $0 0
jr $31

# waitHalfSecond()
add $0 $0 $0
add $0 $0 $0
addi $22 $0 0
lw $23 70($0)
bgt $22 $23 waitHalfSecondendloop
input $21
addi $25 $0 77
beq $21 $25 pause
addi $22 $22 1
j waitHalfSecondloop
j endpause
input $21
addi $25 $0 33
beq $25 $21 waitHalfSecondloop
j pause
addi $26 $0 6
addi $24 $0 16384
sll $26 $24 $26
beq $23 $26 1
sub $23 $23 $24
sw $23 70($0)
jr $31

# main()开始的地方
add $0 $0 $0
jal init
jal refreshBackground
jal currentBlockCanMoveDown
jal Over
addi $1 $0 1
beq $30 $1 endmain	# 根据Over()的返回值(存储在$30)来判断是否结束游戏
addi $21 $0 0
input $21
addi $22 $0 45
beq $21 $22 main
jal renewInfo
jal currentBlockCanMoveDown
addi $1 $0 1
beq $30 $1 mainendif
addi $20 $0 15
jal renewBackground
jal clearLine
jal createNewBlock
addi $14 $14 1
jal updateregs
jal waitHalfSecond
j while
add $0 $0 $0
jal updateregs
input $21
addi $22 $0 45
beq $22 $21 main
j endmain

```



背景知识：如下MIPS代码实现了一个俄罗斯方块的游戏，其中寄存器20-40存储了20个size为15bit的数据，用来表示20行15列的游戏界面，寄存器41存储了

```c
#include <stdio.h>

int memory[1000]; // Assuming a memory array to store values

void init() {
    int i;
    for (i = 0; i < 20; i++) {
        memory[i] = 0; // Initializing memory locations
    }
    // Other initialization steps
}

void refreshBackground() {
    // Implementation of background refresh
    // Loops and updates on memory
}

int currentBlockCanMoveDown() {
    // Implementation to check if the current block can move down
    // Returns 1 if true, 0 otherwise
}

void Over() {
    // Implementation for the Over section
    // Game over conditions
}

void renewInfo() {
    // Implementation to renew game information
    // Updates registers and memory
}

void renewBackground() {
    // Implementation to renew the background
    // Loops and conditional checks
}

void clearLine() {
    // Implementation to clear a line
    // Based on certain conditions
}

void createNewBlock() {
    // Implementation to create a new block
}

void updateregs() {
    // Implementation to update registers
    // Based on certain conditions
}

void waitHalfSecond() {
    // Implementation to pause the program for half a second
}

int main() {
    init();
    
    while (1) {
        refreshBackground();
        
        if (!currentBlockCanMoveDown()) {
            Over();
        }
        
        int input;
        scanf("%d", &input); // Assuming input is read from the user
        
        if (input == 45) {  // ASCII code for '-'
            break;  // Exit the main loop
        }
        
        renewInfo();
        
        if (!currentBlockCanMoveDown()) {
            break;  // Exit the main loop if the block cannot move down
        }
        
        renewBackground();
        clearLine();
        createNewBlock();
        
        updateregs();
        waitHalfSecond();
    }

    return 0;
}

```

