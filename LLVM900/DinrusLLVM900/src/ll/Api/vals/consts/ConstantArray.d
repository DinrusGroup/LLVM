module ll.api.vals.consts.ConstantArray;

import ll.c.Types;
import ll.c.Core;
import ll.api.vals.Constant;
import ll.api.Type;

    public  class КонстМассив : Константа
    {
        private ЛЛЗначение экземпл;  
        private Константа[] значения;

        public this(Тип тип, Константа[] знач)
		{  
            ЛЛЗначение[] значения;

            foreach(зн;знач)
			{
                значения ~= зн.раскрой();
			}
			this(ЛЛКонстМассив(тип.раскрой(), cast(ЛЛЗначение*) &значения, значения.length));
            this.значения = знач;
		}

			public this(ЛЛЗначение экземпл)
			{
             super(экземпл);
			 this.экземпл = экземпл;
			}

            public override ЛЛЗначение раскрой(){return this.экземпл;}                             
        
    }
