module ll.api.vals.instructions.unary.VAArgInst;

import ll.c.Types, ll.c.Core;
import ll.api.vals.instructions.UnaryInstruction;


    public  class ВаАргИнстр : УнарнаяИнструкция
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
