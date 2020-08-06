module ll.api.vals.instructions.call.intrinsics.DbgInfoIntrinsics.DbgValueInst;

import ll.api.vals.instructions.call.intrinsics.DbgInfoIntrinsic;
import ll.c.Types;

    public class ОтладЗначИнстр : ОтладИнфоИнтринсик
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
