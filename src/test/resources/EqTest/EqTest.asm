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
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@EQ_TRUE_2
D; JEQ
@EQ_END_2
0; JMP
(EQ_TRUE_2)
@SP
A=M
M=-1
(EQ_END_2)
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@EQ_TRUE_4
D; JEQ
@EQ_END_4
0; JMP
(EQ_TRUE_4)
@SP
A=M
M=-1
(EQ_END_4)
@SP
M=M+1
