module ll.api.vals.instructions.call.intrinsics.MemIntrinsics.MemTransferInst;

import ll.api.vals.instructions.call.intrinsics.MemIntrinsic;
import ll.c.Types;

    public class ПамТрансферИнстр : ПамИнтринсик
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
