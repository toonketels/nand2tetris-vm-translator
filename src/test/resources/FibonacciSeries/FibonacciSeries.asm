// 0 push argument 1
@1
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// 10 pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D
// 16 push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 23 pop that 0
@SP
M=M-1
A=M
D=M
@THAT
A=M
M=D
// 30 push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 37 pop that 1
@SP
M=M-1
A=M
D=M
@THAT
A=M
A=A+1
M=D
// 45 push argument 0
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// 55 push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// 62 sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// 72 pop argument 0
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// 79 label MAIN_LOOP_START
(null$MAIN_LOOP_START)
// 79 push argument 0
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// 89 if-goto COMPUTE_ELEMENT
@SP
M=M-1
A=M
D=M
@null$COMPUTE_ELEMENT
D; JNE
// 95 goto END_PROGRAM
@null$END_PROGRAM
0; JMP
// 97 label COMPUTE_ELEMENT
(null$COMPUTE_ELEMENT)
// 97 push that 0
@0
D=A
@THAT
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// 107 push that 1
@1
D=A
@THAT
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// 117 add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
// 127 pop that 2
@SP
M=M-1
A=M
D=M
@THAT
A=M
A=A+1
A=A+1
M=D
// 136 push pointer 1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// 143 push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 150 add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
// 160 pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D
// 166 push argument 0
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// 176 push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 183 sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// 193 pop argument 0
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// 200 goto MAIN_LOOP_START
@null$MAIN_LOOP_START
0; JMP
// 202 label END_PROGRAM
(null$END_PROGRAM)
