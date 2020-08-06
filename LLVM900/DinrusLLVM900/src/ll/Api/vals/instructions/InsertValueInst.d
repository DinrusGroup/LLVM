module ll.api.vals.instructions.InsertValueInst;

import ll.api.vals.Instruction;
import ll.c.Types;

    public  class ВставьЗначИнстр : Инструкция
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
