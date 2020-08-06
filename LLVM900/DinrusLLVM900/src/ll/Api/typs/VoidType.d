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

        public override string имя () {return "проц";}
        public override bool типПервКласса_ли() {return false;}
    }
}
