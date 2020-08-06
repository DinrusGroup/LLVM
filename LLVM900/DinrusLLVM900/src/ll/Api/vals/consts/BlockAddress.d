module ll.api.vals.consts.BlockAddress;

import ll.c.Types;
import ll.api.vals.Constant;

    public  class АдресБлока : Константа
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
