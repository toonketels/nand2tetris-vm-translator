load EqTest.asm;

set RAM[0] 256,   // stack pointer
set RAM[1] 300,   // base address of the local segment
set RAM[2] 400,   // base address of the argument segment
set RAM[3] 3000,  // base address of the this segment
set RAM[4] 3010,  // base address of the that segment

repeat 600 {      // enough cycles to complete the execution
  ticktock;
}

// Outputs the stack base and some values
// from the tested memory segments
// output;
