module ll.api.vals.instructions.binary.SDiv;

import ll.api.vals.instructions.BinaryOperator;
import ll.c.Types;

    public class SDiv : БинОп
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
