package com.toonketels.hack.vmtranslator.vmtranslator

import com.toonketels.hack.vmtranslator.vmtranslator.Segment.*

fun add(): List<Assembly> = buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    decrementStackPointer()
    addDataToPointerValue()
    incrementStackPointer()
}

fun sub(): List<Assembly> = buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    decrementStackPointer()
    subtractDataFromPointerValue()
    incrementStackPointer()
}

fun neg(): List<Assembly> = buildInstructions {
    decrementStackPointer()
    negatePointerValue()
    incrementStackPointer()
}

fun not(): List<Assembly> = buildInstructions {
    decrementStackPointer()
    bitwiseNotPointerValue()
    incrementStackPointer()
}

fun or(): List<Assembly> = buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    decrementStackPointer()
    bitwiseDataOrPointerValue()
    incrementStackPointer()
}

fun and(): List<Assembly> = buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    decrementStackPointer()
    bitwiseDataAndPointerValue()
    incrementStackPointer()
}

fun eq(label: LabelGenerator): List<Assembly> = buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    decrementStackPointer()
    subtractDataFromPointerValueIntoData()
    setPointerValueToDataIsEqualToZero(label)
    incrementStackPointer()
}

fun gt(label: LabelGenerator): List<Assembly> = buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    decrementStackPointer()
    subtractDataFromPointerValueIntoData()
    setPointerValueToDataIsGreaterThanZero(label)
    incrementStackPointer()
}

fun lt(label: LabelGenerator): List<Assembly> = buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    decrementStackPointer()
    subtractDataFromPointerValueIntoData()
    setPointerValueToDataIsLessThanZero(label)
    incrementStackPointer()
}

fun pop(segment: String, i: Int, fileName: String): List<Assembly> = buildInstructions {

    decrementStackPointer()
    loadPointerValueIntoData()
    when (segment) {
        "local" -> dataIntoLocal(i)
        "argument" -> dataIntoArgument(i)
        "pointer" -> dataIntoPointer(i)
        "this" -> dataIntoThis(i)
        "that" -> dataIntoThat(i)
        "temp" -> dataIntoTemp(i)
        "static" -> dataIntoStatic(i, fileName)
        else -> TODO("not implemented")
    }
}

fun push(segment: String, i: Int, fileName: String): List<Assembly> = buildInstructions {

    when (segment) {
        "local" -> loadLocalIntoData(i)
        "argument" -> loadArgumentIntoData(i)
        "pointer" -> loadPointerIntoData(i)
        "this" -> loadThisIntoData(i)
        "that" -> loadThatIntoData(i)
        "temp" -> loadTempIntoData(i)
        "static" -> loadStaticIntoData(i, fileName)
        "constant" -> loadConstantIntoData(i)
        else -> TODO("not implemented")
    }
    pushDataOnStack()
    incrementStackPointer()
}

fun label(labelName: String): List<Assembly> =  buildInstructions {
    label(labelName)
}

fun goto(labelName: String): List<Assembly> =  buildInstructions {
    jumpToLabel(labelName)
}

fun ifGoto(labelName: String): List<Assembly> =  buildInstructions {
    decrementStackPointer()
    loadPointerValueIntoData()
    conditionallyJumpToLabel(labelName)
}

fun functionDefine(functionName: String, numberOfLocalVars: Int): List<Assembly> =  buildInstructions {
    label(functionName)
    repeat(numberOfLocalVars) {
        initLocalVarToZero()
    }
}

// @TODO add all segments
private enum class Segment { THIS, THAT, ARG, LCL }

fun functionReturn(): List<Assembly> =  buildInstructions {
    comment("Store frame as temp var")
    storeFrameAsTempVar()
    comment("Store return address as temp var")
    storeReturnAddressAsTempVar()
    comment("Return value")
    returnValue()
    comment("Pop call state from stack")
    popCallStateFromStack()
    comment("Restore THAT")
    restoreCallerState(THAT)
    comment("Restore THIS")
    restoreCallerState(THIS)
    comment("Restore ARG")
    restoreCallerState(ARG)
    comment("Restore LCL")
    restoreCallerState(LCL)
    comment("Return from function call")
    returnFromFunction()
}

fun functionCall(functionName: String, numberOfArguments: Int, labelName: String): List<Assembly> =  buildInstructions {
    comment("Store return address")
    storeReturnAddress(labelName)
    comment("Store LCL")
    storeCallerState(LCL)
    comment("Store ARG")
    storeCallerState(ARG)
    comment("Store THIS")
    storeCallerState(THIS)
    comment("Store THAT")
    storeCallerState(THAT)
    comment("Init argument pointer")
    initCalleeArgumentPointer(numberOfArguments)
    comment("Init local pointer")
    initCalleeLocalPointer()
    comment("Execute function")
    executeFunction(functionName)
    label(labelName)
}

fun bootstrap(): List<Assembly> {
    return buildInstructions { initStackPointer() } +functionCall("Sys.init", 0, "0")
}

private fun buildInstructions(builderAction: InstructionBuilder.() -> Unit): List<Assembly> = InstructionBuilder().apply(builderAction).build()

private class InstructionBuilder {

    private val FRAME = 0
    private val RETURN = 1

    // @TODO optimize for i == 0
    private val instructions: MutableList<String> = mutableListOf()

    fun initStackPointer() = add("@256", "D=A", "@0", "M=D")

    fun comment(what: String) = add("// *** $what")

    fun loadConstantIntoData(i: Int) = add("@${i}", "D=A")

    fun loadLabelIntoData(label: String) = add("@${label}", "D=A")

    fun loadLocalIntoData(i: Int) = add("@${i}", "D=A", "@LCL", "A=M+D", "D=M")

    fun loadThatIntoData(i: Int) = add("@${i}", "D=A", "@THAT", "A=M+D", "D=M")

    fun loadArgumentIntoData(i: Int) = add("@${i}", "D=A", "@ARG", "A=M+D", "D=M")

    fun loadArgumentPointerIntoData(i: Int) = add("@${i}", "D=A", "@ARG", "D=M+D")

    fun loadThisIntoData(i: Int) = add("@${i}", "D=A", "@THIS", "A=M+D", "D=M")

    fun loadTempIntoData(i: Int) = add("@${5 + i}", "D=M")

    fun loadTempAsAddress(i: Int) = add("@${5 + i}", "A=M")

    fun loadPointerIntoData(i: Int) {
        require(i == 0 || i == 1) { "Pointer can only work with values 0 and 1" }
        add("@${if (i == 0) "THIS" else "THAT"}", "D=M")
    }

    fun loadStaticIntoData(i: Int, fileName: String) = add("@${fileName}.${i}", "D=M")

    fun loadSegmentPointerIntoData(segment: String) = add("@${segment}", "D=M")

    fun loadPointerValueIntoData() = add("A=M", "D=M")

    fun pushDataOnStack() = add("@SP", "A=M", "M=D")

    fun pushZeroOnStack() = add("@SP", "A=M", "M=0")

    fun incrementStackPointer() = add("@SP", "M=M+1")

    fun decrementStackPointer() = add("@SP", "M=M-1")

    fun dataIntoLocal(i: Int) = add(listOf<String>() + "@LCL" + "A=M" + List(i) { "A=A+1" } + "M=D")

    fun dataIntoArgument(i: Int) = add(listOf<String>() + "@ARG" + "A=M" + List(i) { "A=A+1" } + "M=D")

    fun dataIntoThis(i: Int) = add(listOf<String>() + "@THIS" + "A=M" + List(i) { "A=A+1" } + "M=D")

    fun dataIntoThat(i: Int) = add(listOf<String>() + "@THAT" + "A=M" + List(i) { "A=A+1" } + "M=D")

    fun dataIntoTemp(i: Int) = add("@${5 + i}", "M=D")

    fun dataIntoStatic(i: Int, fileName: String) = add("@${fileName}.${i}", "M=D")

    fun dataIntoPointer(i: Int) {
        require(i == 0 || i == 1) { "Pointer can only takes values 0 or 1" }
        add("@${if (i == 0) "THIS" else "THAT"}", "M=D")
    }

    fun resetStackPointerToData() = add("@SP", "M=D")

    fun resetThatToData() = add("@THAT", "M=D")

    fun resetThisToData() = add("@THIS", "M=D")

    fun resetArgumentToData() = add("@ARG", "M=D")

    fun resetLocalToData() = add("@LCL", "M=D")

    fun addDataToPointerValue() = add("A=M", "M=M+D")

    fun subtractDataFromPointerValue() = add("A=M", "M=M-D")

    fun negatePointerValue() = add("A=M", "M=-M")

    fun bitwiseNotPointerValue() = add("A=M", "M=!M")

    fun subtractDataFromPointerValueIntoData() = add("A=M", "D=M-D")

    fun subtractDataFromPointerIntoData() = add("@SP", "D=M-D")

    fun subtractDataFromTempValueAsPointerIntoData(i: Int) = add("@${5 + 0}", "A=M-D", "D=M")

    fun subtractDataFromTempValueAsAddressAndLoadValueIntoData(i: Int) = add(
            "@${5 + i}",
            "A=M-D",
            "D=M"
    )

    fun bitwiseDataOrPointerValue() = add("A=M", "M=D|M")

    fun bitwiseDataAndPointerValue() = add("A=M", "M=D&M")

    fun setPointerValueToDataIsEqualToZero(label: LabelGenerator) = add(
            "M=0",                      // pointerValue to false
            "@${label("EQ_TRUE")}",     // jump to true when equal
            "D; JEQ",
            "@${label("EQ_END")}",      // on not equal, just jump to end
            "0; JMP",
            "(${label("EQ_TRUE")})",    // on equal
            "@SP",
            "A=M",
            "M=-1",                     // pointerValue to true (-1)
            "(${label("EQ_END")})"
    )

    fun setPointerValueToDataIsGreaterThanZero(label: LabelGenerator) = add(
            "M=0",                          // pointerValue to false
            "@${label("GT_TRUE")}",         // jump to true when equal
            "D; JGT",
            "@${label("GT_END")}",          // on not equal, just jump to end
            "0; JMP",
            "(${label("GT_TRUE")})",         // on equal
            "@SP",
            "A=M",
            "M=-1",                         // pointerValue to true (-1)
            "(${label("GT_END")})"
    )

    fun setPointerValueToDataIsLessThanZero(label: LabelGenerator) = add(
            "M=0",                          // pointerValue to false
            "@${label("LT_TRUE")}",         // jump to true when equal
            "D; JLT",
            "@${label("LT_END")}",          // on not equal, just jump to end
            "0; JMP",
            "(${label("LT_TRUE")})",        // on equal
            "@SP",
            "A=M",
            "M=-1",                         // pointerValue to true (-1)
            "(${label("LT_END")})"
    )

    fun initLocalVarToZero() {
        pushZeroOnStack()
        incrementStackPointer()
    }

    fun label(labelName: String) = add(
            "(${labelName})"
    )

    fun jumpToLabel(labelName: String) = add(
            "@${labelName}",
            "0; JMP"
    )

    fun conditionallyJumpToLabel(labelName: String) = add(
            // false is 0, non zero are treated as truth values
            "@${labelName}",
            "D; JNE"
//            // @TODO why jump on greater then?
//            "@${labelName}",
//            "D; JGT"
    )

    fun jumpToAddress() = add("0; JMP")
    fun build(): List<Assembly> = instructions.map {
        when {
            it.startsWith("//") -> AssemblyComment(it)
            it.startsWith("(") -> AssemblyLabel(it)
            else -> AssemblyInstruction(it)
        }
    }
    private fun add(vararg statements: String) = instructions.addAll(statements)
    private fun add(statements: List<String>) = instructions.addAll(statements)

    fun storeFrameAsTempVar() {
        // FRAME = LCL
        // @TODO can be optimized
        loadSegmentPointerIntoData("LCL")
        dataIntoTemp(FRAME)
    }

    fun storeReturnAddressAsTempVar() {
        // FRAME - 5
        loadConstantIntoData(5)
        subtractDataFromTempValueAsPointerIntoData(FRAME)
        dataIntoTemp(RETURN)
    }

    fun returnValue() {
        // last item on stack is return value, we need to return it in ARG 0
        decrementStackPointer()
        loadPointerValueIntoData()
        dataIntoArgument(0)
    }

    fun popCallStateFromStack() {
        // update the stack pointer to arg + 1
        loadArgumentPointerIntoData(1)
        resetStackPointerToData()
    }

    fun restoreCallerState(segment: Segment) {
        // FRAME - 1
        val diff = when (segment) {
            THAT -> 1
            THIS -> 2
            ARG -> 3
            LCL -> 4
            else -> throw IllegalStateException("Impossible to restore ${segment}")
        }

        loadConstantIntoData(diff)
        subtractDataFromTempValueAsAddressAndLoadValueIntoData(FRAME)

        when (segment) {
            THAT -> resetThatToData()
            THIS -> resetThisToData()
            ARG -> resetArgumentToData()
            LCL -> resetLocalToData()
            else -> throw IllegalStateException("Impossible to restore ${segment}")
        }
    }

    fun returnFromFunction() {
        loadTempAsAddress(RETURN)
        jumpToAddress()
    }

    fun storeReturnAddress(label: String) {
        // store label onto stack
        loadLabelIntoData(label)
        pushDataOnStack()
        incrementStackPointer()
    }

    fun storeCallerState(segment: Segment) {
        when (segment) {
            LCL -> loadSegmentPointerIntoData("LCL")
            ARG -> loadSegmentPointerIntoData("ARG")
            THIS -> loadSegmentPointerIntoData("THIS")
            THAT -> loadSegmentPointerIntoData("THAT")
//            else -> throw IllegalStateException("${{segment} is not a storable segment")
        }
        pushDataOnStack()
        incrementStackPointer()
    }

    fun initCalleeArgumentPointer(numberOfArguments: Int) {
        // ARG = SP - 5 -n args
        loadConstantIntoData(5 + numberOfArguments)
        subtractDataFromPointerIntoData()
        resetArgumentToData()
    }

    fun initCalleeLocalPointer() {
        // LCL = SP
        loadSegmentPointerIntoData("SP")
        resetLocalToData()
    }

    fun executeFunction(functionName: String) {
        jumpToLabel(functionName)
    }
}