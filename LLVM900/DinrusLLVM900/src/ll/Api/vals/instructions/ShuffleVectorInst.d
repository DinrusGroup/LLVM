module ll.api.vals.instructions.ShuffleVectorInst;

   import ll.api.vals.Instruction;
   import ll.c.Types;

    public  class ШафлВекторИнстр : Инструкция
    {
		private ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экзэмпл = экзэмпл;
        }

        public ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}

    }
