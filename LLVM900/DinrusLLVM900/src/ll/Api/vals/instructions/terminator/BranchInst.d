module ll.api.vals.instructions.terminator.BranchInst;

import ll.api.vals.instructions.TerminatorInst;
import ll.api.Value;
import ll.c.Core;
import ll.c.Types;

    public  class ВетвьИнстр : ТерминаторИнстр
    {
        private ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экзэмпл = экзэмпл;
        }

        public override ЛЛЗначение раскрой(){return this.экзэмпл;}

        public бул сУсловием_ли()
		{ 
			return ЛЛУсловн_ли(this.раскрой());
		}

        public бул безУсловия_ли()
		{
			return !this.сУсловием_ли();
		}

        public Значение условие()
        {
            return new Значение(ЛЛДайУсловие(this.раскрой()));
        }

		public проц условие(Значение значение)
        {
            ЛЛУстУсловие(this.раскрой(), значение.раскрой());
        }
    }
