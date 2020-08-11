module ll.api.vals.instructions.LandingPadInst;

import ll.api.vals.Instruction;
import ll.api.Value;
import ll.c.Core;
import ll.c.Types;

    public  class ЛэндингПадИнстр : Инструкция
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

        public бул очистка_ли()
        {
            return ЛЛОчистка_ли(this.раскрой());
        }

        public проц устОчистку(бул знач)
		{
            ЛЛУстОчистку(this.раскрой(), знач);

		}

        public проц добавьКлоз(Значение значКлоз)
		{
			ЛЛДобавьКлоз(this.раскрой(), значКлоз.раскрой());
		}
    }
