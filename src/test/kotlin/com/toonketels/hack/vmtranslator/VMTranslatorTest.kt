package com.toonketels.hack.vmtranslator

import com.toonketels.hack.vmtranslator.vmtranslator.MultiFileProgramBuilder
import com.toonketels.hack.vmtranslator.vmtranslator.translateProgram
import io.kotlintest.*
import io.kotlintest.specs.StringSpec
import java.io.File

// Ignores comments when comparing matches
private infix fun String.shouldMatchInstructions(other: String) = this.split("\n", "\r")
        .filter { !it.startsWith("//") }
        .joinToString("\n") shouldBe other.split("\n", "\r")
        .filter { !it.startsWith("//") }
        .joinToString("\n")

class VMTranslatorTest : StringSpec({

    "push constant" {

        val vm = "push constant 10"
        val asm = """
            // push constant 10
            @10
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions  asm
    }

    "push local" {

        val vm = "push local 0"
        val asm = """
            // push local 0
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
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "push argument" {

        val vm = "push argument 1"
        val asm = """
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
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "push this" {

        val vm = "push this 6"
        val asm = """
                // push this 6
                @6
                D=A
                @THIS
                A=M+D
                D=M
                @SP
                A=M
                M=D
                @SP
                M=M+1
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "push that" {
        val vm = "push that 5"
        val asm = """
            // push that 5
            @5
            D=A
            @THAT
            A=M+D
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "push temp" {
        val vm = "push temp 6"
        val asm = """
                // push temp 6
                @11
                D=M
                @SP
                A=M
                M=D
                @SP
                M=M+1
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }
    "push pointer 0" {
        val vm = "push pointer 0"
        val asm = """
                // push pointer 0
                @THIS
                D=M
                @SP
                A=M
                M=D
                @SP
                M=M+1
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }
    "push pointer 1" {
        val vm = "push pointer 1"
        val asm = """
                // push pointer 1
                @THAT
                D=M
                @SP
                A=M
                M=D
                @SP
                M=M+1
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }
    "push static" {
        val vm = "push static 8"
        val asm = """
                // push static 8
                @null.8
                D=M
                @SP
                A=M
                M=D
                @SP
                M=M+1
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }
    "pop local" {
        val vm = "pop local 0"
        val asm = """
            // pop local 0
            @SP
            M=M-1
            A=M
            D=M
            @LCL
            A=M
            M=D
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "pop argument" {
        val vm = "pop argument 2"
        val asm = """
            // pop argument 2
            @SP
            M=M-1
            A=M
            D=M
            @ARG
            A=M
            A=A+1
            A=A+1
            M=D
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "pop this" {
        val vm = "pop this 6"
        val asm = """
                // pop this 6
                @SP
                M=M-1
                A=M
                D=M
                @THIS
                A=M
                A=A+1
                A=A+1
                A=A+1
                A=A+1
                A=A+1
                A=A+1
                M=D
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "pop that" {
        val vm = "pop that 5"
        val asm = """
                // pop that 5
                @SP
                M=M-1
                A=M
                D=M
                @THAT
                A=M
                A=A+1
                A=A+1
                A=A+1
                A=A+1
                A=A+1
                M=D
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "pop temp" {
        val vm = "pop temp 6"
        val asm = """
            // pop temp 6
            @SP
            M=M-1
            A=M
            D=M
            @11
            M=D
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "pop pointer 0" {
        val vm = "pop pointer 0"
        val asm = """
            // pop pointer 0
            @SP
            M=M-1
            A=M
            D=M
            @THIS
            M=D
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "pop pointer 1" {
        val vm = "pop pointer 1"
        val asm = """
            // pop pointer 1
            @SP
            M=M-1
            A=M
            D=M
            @THAT
            M=D
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "pop static" {
        val vm = "pop static 8"
        val asm = """
            // pop static 8
            @SP
            M=M-1
            A=M
            D=M
            @null.8
            M=D
            
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "add" {
        val vm = "add"
        val asm = """
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
                
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "sub" {
        val vm = "sub"
        val asm = """
        // sub
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
        
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "neg" {
        val vm = "neg"
        val asm = """
        // neg
        @SP
        M=M-1
        A=M
        M=-M
        @SP
        M=M+1
        
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "not" {
        val vm = "not"
        val asm = """
        // not
        @SP
        M=M-1
        A=M
        M=!M
        @SP
        M=M+1
        
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "or" {
        val vm = "or"
        val asm = """
        // or
        @SP
        M=M-1
        A=M
        D=M
        @SP
        M=M-1
        A=M
        M=D|M
        @SP
        M=M+1
        
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "and" {
        val vm = "and"
        val asm = """
        // and
        @SP
        M=M-1
        A=M
        D=M
        @SP
        M=M-1
        A=M
        M=D&M
        @SP
        M=M+1
        
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "eq" {
        val vm = "eq"

        val asm = """
        // eq
        @SP
        M=M-1
        A=M
        D=M
        @SP
        M=M-1
        A=M
        D=M-D
        M=0
        @EQ_TRUE_0
        D; JEQ
        @EQ_END_0
        0; JMP
        (EQ_TRUE_0)
        @SP
        A=M
        M=-1
        (EQ_END_0)
        @SP
        M=M+1
        
        """.trimIndent()
        translateProgram(vm) shouldMatchInstructions asm
    }

    "gt" {
        val vm = "gt"
        val asm = """
        // gt
        @SP
        M=M-1
        A=M
        D=M
        @SP
        M=M-1
        A=M
        D=M-D
        M=0
        @GT_TRUE_0
        D; JGT
        @GT_END_0
        0; JMP
        (GT_TRUE_0)
        @SP
        A=M
        M=-1
        (GT_END_0)
        @SP
        M=M+1
        
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "lt" {
        val vm = "lt"
        val asm = """
        // lt
        @SP
        M=M-1
        A=M
        D=M
        @SP
        M=M-1
        A=M
        D=M-D
        M=0
        @LT_TRUE_0
        D; JLT
        @LT_END_0
        0; JMP
        (LT_TRUE_0)
        @SP
        A=M
        M=-1
        (LT_END_0)
        @SP
        M=M+1
        
        """.trimIndent()

        translateProgram(vm) shouldMatchInstructions asm
    }

    // @TODO neg test script
    // @TODO and test script
    // @TODO or test script
    // @TODO not test script

    "basic memory instructions and arithmetic" {
        val vm = javaClass.getResource("/BasicTest/BasicTest.vm").readText()
        val asm = this.javaClass.getResource(
                "/BasicTest/BasicTest.asm").readText()

        translateProgram("BasicTest", vm) shouldMatchInstructions asm
    }

    "pointer memory instructions" {
        val vm = javaClass.getResource("/PointerTest/PointerTest.vm").readText()
        val asm = this.javaClass.getResource(
                "/PointerTest/PointerTest.asm").readText()

        translateProgram("PointerTest", vm) shouldMatchInstructions asm
    }

    "static memory instructions" {
        val vm = javaClass.getResource("/StaticTest/StaticTest.vm").readText()
        val asm = this.javaClass.getResource(
                "/StaticTest/StaticTest.asm").readText()

        translateProgram("StaticTest", vm) shouldMatchInstructions asm
    }

    "eq instructions" {
        val vm = javaClass.getResource("/EqTest/EqTest.vm").readText()
        val asm = this.javaClass.getResource(
                "/EqTest/EqTest.asm").readText()

        translateProgram("EqTest", vm) shouldMatchInstructions asm
    }

    "gt instructions" {
        val vm = javaClass.getResource("/GtTest/GtTest.vm").readText()
        val asm = this.javaClass.getResource(
                "/GtTest/GtTest.asm").readText()

        translateProgram("GtTest", vm) shouldMatchInstructions asm
    }

    "program flow instructions" {
        val vm = javaClass.getResource("/BasicLoop/BasicLoop.vm").readText()
        val asm = this.javaClass.getResource(
                "/BasicLoop/BasicLoop.asm").readText()

        translateProgram("BasicLoop", vm) shouldMatchInstructions asm
    }

    "program flow instructions 2" {
        val vm = javaClass.getResource("/FibonacciSeries/FibonacciSeries.vm").readText()
        val asm = this.javaClass.getResource(
                "/FibonacciSeries/FibonacciSeries.asm").readText()

        translateProgram("FibonacciSeries", vm) shouldMatchInstructions asm
    }

    "simple function" {
        val vm = javaClass.getResource("/SimpleFunction/SimpleFunction.vm").readText()
        val asm = this.javaClass.getResource(
                "/SimpleFunction/SimpleFunction.asm").readText()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "simple call" {
        val vm = javaClass.getResource("/SimpleCall/SimpleCall.vm").readText()
        val asm = this.javaClass.getResource(
                "/SimpleCall/SimpleCall.asm").readText()

        translateProgram("SimpleCal", vm) shouldMatchInstructions asm
    }

    "double call" {
        val vm = javaClass.getResource("/DoubleCall/DoubleCall.vm").readText()
        val asm = this.javaClass.getResource(
                "/DoubleCall/DoubleCall.asm").readText()

        translateProgram("DoubleCall", vm) shouldMatchInstructions asm
    }

    "simple nested call" {
        val vm = javaClass.getResource("/SimpleNestedCall/SimpleNestedCall.vm").readText()
        val asm = this.javaClass.getResource(
                "/SimpleNestedCall/SimpleNestedCall.asm").readText()

        translateProgram("SimpleNestedCall", vm) shouldMatchInstructions asm
    }

    "fibonacci element" {
        val vm = File(javaClass.getResource("/FibonacciElement").file)
                .listFiles { file -> file.extension == "vm" }
                .fold(MultiFileProgramBuilder()) { programBuilder, file -> programBuilder.addFile(file) }
                .sources

        val asm = this.javaClass.getResource(
                "/FibonacciElement/FibonacciElement.asm").readText()

        translateProgram(vm) shouldMatchInstructions asm
    }

    "statics test" {
        val vm = File(javaClass.getResource("/StaticsTest").file)
                .listFiles { file -> file.extension == "vm" }
                .fold(MultiFileProgramBuilder()) { programBuilder, file -> programBuilder.addFile(file) }
                .sources

        val asm = this.javaClass.getResource(
                "/StaticsTest/StaticsTest.asm").readText()

        translateProgram(vm) shouldMatchInstructions asm
    }

//     ram[5] temp var not correct
//    "nested call" {
//        val vm = File(javaClass.getResource("/NestedCall").file)
//                .listFiles { file -> file.extension == "vm" }
//                .fold(MultiFileProgramBuilder()) { programBuilder, file -> programBuilder.addFile(file) }
//                .sources
//
//        val asm = this.javaClass.getResource(
//                "/NestedCall/NestedCall.asm").readText()
//
//        translateProgram(vm) shouldMatchInstructions asm
//    }


})