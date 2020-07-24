module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.IAsmParser;
import ll.c.api.TargetInitializers.TargetInitializer;
import ll.c.api.TargetInitializers.ITarget;
import ll.c.api.TargetInitializers.ITargetInfo;
import ll.c.api.TargetInitializers.ITargetMC;
import ll.c.api.TargetInitializers.IAsmPrinter;

    public  class NativeTargetInitializer : TargetInitializer,
        ITarget, IAsmPrinter, IAsmParser, IDisassembler
    {
		this(){}
        public void Target() { LLVM.InitializeNativeTarget();}
        public void AsmPrinter() { LLVM.InitializeNativeAsmPrinter();}
        public void AsmParser() { LLVM.InitializeNativeAsmParser();}
        public void Disassembler() { LLVM.InitializeNativeDisassembler();}
    }

