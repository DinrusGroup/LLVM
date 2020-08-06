module ll.api.vals.instructions.unary.LoadInst;

import ll.c.Types, ll.c.Core;
import ll.api.vals.instructions.UnaryInstruction;
import ll.api.vals.instructions.IMemoryAccessInstruction;

    public class ГрузиИнстр : УнарнаяИнструкция, ИИнструкцияДоступаКПамяти
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

        public проц волатилен_ли()
        {
            return ЛЛДайВолатил(this.раскрой());
           // set { ЛЛУстВолатил(this.раскрой(), значение);
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
