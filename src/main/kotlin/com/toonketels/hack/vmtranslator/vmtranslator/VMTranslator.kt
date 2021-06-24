package com.toonketels.hack.vmtranslator.vmtranslator

import java.io.File
import java.lang.IllegalArgumentException

val DEFAULT_FILE_NAME = "null"

fun translateProgram(sources: List<Pair<String, String>>): String = CodeGen()
        .apply { translateProgram(sources) }
        .lines
        .joinToString("\n") + "\n"

fun translateProgram(fileName: String, vm: String) = translateProgram(listOf(fileName to vm))

fun translateProgram(vm: String): String = translateProgram(DEFAULT_FILE_NAME, vm)


class CodeGen() {

    val lines = mutableListOf<String>()
    var lastDefinedFunction: String? = null
    var assemblyLineNumber = 0;
    var sourceLineNumber = 0;

    fun translateProgram(sources: List<Pair<String, String>>) = sources.forEach { (fileName, source) -> translateFile(fileName, source) }

    // @TODO dont keep track of linenumbers as such so we can parallelize it per file
    fun translateFile(fileName: String, source: String) = source
            .split("\n", "\r")
            .filter { isInstruction(it) }
                .forEachIndexed {lineNumber, line -> translate(trim(line), fileName, lineNumber + sourceLineNumber) }
                .also {
                    sourceLineNumber = lines.size
                }

    fun translate(vm: String, fileName: String, lineNumber: Int = 0): CodeGen {
       lines.add(translateLine(vm, fileName, lineNumber))
        return this
    }

    private fun translateLine(vm: String, fileName: String, lineNumber: Int = 0): String {
        val labelGenerator = makeVmInstructionScopedLabelGenerator(lineNumber)

        val instructions = when (vm) {
            "include bootstrap code" -> bootstrap()
            "add" -> add()
            "sub" -> sub()
            "neg" -> neg()
            "not" -> not()
            "or" -> or()
            "and" -> and()
            "eq" -> eq(labelGenerator)
            "gt" -> gt(labelGenerator)
            "lt" -> lt(labelGenerator)
            else -> compoundInstruction(vm, fileName, labelGenerator, this)
        }

        val currentCommentNumber = assemblyLineNumber
        assemblyLineNumber += instructions.filter { it.isInstruction }.size

        return (listOf("// ${currentCommentNumber} ${vm}") + instructions.map { it.source }).joinToString("\n")
    }
}



interface Assembly {
    val source: String
    val isInstruction: Boolean
}

data class AssemblyComment(override val source: String): Assembly { override val isInstruction = false }
data class AssemblyLabel(override val source: String): Assembly { override val isInstruction = false }
data class AssemblyInstruction(override val source: String): Assembly { override val isInstruction = true }

private fun isInstruction(line: String) = !(isComment(line) || line.isBlank())

private fun isComment(line: String) = line.startsWith("//")

private fun trim(line: String): String {
    // Remove inline comments
    val (instruction) = line.split("//")
    // Remove white space
    return instruction.trim()
}

typealias LastFunctionSetter = (String) -> Unit
typealias LabelGenerator = (String) -> String
private fun makeVmInstructionScopedLabelGenerator(lineNumber: Int): LabelGenerator = { label: String -> "${label}_${lineNumber}" }

class MultiFileProgramBuilder() {

    val sources = mutableListOf<Pair<String, String>>()

    init {
        sources.add(withBootstrapCode())
    }

    fun addFile(file: File): MultiFileProgramBuilder {
        sources.add(file.nameWithoutExtension to file.readText())
        return this
    }

    fun withBootstrapCode(): Pair<String, String> = "Boot" to "include bootstrap code"
}

private fun compoundInstruction(vm: String, fileName: String, labelGenerator: LabelGenerator, state: CodeGen): List<Assembly> {

    val (first) = vm.split(" ")

    return when (first) {
        "push" -> memoryInstructions(vm, fileName)
        "pop" ->  memoryInstructions(vm, fileName)
        "label" -> flowInstructions(vm, state)
        "goto" -> flowInstructions(vm, state)
        "if-goto" -> flowInstructions(vm, state)
        "function" -> functionInstructions(vm, labelGenerator, state)
        "call" -> functionInstructions(vm, labelGenerator, state)
        "return" -> functionInstructions(vm, labelGenerator, state)
        else -> throw IllegalArgumentException("Unknown instruction ${vm}")
    }
}

fun functionInstructions(vm: String, labelGenerator: LabelGenerator, state: CodeGen): List<Assembly> {

    // @TODO clean up
    // @TODO function name should be passed to control flow too
    // @TODO move state out of method?
    return when (vm) {
        "return" -> functionReturn()
        else -> {
            // @TODO better validation call functionName number -> number exists
            val (operation, functionName, number) = vm.split(" ")

            return when (operation) {
                "call" -> functionCall(functionName, number.toInt(), labelGenerator("${state.lastDefinedFunction}\$ret"))
                "function" -> {
                    state.lastDefinedFunction = functionName
                    return functionDefine(functionName, number.toInt())
                }
                else ->  throw IllegalArgumentException("Unknown instruction ${vm}")
            }
        }
    }
}

private fun flowInstructions(vm: String, state: CodeGen): List<Assembly> {
    val (operation, tempLabelName) = vm.split(" ")

    val labelName = "${state.lastDefinedFunction}\$${tempLabelName}"

    return when (operation) {
        "label" -> label(labelName)
        "goto" -> goto(labelName)
        "if-goto" -> ifGoto(labelName)
        else ->  throw IllegalArgumentException("Unknown instruction ${vm}")
    }
}

private fun memoryInstructions(vm: String, fileName: String): List<Assembly> {
    val (operation, segment, i) = vm.split(" ")

    val instructions = when (operation) {
        "push" -> push(segment, i.toInt(), fileName)
        "pop" -> pop(segment, i.toInt(), fileName)
        else -> throw IllegalArgumentException("Unknown instruction ${operation}")
    }
    return instructions
}
