module ll.api.vals.instructions.binary.FMul;

import ll.api.vals.instructions.BinaryOperator;
import ll.c.Types;

    public class FMul : БинОп
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
