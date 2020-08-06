module ll.api.vals.instructions.call.IntrinsicInst;

import ll.c.Types;
import ll.api.vals.instructions.CallInst;

    public class ИнтринсикИнстр : ВызовИнстр
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
    }
