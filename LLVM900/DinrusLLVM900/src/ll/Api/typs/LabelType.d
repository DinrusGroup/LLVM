module ll.api.typs.LabelType;

import ll.api.Type;
import ll.c.Types;
import ll.c.Core;
import ll.api.Context;

    public class ТипЯрлык : Тип
    {
        public this()
		{ 
			this(ЛЛТипЯрлык());
		}

        public this(Контекст контекст)
		{ 
			this(ЛЛТипЯрлыкВКонтексте(контекст.раскрой()));
		}

		private ЛЛТип экзэмпл;

        this(ЛЛТип экзэмпл)
		{
            super(экзэмпл);
			this.экзэмпл = экзэмпл;
			
        }

        public override ЛЛТип раскрой()
		{
            return this.экзэмпл;
		}

        public override ткст вТкст()
		{ 
			return "ярлык";
		}
    }

