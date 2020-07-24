module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.IAsmParser;
import ll.c.api.TargetInitializers.TargetInitializer;
import ll.c.api.TargetInitializers.ITarget;
import ll.c.api.TargetInitializers.ITargetInfo;
import ll.c.api.TargetInitializers.ITargetMC;
import ll.c.api.TargetInitializers.IAsmPrinter;

    public  class MipsTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}
      
        public void Target() { LLVM.InitializeMipsTarget();}
        public void TargetInfo() { LLVM.InitializeMipsTargetInfo();}
        public void TargetMC() { LLVM.InitializeMipsTargetMC();}
        public void AsmPrinter() { LLVM.InitializeMipsAsmPrinter();}
        public void AsmParser() { LLVM.InitializeMipsAsmParser();}
        public void Disassembler() { LLVM.InitializeMipsDisassembler();}
    }

