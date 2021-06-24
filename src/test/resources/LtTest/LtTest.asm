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
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@LT_TRUE_2
D; JLT
@LT_END_2
0; JMP
(LT_TRUE_2)
@SP
A=M
M=-1
(LT_END_2)
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
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@LT_TRUE_5
D; JLT
@LT_END_5
0; JMP
(LT_TRUE_5)
@SP
A=M
M=-1
(LT_END_5)
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
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@LT_TRUE_8
D; JLT
@LT_END_8
0; JMP
(LT_TRUE_8)
@SP
A=M
M=-1
(LT_END_8)
@SP
M=M+1
