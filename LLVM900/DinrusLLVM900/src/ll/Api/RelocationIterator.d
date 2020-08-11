module ll.api.RelocationIterator;

import ll.api.SymbolIterator;
import ll.c.Types, ll.c.Object, ll.common;

    public class ИтераторРелокаций
    {
        private ЛЛИтераторРелокаций экземпл;

        this(ЛЛИтераторРелокаций экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        ~this()
        {
            ЛЛВыместиИтераторРелокаций(this.раскрой());
        }

        public ЛЛИтераторРелокаций раскрой(){return this.экземпл;}

        public проц перейдиКСледщРелок()
        {
            ЛЛПереместисьКСледщРелокации(this.раскрой());
        }

        public бдол смещение ()
		{
			return ЛЛДайСмещениеРелокации(this.раскрой());
		}

        public СимвИтератор символ()
		{ 
			return new СимвИтератор(ЛЛДайСимволРелокации(this.раскрой()));
		}

        public бдол тип()
		{
			return ЛЛДайТипРелокации(this.раскрой());
		}

        public ткст имяТипа()
		{ 
			return ll.common.вТкст(ЛЛДайИмяТипаРелокации(this.раскрой()));
		}

        public ткст ткстЗначения ()
		{
			return ll.common.вТкст(ЛЛДайТкстЗначенияРелокации(this.раскрой()));
		}
    }

