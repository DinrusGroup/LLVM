module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;


    public  class MipsTargetInitializer : TargetInitializer,
        ITarget, ITargetInfo, ITargetMC, IAsmPrinter, IAsmParser, IDisassembler
    {
        this(){}
      
        public void Target() { LLInitializeMipsTarget();}
        public void TargetInfo() { LLInitializeMipsTargetInfo();}
        public void TargetMC() { LLInitializeMipsTargetMC();}
        public void AsmPrinter() { LLInitializeMipsAsmPrinter();}
        public void AsmParser() { LLInitializeMipsAsmParser();}
        public void Disassembler() { LLInitializeMipsDisassembler();}
    }

