# VM translator

Translates vm code into hack assembly language.

The vm translator is the second step of a two stage compilation process:
- stage one: jack high level programs (.jack) are compiled into vm code (.vm)
- stage two: vm-translator translates vm code into hack assembly language (.asm).

VM code is a simple stack based programming language

```
    .jack   == compilation ==>   .vm   == translation ==>   .asm 
```

Finally, an assembler translates assembly into (pseudo) binary code (.hack) for the hack platform.

```
    .asm   == assembly ==>   .hack
```

From https://www.nand2tetris.org/


## Install

```
make build
```


## Usage

Translates all .vm files in a given directly into one .asm file.

```
# Translates all .vm files in src/test/resources/FibonacciElement
make DIR=FibonacciElement genDir
```
