module ll.api.vals.consts.ConstantPointerNull;

import ll.api.vals.Constant;
import ll.api.Type;
import ll.c.Types, ll.c.Core;

    public class КонстУкПусто : Константа
    {
        public this(Тип тип)
		{
			this(ЛЛКонстУкПусто(тип.раскрой()));
	    }

		this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
        }
        
    }