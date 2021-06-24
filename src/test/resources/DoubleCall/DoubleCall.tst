load DoubleCall.asm,
output-file DoubleCall.out,
compare-to DoubleCall.cmp,
output-list RAM[0]%D1.6.1 RAM[1]%D1.6.1 RAM[2]%D1.6.1
            RAM[3]%D1.6.1 RAM[4]%D1.6.1 RAM[256]%D1.6.1;

set RAM[0] 256,
set RAM[1] 256,
set RAM[2] 256,
set RAM[3] 3000,
set RAM[4] 4000,

repeat 300 {
  ticktock;
}

output;
