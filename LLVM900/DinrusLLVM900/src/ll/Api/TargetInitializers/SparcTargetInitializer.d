module ll.c.api.TargetInitializers.SparcTargetInitializer;


import ll.c.api.TargetInitializers.TargetInitializer;


    public  class SparcTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
		this(){}

        public void Target() { LLVM.InitializeSparcTarget();}
        public void TargetInfo() { LLVM.InitializeSparcTargetInfo();}
        public void TargetMC() { LLVM.InitializeSparcTargetMC();}
        public void AsmPrinter() { LLVM.InitializeSparcAsmPrinter();}
        public void AsmParser() { LLVM.InitializeSparcAsmParser();}
        public void Disassembler() { LLVM.InitializeSparcDisassembler();}
    }

