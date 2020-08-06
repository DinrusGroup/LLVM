module ll.c.api.TargetInitializers.NVPTXTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;

    public  class NVPTXTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter
    {
        this(){}

        public void Target() { LLInitializeNVPTXTarget();}
        public void TargetInfo() { LLInitializeNVPTXTargetInfo();}
        public void TargetMC() { LLInitializeNVPTXTargetMC();}
        public void AsmPrinter() { LLInitializeNVPTXAsmPrinter();}
    }

