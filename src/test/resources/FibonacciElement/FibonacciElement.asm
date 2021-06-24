// 0 include bootstrap code
@256
D=A
@0
M=D
// *** Store return address
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// *** Store LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Init argument pointer
@5
D=A
@SP
D=M-D
@ARG
M=D
// *** Init local pointer
@SP
D=M
@LCL
M=D
// *** Execute function
@Sys.init
0; JMP
(0)
// 51 function Main.fibonacci 0
(Main.fibonacci)
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
// 61 push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// 68 lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
M=0
@LT_TRUE_4
D; JLT
@LT_END_4
0; JMP
(LT_TRUE_4)
@SP
A=M
M=-1
(LT_END_4)
@SP
M=M+1
// 86 if-goto IF_TRUE
@SP
M=M-1
A=M
D=M
@Main.fibonacci$IF_TRUE
D; JNE
// 92 goto IF_FALSE
@Main.fibonacci$IF_FALSE
0; JMP
// 94 label IF_TRUE
(Main.fibonacci$IF_TRUE)
// 94 push argument 0
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
// 104 return
// *** Store frame as temp var
@LCL
D=M
@5
M=D
// *** Store return address as temp var
@5
D=A
@5
A=M-D
D=M
@6
M=D
// *** Return value
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// *** Pop call state from stack
@1
D=A
@ARG
D=M+D
@SP
M=D
// *** Restore THAT
@1
D=A
@5
A=M-D
D=M
@THAT
M=D
// *** Restore THIS
@2
D=A
@5
A=M-D
D=M
@THIS
M=D
// *** Restore ARG
@3
D=A
@5
A=M-D
D=M
@ARG
M=D
// *** Restore LCL
@4
D=A
@5
A=M-D
D=M
@LCL
M=D
// *** Return from function call
@6
A=M
0; JMP
// 159 label IF_FALSE
(Main.fibonacci$IF_FALSE)
// 159 push argument 0
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
// 169 push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// 176 sub
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
// 186 call Main.fibonacci 1
// *** Store return address
@Main.fibonacci$ret_14
D=A
@SP
A=M
M=D
@SP
M=M+1
// *** Store LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Init argument pointer
@6
D=A
@SP
D=M-D
@ARG
M=D
// *** Init local pointer
@SP
D=M
@LCL
M=D
// *** Execute function
@Main.fibonacci
0; JMP
(Main.fibonacci$ret_14)
// 233 push argument 0
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
// 243 push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 250 sub
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
// 260 call Main.fibonacci 1
// *** Store return address
@Main.fibonacci$ret_18
D=A
@SP
A=M
M=D
@SP
M=M+1
// *** Store LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Init argument pointer
@6
D=A
@SP
D=M-D
@ARG
M=D
// *** Init local pointer
@SP
D=M
@LCL
M=D
// *** Execute function
@Main.fibonacci
0; JMP
(Main.fibonacci$ret_18)
// 307 add
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
// 317 return
// *** Store frame as temp var
@LCL
D=M
@5
M=D
// *** Store return address as temp var
@5
D=A
@5
A=M-D
D=M
@6
M=D
// *** Return value
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// *** Pop call state from stack
@1
D=A
@ARG
D=M+D
@SP
M=D
// *** Restore THAT
@1
D=A
@5
A=M-D
D=M
@THAT
M=D
// *** Restore THIS
@2
D=A
@5
A=M-D
D=M
@THIS
M=D
// *** Restore ARG
@3
D=A
@5
A=M-D
D=M
@ARG
M=D
// *** Restore LCL
@4
D=A
@5
A=M-D
D=M
@LCL
M=D
// *** Return from function call
@6
A=M
0; JMP
// 372 function Sys.init 0
(Sys.init)
// 372 push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// 379 call Main.fibonacci 1
// *** Store return address
@Sys.init$ret_23
D=A
@SP
A=M
M=D
@SP
M=M+1
// *** Store LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Store THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// *** Init argument pointer
@6
D=A
@SP
D=M-D
@ARG
M=D
// *** Init local pointer
@SP
D=M
@LCL
M=D
// *** Execute function
@Main.fibonacci
0; JMP
(Sys.init$ret_23)
// 426 label WHILE
(Sys.init$WHILE)
// 426 goto WHILE
@Sys.init$WHILE
0; JMP
