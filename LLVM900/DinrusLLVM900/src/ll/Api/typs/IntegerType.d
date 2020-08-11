module ll.api.typs.IntegerType;

import ll.api.Type;
import ll.api.Context;
import ll.c.Core;
import ll.c.Types;
import ll.common;

    public  class ТипЦелое : Тип
    {
        public this(бцел битШирина)
		{ 
			this(ЛЛТипЦел(битШирина));
		}

        public this(Контекст контекст, бцел битШирина)
		{
			this(ЛЛТипЦелВКонтексте(контекст.раскрой(), битШирина));
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

        public бцел битШирина()
		{ 
			return ЛДайШиринуЦелТипа(this.раскрой());
		}

        public override бул типСОднимЗначением_ли() {return true;}

        public override ткст вТкст()
		{
			return фм("i{}", this.битШирина);
		}

        public override бцел примитивнРазмерВБитах() {return this.битШирина();}
    }

