module ll.api.vals.instructions.AtomicRMWInst;

import ll.api.vals.Instruction;
import ll.c.Types;

    public  class AtomicRMWInst : Инструкция
    {
		private ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экзэмпл = экзэмпл;
        }

        public ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}
    }
