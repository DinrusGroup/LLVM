module ll.api.typs.Composite.SequentialType;

import ll.api.Type;
import ll.c.Core;
import ll.c.Types;
import ll.api.typs.Composite.CompositeType;

    public abstract class SequentialType : ТипКомпозит
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

        public Тип типЭлемента()
		{
			return new Тип(ЛЛДайТипЭлемента(this.раскрой()));
	    }

        public abstract бцел длина();

        public override бул валиденИндекс_ли(бцел индекс) {return true;}

        public override Тип дайТипПоИндексу(бцел индекс) {return this.типЭлемента;}
    }

