module ll.api.typs.X86MMXType;

    import ll.api.Type;
    import ll.c.Types;

    public  class ТипХ86ММХ : Тип
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

        public override ткст вТкст() {return "х86_ммх";}

        public override бцел примитивнРазмерВБитах() {return 64;}

        public override бул типСОднимЗначением_ли() {return true;}

        public override бул можетИметьКонстанты() {return false;}

        public override бул можетИметьМассивы() {return false;}

        public override бул можетИметьВекторы() {return false;}
/+
        protected override ткст дайСообОбОграниченномТипе()
            {
			return	"Этот тип представляет собой значение, содержащееся в регистре MMX машины x86. Массивы, векторы или константы с этим типом невозможны.";
			}
        +/
    }

