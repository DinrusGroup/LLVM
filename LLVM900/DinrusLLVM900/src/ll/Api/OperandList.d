module ll.api.OperandList;

import ll.api.Value;
import ll.c.Types, ll.c.Core;

    public  class СписокОперандов
    {
         private Значение значение;

        this(Значение значение)
        {
            this.значение = значение;
        }

        public цел счёт()
		{
			return ЛЛДайЧлоОперандов(this.значение.раскрой());
		}

        public Значение дайОперанд(бцел индекс)
        {
            return new Значение(ЛЛДайОперанд(this.значение.раскрой(), индекс));
        }

        public проц устОперанд(Значение зн, бцел индекс )
		{
            ЛЛУстОперанд(this.значение.раскрой(), индекс, зн.раскрой());

		}

    }

