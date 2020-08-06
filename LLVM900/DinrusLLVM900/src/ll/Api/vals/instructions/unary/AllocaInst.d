module ll.api.vals.instructions.unary.AllocaInst;

import ll.c.Types, ll.c.Core;
import ll.api.vals.instructions.UnaryInstruction;


    public class РазместаИнстр : УнарнаяИнструкция
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

        public бцел раскладка()
        {
            return ЛЛДайРаскладку(this.раскрой());
        }

        public проц раскладка(бцел значение)
        {
           ЛЛУстРаскладку(this.раскрой(), значение);
		}
    }
