module ll.api.vals.consts.GlobalValues.GlobalAlias;

import ll.c.Types;
import ll.api.vals.consts.GlobalValue;

    public  class ГлобНик : ГлобЗначение
    {
        private ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);        
        }

        public override ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}
    }
