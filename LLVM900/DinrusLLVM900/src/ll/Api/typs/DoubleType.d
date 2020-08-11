module ll.api.typs.DoubleType;

import ll.c.Types, ll.api.typs.FPType;

    public class ТипДво : ТипПЗ
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

        public override ткст вТкст() {return "дво";}
        public override бцел примитивнРазмерВБитах() {return  64;}
        public override бцел ширинаМантиссы() {return  53;}
    }

