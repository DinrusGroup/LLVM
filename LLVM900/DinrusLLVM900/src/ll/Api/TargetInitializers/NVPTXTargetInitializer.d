module ll.c.api.TargetInitializers.NVPTXTargetInitializer;

import ll.c.api.TargetInitializers.IAsmParser;
import ll.c.api.TargetInitializers.TargetInitializer;
import ll.c.api.TargetInitializers.ITarget;
import ll.c.api.TargetInitializers.ITargetInfo;
import ll.c.api.TargetInitializers.ITargetMC;
import ll.c.api.TargetInitializers.IAsmPrinter;

    public  class NVPTXTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter
    {
        this(){}

        public void Target() { LLVM.InitializeNVPTXTarget();}
        public void TargetInfo() { LLVM.InitializeNVPTXTargetInfo();}
        public void TargetMC() { LLVM.InitializeNVPTXTargetMC();}
        public void AsmPrinter() { LLVM.InitializeNVPTXAsmPrinter();}
    }

