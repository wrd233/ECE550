```assembly
main                               jal init
while                              jal refreshBackground
                                   jal currentBlockCanMoveDown
                                   jal Over
                                   addi $1 $0 1
                                   beq $30 $1 endmain
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
mainendif                          addi $14 $14 1
                                   jal updateregs
                                   jal waitHalfSecond
                                   j while
                                   add $0 $0 $0
endmain                            jal updateregs
                                   input $21
                                   addi $22 $0 45
                                   beq $22 $21 main
                                   j endmain
```

```c++
int main() {
    init();  // 调用初始化函数

    while (1) {  // 进入循环
        refreshBackground();  // 刷新背景
      	currentBlockCanMoveDown();
      	if(Over()){	// 此时游戏结束
          break;
        }
      	int userInput = 0;
	      scanf("%d", &userInput);  // 获取用户输入
      	if(userInput == 45){
          continue;
        }
      	renewInfo();  // 更新信息
      	if(currentBlockCanMoveDown()){	// 此时方块已经无法下降，我们尝试消行+生成新的块
          // $20 = 15
          renewBackground();  // 更新背景
          clearLine();  // 清除行
          createNewBlock();  // 创建新块
        }else{	// 此时方块还能在空中下降，我们让方块下降
					// $14 ++;
          updateregs();  // 更新寄存器
          waitHalfSecond();  // 等待半秒
        }
    }
  
    // 此时游戏结束
    updateregs();  // 更新寄存器
    int userInput = 0;
    scanf("%d", &userInput);  // 获取用户输入
    if (userInput == 45) {  // 如果用户输入为45（回车）
        main();  // 重新执行主函数
    }

    return 0;
}
```

```assembly
init()                             addi $1 $0 0
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
```

```c
void renewInfo(int param1, int param2, int param3, int param4, int param5, int param6, int param7, int param8, int param9, int param10, int param11, int param12, int param13, int param14, int param15, int param16, int param17, int param18, int param19, int param20) {
    int temp0, temp1, temp2, temp3, temp4, temp5, 
  			temp6, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15,
        temp16, temp18, temp22, temp23, temp24, temp25, temp26;

    temp22 = 97; // ASCII code for 'a'

    if (param1 == temp22) {
        // Left case
        temp23 = -1;
        temp25 = 15;
        temp24 = 0;

        while (temp24 <= temp25) {
            temp26 = param2 >> temp24;
            if (temp26 & 1) {
                temp1 = temp24 >> 1;
                temp2 = (temp24 & 3) + param13 + param23;
                temp3 = param2 >> temp1 + param14;

                temp4 = (temp2 > param28 - 1) || (temp2 > param29 - 1) || (temp3 > param0 - 1);
                if (temp4) {
                    temp4 = !(temp2 <= param28 - 1 && temp2 <= param29 - 1 && temp3 <= param0 - 1);
                }

                temp6 = *(int *)(param3 + 20);
                temp6 >>= temp2;
                temp6 &= 1;

                if (temp6 == 1) {
                    temp4 = 1;
                }

                temp8 = (temp4) ? 1 : 0;
            } else {
                temp8 = 0;
            }

            if (temp8) {
                temp8 = 1;
            } else {
                temp8 = 0;
            }

            temp24++;
        }

        temp9 = 1;

        goto endcanmove0;
    }

    temp22 = 100; // ASCII code for 'd'

    if (param1 == temp22) {
        // Right case
        temp23 = 1;
        temp25 = 15;
        temp24 = 0;

        while (temp24 <= temp25) {
            temp26 = param2 >> temp24;
            if (temp26 & 1) {
                temp1 = temp24 >> 1;
                temp2 = (temp24 & 3) + param13 + param23;
                temp3 = param2 >> temp1 + param14;

                temp4 = (temp2 > param28 - 1) || (temp2 > param29 - 1) || (temp3 > param0 - 1);
                if (temp4) {
                    temp4 = !(temp2 <= param28 - 1 && temp2 <= param29 - 1 && temp3 <= param0 - 1);
                }

                temp6 = *(int *)(param3 + 20);
                temp6 >>= temp2;
                temp6 &= 1;

                if (temp6 == 1) {
                    temp4 = 1;
                }

                temp8 = (temp4) ? 1 : 0;
            } else {
                temp8 = 0;
            }

            if (temp8) {
                temp8 = 1;
            } else {
                temp8 = 0;
            }

            temp24++;
        }

        temp9 = 1;

        goto endcanmove1;
    }

    temp22 = 119; // ASCII code for 'w'

    if (param1 == temp22) {
        // Rotate case
        temp1 = 1;
        temp3 = 3;
        temp1 = temp1 & param16;
        temp2 = 2;
        temp4 = param15 << temp2;
        temp1 = temp1 + temp4;
        temp1 = *(int *)(temp1);
        temp25 = 15;
        temp24 = 0;

        while (temp24 <= temp25) {
            temp26 = temp1 >> temp24;
            if (temp26 & 1) {
                temp10 = 1;
                temp10 = temp10 & temp24;
                temp3 = temp24 >> 1;
                temp2 = (temp24 & 3) + param13 + param23;
                temp3 = param2 >> temp3 + param14;

                temp4 = (temp2 > param28 - 1) || (temp2 > param29 - 1) || (temp3 > param0 - 1);
                if (temp4) {
                    temp4 = !(temp2 <= param28 - 1 && temp2 <= param29 - 1 && temp3 <= param0 - 1);
                }

                temp6 = *(int *)(param3 + 20);
                temp6 >>= temp2;
                temp6 &= 1;

                if (temp6 == 1) {
                    temp4 = 1;
                }

                temp8 = (temp4) ? 1 : 0;
            } else {
                temp8 = 0;
            }

            if (temp8) {
                temp8 = 1;
            } else {
                temp8 = 0;
            }

            temp24++;
        }

        temp9 = 1;

        goto endcanRotate;
    }

endrenewInfo:
    return;
}

```

- `$22`：临时寄存器
- `$21`：存储了当时键盘的输入--特定寄存器
- `$23`：存储了x轴的移动量--临时寄存器
- `$25`：存储了行位置的右边界(15)--临时寄存器
- `$24`：?
- `$18`：?
- `$26`：？
- `$1`：临时寄存器





createNewBlock()

`$15`：当前块的种类(0-4)

`$4`：应该是临时的寄存器

`$16`：？

`$18`：？

`$13`：新的块添加之后的值为7

`$14`：新的块生成之后的值为-3





updateregs()

`$1`-`$10`存储了最终要输出的20列的信息

这些信息存储在内存中，首地址为40，有20个元素