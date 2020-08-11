module ll.api.vals.consts.GlobalValues.GlobalObject;

import ll.c.Types;
import ll.api.vals.consts.GlobalValue;


    public class ГлобОбъект : ГлобЗначение
    {
        private ЛЛЗначение экземпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экземпл = экземпл;
        
        }

		public override ЛЛЗначение раскрой()
		{
            return this.экземпл;
		}
    }
