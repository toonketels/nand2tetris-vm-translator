// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@GT_TRUE_2
D; JGT
@GT_END_2
0; JMP
(GT_TRUE_2)
@SP
A=M
M=-1
(GT_END_2)
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@GT_TRUE_5
D; JGT
@GT_END_5
0; JMP
(GT_TRUE_5)
@SP
A=M
M=-1
(GT_END_5)
@SP
M=M+1
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@GT_TRUE_8
D; JGT
@GT_END_8
0; JMP
(GT_TRUE_8)
@SP
A=M
M=-1
(GT_END_8)
@SP
M=M+1
