// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call SimpleNestedCall.addTwice 2
@null$ret_2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@SimpleNestedCall.addTwice
0; JMP
(null$ret_2)
// label FOREVER
(null$FOREVER)
// goto FOREVER
@null$FOREVER
0; JMP
// function SimpleNestedCall.add 0
(SimpleNestedCall.add)
// push argument 0
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
// push argument 1
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
// add
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
// return
@LCL
D=M
@5
M=D
@5
D=A
@5
A=M-D
D=M
@6
M=D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
@1
D=A
@ARG
D=M+D
@SP
M=D
@1
D=A
@5
A=M-D
D=M
@THAT
M=D
@2
D=A
@5
A=M-D
D=M
@THIS
M=D
@3
D=A
@5
A=M-D
D=M
@ARG
M=D
@4
D=A
@5
A=M-D
D=M
@LCL
M=D
@6
A=M
0; JMP
// function SimpleNestedCall.addTwice 0
(SimpleNestedCall.addTwice)
// push argument 0
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
// push argument 1
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
// call SimpleNestedCall.add 2
@SimpleNestedCall.addTwice$ret_13
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@SimpleNestedCall.add
0; JMP
(SimpleNestedCall.addTwice$ret_13)
// push argument 0
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
// push argument 1
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
// call SimpleNestedCall.add 2
@SimpleNestedCall.addTwice$ret_16
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@SimpleNestedCall.add
0; JMP
(SimpleNestedCall.addTwice$ret_16)
// call SimpleNestedCall.add 2
@SimpleNestedCall.addTwice$ret_17
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@SimpleNestedCall.add
0; JMP
(SimpleNestedCall.addTwice$ret_17)
// return
@LCL
D=M
@5
M=D
@5
D=A
@5
A=M-D
D=M
@6
M=D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
@1
D=A
@ARG
D=M+D
@SP
M=D
@1
D=A
@5
A=M-D
D=M
@THAT
M=D
@2
D=A
@5
A=M-D
D=M
@THIS
M=D
@3
D=A
@5
A=M-D
D=M
@ARG
M=D
@4
D=A
@5
A=M-D
D=M
@LCL
M=D
@6
A=M
0; JMP
