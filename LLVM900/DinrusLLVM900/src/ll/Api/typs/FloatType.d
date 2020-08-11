module ll.api.typs.FloatType;

import ll.c.Types;
import ll.api.typs.FPType;

    public  class ТипПлав : ТипПЗ
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

        public override ткст вТкст() {return "плав";}
        public override бцел примитивнРазмерВБитах() {return  32;}
        public override цел ширинаМантиссы() {return  24;}
    }

