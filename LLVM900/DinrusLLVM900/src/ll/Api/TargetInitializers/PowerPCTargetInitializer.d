module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;


    public  class PowerPCTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}

        public void Target() { LLInitializePowerPCTarget();}
        public void TargetInfo() { LLInitializePowerPCTargetInfo();}
        public void TargetMC() { LLInitializePowerPCTargetMC();}
        public void AsmPrinter() { LLInitializePowerPCAsmPrinter();}
        public void AsmParser() { LLInitializePowerPCAsmParser();}
        public void Disassembler() { LLInitializePowerPCDisassembler();}
    }

