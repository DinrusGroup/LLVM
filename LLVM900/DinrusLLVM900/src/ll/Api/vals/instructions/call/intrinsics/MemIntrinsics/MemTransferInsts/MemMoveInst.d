module ll.api.vals.instructions.call.intrinsics.MemIntrinsics.MemTransferInsts.MemMoveInst;

import ll.c.Types;
import ll.api.vals.instructions.call.intrinsics.MemIntrinsics.MemTransferInst;

    public class ПереместПамИнстр : ПамТрансферИнстр
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
