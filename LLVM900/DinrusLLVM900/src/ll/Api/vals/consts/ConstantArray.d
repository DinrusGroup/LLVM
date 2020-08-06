module ll.api.vals.consts.ConstantArray;

import ll.c.Types;
import ll.c.Core;
import ll.api.vals.Constant;
import ll.api.Type;

    public  class КонстМассив : Константа
    {
        private ЛЛЗначение экзэмпл;
        public this(Тип тип, Константа[] знач)
		{ 
			this(ЛЛКонстМассив(тип.раскрой(), знач.раскрой(), знач.length));
		}

			this(ЛЛЗначение экзэмпл)
			{
             super(экзэмпл);
				this.экзэмпл = экзэмпл;
			}

            public override ЛЛЗначение раскрой(){return this.экзэмпл;}                             
        
    }
