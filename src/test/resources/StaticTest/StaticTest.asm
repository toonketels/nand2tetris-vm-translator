// 0 push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// 7 push constant 333
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
// 14 push constant 888
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
// 21 pop static 8
@SP
M=M-1
A=M
D=M
@StaticTest.8
M=D
// 27 pop static 3
@SP
M=M-1
A=M
D=M
@StaticTest.3
M=D
// 33 pop static 1
@SP
M=M-1
A=M
D=M
@StaticTest.1
M=D
// 39 push static 3
@StaticTest.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// 46 push static 1
@StaticTest.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 53 sub
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
// 63 push static 8
@StaticTest.8
D=M
@SP
A=M
M=D
@SP
M=M+1
// 70 add
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
