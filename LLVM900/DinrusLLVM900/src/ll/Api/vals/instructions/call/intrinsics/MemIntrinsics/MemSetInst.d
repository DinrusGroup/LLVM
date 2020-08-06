module ll.api.vals.instructions.call.intrinsics.MemIntrinsics.MemSetInst;

import ll.c.Types;
import ll.api.vals.instructions.call.intrinsics.MemIntrinsic;

    public  class ПамУстИнстр : ПамИнтринсик
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
