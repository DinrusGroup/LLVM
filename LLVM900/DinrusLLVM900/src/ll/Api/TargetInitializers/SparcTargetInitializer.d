module ll.c.api.TargetInitializers.SparcTargetInitializer;


import ll.c.api.TargetInitializers.TargetInitializer;


    public  class SparcTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
		this(){}

        public void Target() { LLInitializeSparcTarget();}
        public void TargetInfo() { LLInitializeSparcTargetInfo();}
        public void TargetMC() { LLInitializeSparcTargetMC();}
        public void AsmPrinter() { LLInitializeSparcAsmPrinter();}
        public void AsmParser() { LLInitializeSparcAsmParser();}
        public void Disassembler() { LLInitializeSparcDisassembler();}
    }

