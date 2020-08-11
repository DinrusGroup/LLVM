module ll.api.SymbolIterator;

import ll.c.Types, ll.c.Object, ll.common;

    public class СимвИтератор
    {
        private ЛЛСимвИтератор экземпл;

        this(ЛЛСимвИтератор экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        ~this()
        {
            ЛЛВыместиСимвИтератор(this.раскрой());
        }


        public ЛЛСимвИтератор раскрой(){return this.экземпл;}


        public проц перейдиКСледщСимв()
		{
			ЛЛПереместисьКСледщСимволу(this.раскрой());
		}

        public ткст имяСимвола()
		{
			return ll.common.вТкст(ЛЛДайИмяСимвола(this.раскрой()));
		}

        public цел адресСимвола()
		{
			return cast(цел)ЛЛДайАдресСимвола(this.раскрой());
		}

        public цел размерСимвола ()
		{ 
			return cast(цел)ЛЛДайРазмСимвола(this.раскрой());
		}
    }

