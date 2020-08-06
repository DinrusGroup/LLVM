module ll.c.api.TargetInitializers.ARMTargetInitializer;
import ll.c.api.TargetInitializers.TargetInitializer;

    public class ARMTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
		this() {}

        public void Target() { LLInitializeARMTarget();}
        public void TargetInfo() { LLInitializeARMTargetInfo();}
        public void TargetMC() { LLInitializeARMTargetMC();}
        public void AsmPrinter() { LLInitializeARMAsmPrinter();}
        public void AsmParser() { LLInitializeARMAsmParser();}
        public void Disassembler() { LLInitializeARMDisassembler();}
    }

