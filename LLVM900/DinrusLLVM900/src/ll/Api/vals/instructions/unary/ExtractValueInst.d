module ll.api.vals.instructions.unary.ExtractValueInst;

import ll.c.Types, ll.c.Core;
import ll.api.vals.instructions.UnaryInstruction;

    public class ИзвлекиЗначИнстр : УнарнаяИнструкция
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
