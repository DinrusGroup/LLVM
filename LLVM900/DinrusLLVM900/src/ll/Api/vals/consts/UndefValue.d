module ll.api.vals.consts.UndefValue;

import ll.c.Core, ll.c.Types;
import ll.api.Type;
import ll.api.vals.Constant;

    public class НеопрЗначение : Константа
    {
        private ЛЛЗначение экзэмпл;

        public this(Тип тип)
		{ 
			this(ЛЛДайНеопр(тип.раскрой()));           
		}

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экзэмпл = super.раскрой();            
        }

		public override ЛЛЗначение раскрой()
		{
			return this.экзэмпл;
		}
        
    }