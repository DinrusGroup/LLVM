module ll.api.typs.VoidType;

import ll.api.Type;
import ll.c.Types;

    public class ТипПроц : Тип
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

        public override ткст вТкст() {return "проц";}
        public override бул типПервКласса_ли() {return нет;}
    }

