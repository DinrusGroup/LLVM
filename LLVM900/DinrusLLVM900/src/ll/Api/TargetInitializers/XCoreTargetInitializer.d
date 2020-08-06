module ll.api.TargetInitializers.XCoreTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;

    public  class XCoreTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IDisassembler
    {
        this(){}

        public void Target() { LLInitializeXCoreTarget();}
        public void TargetInfo() { LLInitializeXCoreTargetInfo();}
        public void TargetMC() { LLInitializeXCoreTargetMC();}
        public void AsmPrinter() { LLInitializeXCoreAsmPrinter();}
        public void Disassembler() { LLInitializeXCoreDisassembler();}
    }

