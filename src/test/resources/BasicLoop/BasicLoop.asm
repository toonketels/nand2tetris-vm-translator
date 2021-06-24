// 0 push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 7 pop local 0
@SP
M=M-1
A=M
D=M
@LCL
A=M
M=D
// 14 label LOOP_START
(null$LOOP_START)
// 14 push argument 0
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
// 24 push local 0
@0
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// 34 add
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
// 44 pop local 0
@SP
M=M-1
A=M
D=M
@LCL
A=M
M=D
// 51 push argument 0
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
// 61 push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 68 sub
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
// 78 pop argument 0
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// 85 push argument 0
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
// 95 if-goto LOOP_START
@SP
M=M-1
A=M
D=M
@null$LOOP_START
D; JNE
// 101 push local 0
@0
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
