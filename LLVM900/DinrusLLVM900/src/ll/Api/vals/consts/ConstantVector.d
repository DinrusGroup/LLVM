module ll.api.vals.consts.ConstantVector;

import ll.c.Core, ll.c.Types;
import ll.api.vals.Constant;

    public  class КонстВектор : Константа    
    {
        private Константы значения;

        public this(Константа[] скалярнЗначения)
		{

            ЛЛЗначение[] значения;
            foreach(зн; скалярнЗначения)
			{
                значения ~= зн.раскрой();
			}            
			this(ЛЛКонстВектор(cast(ЛЛЗначение*)&значения, значения.length));
            this.значения = скалярнЗначения;

		}

			this(ЛЛЗначение экзэмпл)
			{
            super(экзэмпл);        
            }
    }
