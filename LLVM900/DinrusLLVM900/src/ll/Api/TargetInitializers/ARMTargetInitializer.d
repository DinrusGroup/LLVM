module ll.c.api.TargetInitializers.ARMTargetInitializer;
import ll.c.api.TargetInitializers.TargetInitializer;

    public class ARMTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
		this() {}

        public void Target() { LLVM.InitializeARMTarget();}
        public void TargetInfo() { LLVM.InitializeARMTargetInfo();}
        public void TargetMC() { LLVM.InitializeARMTargetMC();}
        public void AsmPrinter() { LLVM.InitializeARMAsmPrinter();}
        public void AsmParser() { LLVM.InitializeARMAsmParser();}
        public void Disassembler() { LLVM.InitializeARMDisassembler();}
    }

