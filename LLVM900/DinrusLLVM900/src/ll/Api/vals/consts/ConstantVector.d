module ll.api.vals.consts.ConstantVector;

import ll.c.Core, ll.c.Types;
import ll.api.vals.Constant;

    public  class КонстВектор : Константа
    {
        public this(Константа[] скалярнЗначения)
		{
			this(ЛЛКонстВектор(скалярнЗначения.раскрой()));
		}

			this(ЛЛЗначение экзэмпл)
			{
            super(экзэмпл);        
            }
    }
