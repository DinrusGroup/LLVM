module ll.api.vals.instructions.call.intrinsics.MemIntrinsic;

import ll.c.Types;
import ll.api.vals.instructions.call.IntrinsicInst;

    public class ПамИнтринсик : ИнтринсикИнстр
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
