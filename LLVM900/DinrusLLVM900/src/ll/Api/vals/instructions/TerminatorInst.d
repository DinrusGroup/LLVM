module ll.api.vals.instructions.TerminatorInst;

   import ll.api.vals.Instruction;
   import ll.api.vals.BasicBlock;
   import ll.c.Core, ll.c.Types;

    public abstract class ТерминаторИнстр : Инструкция
    {
        private ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экзэмпл = экзэмпл;
        }

		public override ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}

        public бцел члоПоследователей()
		{
			return ЛЛДайЧлоПоследователей(this.раскрой());
		}

        public БазБлок дайПоследователь(бцел инд) 
		{
			return new БазБлок(ЛЛДайПоследователь(this.раскрой(), инд));
		}

        public проц устПоследователь(бцел инд, БазБлок b) 
		{
			ЛЛУстПоследователь(this.раскрой(), инд, b.раскрой());
		}
    }
