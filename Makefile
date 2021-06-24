.PHONY: build

default: build

build:
	./gradlew build
	unzip build/distributions/vmtranslator-shadow.zip
	cp script vmtranslator-shadow/bin/
	ln -s vmtranslator-shadow/bin/script VMTranslator

# gen:
# 	./gradlew run --args="src/test/resources/NestedCall/Sys.vm"
# 	mv Sys.asm src/test/resources/NestedCall/NestedCall.asm

# diff:
# 	ksdiff src/test/resources/NestedCall/NestedCall.out src/test/resources/NestedCall/NestedCall.cmp

# make DIR=FibonacciElement genDir
genDir:
	./gradlew run --args="src/test/resources/$(DIR)"
	mv $(DIR).asm src/test/resources/$(DIR)/$(DIR).asm

# make FILE=SimpleFunction diff
diffDir:
	ksdiff src/test/resources/$(DIR)/$(DIR).out src/test/resources/$(DIR)/$(DIR).cmp

# make FILE=SimpleCall gen
gen:
	./gradlew run --args="src/test/resources/$(FILE)/$(FILE).vm"
	mv $(FILE).asm src/test/resources/$(FILE)/$(FILE).asm

# make FILE=SimpleFunction diff
diff:
	ksdiff src/test/resources/$(FILE)/$(FILE).out src/test/resources/$(FILE)/$(FILE).cmp

submit: clean
	zip -r project7.zip lang.txt Makefile script build.gradle.kts gradle gradlew settings.gradle.kts src

clean:
	rm -rf build vmtranslator-shadow project7.zip VMTranslator
