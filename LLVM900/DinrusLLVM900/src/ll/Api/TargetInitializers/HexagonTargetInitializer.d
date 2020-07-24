module ll.c.api.TargetInitializers.HexagonTargetInitializer;
import ll.c.api.TargetInitializers.TargetInitializer;

    public class HexagonTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter
    {
        this(){}
        public void Target() { LLVM.InitializeHexagonTarget();}
        public void TargetInfo() { LLVM.InitializeHexagonTargetInfo();}
        public void TargetMC() { LLVM.InitializeHexagonTargetMC();}
        public void AsmPrinter() { LLVM.InitializeHexagonAsmPrinter();}
    }

