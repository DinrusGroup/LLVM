module ll.api.TargetLibraryInfo;

import ll.c.Target;
import ll.api.PassManager;

    public class ИнфОБибЦели
    {
        private ЛЛИнфоЦелевойБиблиотеки экземпл;

		this(ЛЛИнфоЦелевойБиблиотеки экзэмпл)
        {
            this.экземпл = экзэмпл;
        }
		
		public ЛЛИнфоЦелевойБиблиотеки раскрой()
		{
		return this.экземпл;
		}

        public проц добавьИнфо(МенеджерПроходок pm)
		{
			ЛЛДобавьИнфОЦБиб(this.раскрой(), pm.раскрой());
		}
    }
