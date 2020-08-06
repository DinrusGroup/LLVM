module ll.api.vals.instructions.unary.CastInst;

import ll.api.vals.instructions.UnaryInstruction;
import ll.c.Types;

    public class КастИнстр : УнарнаяИнструкция
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
