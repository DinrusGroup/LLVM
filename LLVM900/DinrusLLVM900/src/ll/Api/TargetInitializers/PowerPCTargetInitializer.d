module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;


    public  class PowerPCTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}

        public void Target() { LLVM.InitializePowerPCTarget();}
        public void TargetInfo() { LLVM.InitializePowerPCTargetInfo();}
        public void TargetMC() { LLVM.InitializePowerPCTargetMC();}
        public void AsmPrinter() { LLVM.InitializePowerPCAsmPrinter();}
        public void AsmParser() { LLVM.InitializePowerPCAsmParser();}
        public void Disassembler() { LLVM.InitializePowerPCDisassembler();}
    }

