module ll.api.TargetInitializers.X86TargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;

    public class X86TargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}

        public void Target() { LLInitializeX86Target();}
        public void TargetInfo() { LLInitializeX86TargetInfo();}
        public void TargetMC() { LLInitializeX86TargetMC();}
        public void AsmPrinter() { LLInitializeX86AsmPrinter();}
        public void AsmParser() { LLInitializeX86AsmParser();}
        public void Disassembler() { LLInitializeX86Disassembler();}
    }

