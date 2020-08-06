module ll.c.api.TargetInitializers.HexagonTargetInitializer;
import ll.c.api.TargetInitializers.TargetInitializer;

    public class HexagonTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter
    {
        this(){}
        public void Target() { LLInitializeHexagonTarget();}
        public void TargetInfo() { LLInitializeHexagonTargetInfo();}
        public void TargetMC() { LLInitializeHexagonTargetMC();}
        public void AsmPrinter() { LLInitializeHexagonAsmPrinter();}
    }

