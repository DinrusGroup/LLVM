module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;
import ll.c.api.TargetInitializers.ITarget;
import ll.c.api.TargetInitializers.ITargetInfo;
import ll.c.api.TargetInitializers.ITargetMC;
import ll.c.api.TargetInitializers.IAsmPrinter;

    public class MSP430TargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter
    {
        this(){}

        public void Target() { LLVM.InitializeMSP430Target();}
        public void TargetInfo() { LLVM.InitializeMSP430TargetInfo();}
        public void TargetMC() { LLVM.InitializeMSP430TargetMC();}
        public void AsmPrinter() { LLVM.InitializeMSP430AsmPrinter();}
    }
}
