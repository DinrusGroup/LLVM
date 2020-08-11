module ll.api.Message;

    import ll.c.Core, ll.common;

    public class Сообщение
    {
        private ткст экземпл;
        protected ткст0 ориг;

        public this(ткст сооб)
		{ 
			
            this.экземпл = сооб;
            this.ориг  = ЛЛCоздайCообщение(вТкст0(сооб));
		}

        ~this() { ЛЛВыместиСообщение(cast(ткст0) this.экземпл);}
    }

