module ll.c.api.TargetInitializers.AArch64TargetInitializer;
import ll.c.api.TargetInitializers.TargetInitializer;

    public class AArch64TargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}
        public void Target() { LLInitializeAArch64Target();}
        public void TargetInfo() { LLInitializeAArch64TargetInfo();}
        public void TargetMC() { LLInitializeAArch64TargetMC();}
        public void AsmPrinter() { LLInitializeAArch64AsmPrinter();}
        public void AsmParser() { LLInitializeAArch64AsmParser();}
        public void Disassembler() { LLInitializeAArch64Disassembler();}
    }

