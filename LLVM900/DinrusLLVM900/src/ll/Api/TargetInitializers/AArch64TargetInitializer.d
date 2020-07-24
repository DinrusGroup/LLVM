module ll.c.api.TargetInitializers.AArch64TargetInitializer;
import ll.c.api.TargetInitializers.TargetInitializer;

    public class AArch64TargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}
        public void Target() { LLVM.InitializeAArch64Target();}
        public void TargetInfo() { LLVM.InitializeAArch64TargetInfo();}
        public void TargetMC() { LLVM.InitializeAArch64TargetMC();}
        public void AsmPrinter() { LLVM.InitializeAArch64AsmPrinter();}
        public void AsmParser() { LLVM.InitializeAArch64AsmParser();}
        public void Disassembler() { LLVM.InitializeAArch64Disassembler();}
    }

