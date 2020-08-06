module ll.c.api.TargetInitializers.MipsTargetInitializer;

import ll.c.api.TargetInitializers.TargetInitializer;
import ll.c.Target;


    public  class NativeTargetInitializer : TargetInitializer,
        ITarget, IAsmPrinter, IAsmParser, IDisassembler
    {
		this(){}
        public void Target() { ЛЛИнициализуйНативныйТаргет();}
        public void AsmPrinter() { ЛЛИнициализуйНативныйАсмПринтер();}
        public void AsmParser() { ЛЛИнициализуйНативныйАсмПарсер();}
        public void Disassembler() { ЛЛИнициализуйНативныйДизассемблер();}
    }

