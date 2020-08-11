module ll.api.typs.HalfType;

import ll.api.Type;
import ll.api.typs.FPType;
import ll.c.Types;

    public class Полутип : ТипПЗ
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

        public override ткст вТкст() {return "пол";}
        public override бцел примитивнРазмерВБитах() {return 16;}
        public override цел ширинаМантиссы() {return 11;}
    }

