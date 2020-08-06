module ll.api.vals.consts.ConstantStruct;

import ll.c.Types, ll.c.Core;
import ll.api.vals.Constant;
import ll.api.Context;
import ll.api.Type;
import ll.api.Value;

    public class КонстСтрукт : Константа
    {
        public this(Значение[] значения)
		{ 
			this(значения, false);
		}

        public this(Значение[] значения, бул packed)
		{ 
			this(ЛЛКонстСтрукт(значения.раскрой(), packed));
		}

        public this(Контекст контекст, Значение[] значения)
		{ 
			this(контекст, значения, false);
		}

        public this(Контекст контекст, Значение[] значения, бул packed)
		{
			this(ЛЛКонстСтруктВКонтексте(контекст.раскрой(), значения.раскрой(), packed));
		}

        public this(Тип типСтрукт, Константа[] значения)
		{ 
			this(ЛЛИменованнаяКонстСтрукт(типСтрукт.раскрой(), значения.раскрой()));
		}

			this(ЛЛЗначение экзэмпл)
			{
            super(экзэмпл);        
            }
    }
		}