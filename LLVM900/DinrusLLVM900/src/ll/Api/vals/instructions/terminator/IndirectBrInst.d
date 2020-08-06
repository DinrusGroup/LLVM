module ll.api.vals.instructions.terminator.IndirectBrInst;

import ll.api.vals.instructions.TerminatorInst;
import ll.api.vals.BasicBlock;
import ll.c.Core, ll.c.Types;

    public  class НепрямБрИнстр : ТерминаторИнстр
    {
        this (ЛЛЗначение экзэмпл){ super(экзэмпл);}

        public проц добавьПриёмник (БазБлок dest)
		{
			ЛЛДобавьПриёмник(this.раскрой(), dest.раскрой());
		}
    }
