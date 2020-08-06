module ll.api.typs.PPCFP128Type;

import ll.api.typs.FPType;
import ll.c.Types;

    public  class ТипППЦПЗ128 : ТипПЗ
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

        public override ткст имя()
		{
			return "ппц_пз128";
		}

        public override бцел примитивнРазмерВБитах() { return 80;}

        public override цел ширинаМантиссы() {return -1;}
    }

