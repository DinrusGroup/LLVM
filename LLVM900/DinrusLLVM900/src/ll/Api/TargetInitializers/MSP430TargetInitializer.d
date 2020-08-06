module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;

    public class MSP430TargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter
    {
        this(){}

        public void Target() { LLInitializeMSP430Target();}
        public void TargetInfo() { LLInitializeMSP430TargetInfo();}
        public void TargetMC() { LLInitializeMSP430TargetMC();}
        public void AsmPrinter() { LLInitializeMSP430AsmPrinter();}
    }
