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
// 51 function Class1.set 0
(Class1.set)
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
// 61 pop static 0
@SP
M=M-1
A=M
D=M
@Class1.0
M=D
// 67 push argument 1
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
// 77 pop static 1
@SP
M=M-1
A=M
D=M
@Class1.1
M=D
// 83 push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 90 return
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
// 145 function Class1.get 0
(Class1.get)
// 145 push static 0
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 152 push static 1
@Class1.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 159 sub
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
// 169 return
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
// 224 function Sys.init 0
(Sys.init)
// 224 push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// 231 push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// 238 call Class1.set 2
// *** Store return address
@Sys.init$ret_16
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
@7
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
@Class1.set
0; JMP
(Sys.init$ret_16)
// 285 pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// 291 push constant 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
// 298 push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// 305 call Class2.set 2
// *** Store return address
@Sys.init$ret_20
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
@7
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
@Class2.set
0; JMP
(Sys.init$ret_20)
// 352 pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// 358 call Class1.get 0
// *** Store return address
@Sys.init$ret_22
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
@Class1.get
0; JMP
(Sys.init$ret_22)
// 405 call Class2.get 0
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
@Class2.get
0; JMP
(Sys.init$ret_23)
// 452 label WHILE
(Sys.init$WHILE)
// 452 goto WHILE
@Sys.init$WHILE
0; JMP
// 454 function Class2.set 0
(Class2.set)
// 454 push argument 0
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
// 464 pop static 0
@SP
M=M-1
A=M
D=M
@Class2.0
M=D
// 470 push argument 1
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
// 480 pop static 1
@SP
M=M-1
A=M
D=M
@Class2.1
M=D
// 486 push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 493 return
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
// 548 function Class2.get 0
(Class2.get)
// 548 push static 0
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 555 push static 1
@Class2.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 562 sub
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
// 572 return
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
