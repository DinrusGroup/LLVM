module ll.api.TargetInitializers.SystemZTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;

    public class SystemZTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}

        public void Target() { LLInitializeSystemZTarget();}
        public void TargetInfo() { LLInitializeSystemZTargetInfo();}
        public void TargetMC() { LLInitializeSystemZTargetMC();}
        public void AsmPrinter() { LLInitializeSystemZAsmPrinter();}
        public void AsmParser() { LLInitializeSystemZAsmParser();}
        public void Disassembler() { LLInitializeSystemZDisassembler();}
    }

