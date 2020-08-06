module ll.api.Use;

import ll.c.Types;
import ll.c.Core;
import ll.api.Value;

    public  class Использование
    {
        private ЛЛИспользование экземпл;

        this(ЛЛИспользование экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        public ЛЛИспользование раскрой()
		{
			return this.экземпл;
		}

        public Использование следщ() 
		{
			return new Использование(ЛЛДайСледщИспользование(this.раскрой()));
		}

        public Значение пользователь()
		{
			return  new Значение(ЛЛДайПользователя(this.раскрой()));
		}

        public Значение использЗнач() 
		{
			return new Значение(ЛЛДайИспользованноеЗначение(this.раскрой()));
		}

        public override ткст вТкст()
		{
			return  this.пользователь.вТкст();
		}
    }

