module ll.api.vals.instructions.unary.casts.FPToUIInst;

import ll.c.Types;
import ll.api.vals.instructions.unary.CastInst;

    public class ПЗвБЦИнстр : КастИнстр
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
