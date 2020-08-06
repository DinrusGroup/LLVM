module ll.api.vals.instructions.GetElementPtrInst;

import ll.api.vals.Instruction;
import ll.c.Types;

    public  class ДайУкЭлтаИнстр : Инструкция
    {
		private ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экзэмпл = экзэмпл;
        }

        public override ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}

    }
