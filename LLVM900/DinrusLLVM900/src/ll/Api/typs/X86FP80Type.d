module ll.api.typs.X86FP80Type;

import ll.api.typs.FPType;
import ll.c.Types;

    public  class ТипХ86ПЗ80 : ТипПЗ
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

        public override string имя() {return "х86_пз80";}
        public override uint примитивнРазмерВБитах() {return 80;}
        public override int ширинаМантиссы() {return 64;}
    }
}
