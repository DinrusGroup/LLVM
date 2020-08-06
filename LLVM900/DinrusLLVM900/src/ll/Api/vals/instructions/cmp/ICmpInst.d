module ll.api.vals.instructions.cmp.ICmpInst;

import ll.c.Core;
import ll.c.Types;
import ll.api.vals.instructions.CmpInst;

    public  class ЦСравнИнстр : СравнИнстр
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

        public ЛЛЦелПредикат предикат()
		{
			return ЛЛДайПредикатЦСравн(this.раскрой());
		}
    }
