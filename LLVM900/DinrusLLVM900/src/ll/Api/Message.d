module ll.api.Message;

    import ll.c.Core, ll.common;

    public class Сообщение
    {
        private ук экземпл;

        public this(ткст сооб)
		{ 
			this(ЛЛCоздайCообщение(вТкст0(сооб)));
		}

        this(ук сооб)
		{
			this.экземпл = сооб;
		}

        ~this() { ЛЛВыместиСообщение(cast(ткст0) this.экземпл);}
    }

