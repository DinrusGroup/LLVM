module ll.api.vals.instructions.terminator.SwitchInst;

import ll.api.vals.instructions.TerminatorInst;
import ll.api.vals.BasicBlock;
import ll.api.Value;
import ll.c.Types, ll.c.Core;
import ll.api.vals.consts.ConstantInt;

    public  class ЩитИнстр : ТерминаторИнстр
    {
        this (ЛЛЗначение экзэмпл){super(экзэмпл);}

        public БазБлок дайДефПриёмник(Значение switchInstr)
		{
			return new БазБлок(ЛЛДайДефПриёмникРеле(this.раскрой()));
		}

        public проц добавьРеле(КонстЦел onVal, БазБлок dest) 
		{ 
			ЛЛДобавьРеле(this.раскрой(), onVal.раскрой(), dest.раскрой());
		}
    }
