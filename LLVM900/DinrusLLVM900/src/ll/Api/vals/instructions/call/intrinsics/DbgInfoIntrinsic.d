module ll.api.vals.instructions.call.intrinsics.DbgInfoIntrinsic;

import ll.c.Types;
import ll.api.vals.instructions.call.IntrinsicInst;

    public class ОтладИнфоИнтринсик : ИнтринсикИнстр
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
