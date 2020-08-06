module ll.api.vals.instructions.call.intrinsics.DbgInfoIntrinsics.DbgDeclareInst;

import ll.api.vals.instructions.call.intrinsics.DbgInfoIntrinsic;
import ll.c.Types;

    public class ОтладДеклИнстр : ОтладИнфоИнтринсик
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
