module ll.api.typs.FP128Type;

import ll.api.typs.FPType;
import ll.c.Types;

    public class ТипПЗ128 : ТипПЗ
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

        public override ткст вТкст() {return "fp128";}
        public override бцел примитивнРазмерВБитах() {return  128;}
        public override цел ширинаМантиссы() {return  113;}
    }

