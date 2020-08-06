module ll.api.DiagnosticInfo;

import ll.c.Types, ll.c.Core;
import ll.common;

    public class ИнфоДиагностики
    {
        private ЛЛИнфоДиагностики экземпл; 

        this(ЛЛИнфоДиагностики экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        public ЛЛИнфоДиагностики раскрой(){return this.экземпл;}

        public ЛЛСтрогостьДиагностики строгость()
		{ 
			return ЛЛДайСтрогостьДиагИнфо(this.раскрой());
		}

        public ткст описание()
		{
			вТкст(ЛЛДайОписаниеДиагИнфо(this.раскрой()));
		}
    }
}
