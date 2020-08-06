module ll.api.typs.FPType;

import ll.api.Type;
import ll.c.Types;

    public abstract class ТипПЗ : Тип
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

        public abstract цел ширинаМантиссы();
        public abstract бцел примитивнРазмерВБитах();
        public override бул типСОднимЗначением_ли() {return true;}
    }

