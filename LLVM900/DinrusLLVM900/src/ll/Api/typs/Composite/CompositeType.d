module ll.api.typs.Composite.CompositeType;

import ll.api.Type;
import ll.c.Types;

    public abstract class ТипКомпозит : Тип
    {
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

        //public Тип this[бцел индекс] { this.дайТипПоИндексу(индекс);}

        public abstract бул валиденИндекс_ли(бцел индекс);
        public abstract Тип дайТипПоИндексу(бцел индекс);
    }

    

