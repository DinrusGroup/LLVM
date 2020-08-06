module ll.api.vals.instructions.cmp.FCmpInst;

import ll.c.Types;
import ll.c.Core;
import ll.api.vals.instructions.CmpInst;

    public  class ПСравнИнстр : СравнИнстр
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

        public ЛЛПредикатРеала предикат()
		{ 
			return ЛЛДайПредикатПСравн(this.раскрой());
		}
    }
