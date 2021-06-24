load SimpleNestedCall.vm,
output-file SimpleNestedCall.out,
compare-to SimpleNestedCall.cmp,
output-list RAM[0]%D1.6.1 RAM[1]%D1.6.1 RAM[2]%D1.6.1
            RAM[3]%D1.6.1 RAM[4]%D1.6.1 RAM[256]%D1.6.1;

set sp 256,
set local 256,
set argument 256,
set this 3000,
set that 4000,

repeat 30 {
  vmstep;
}

output;
