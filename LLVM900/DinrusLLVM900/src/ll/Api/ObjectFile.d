module ll.api.ObjectFile;

import ll.api.SymbolIterator;
import ll.api.SectionIterator;
import ll.c.Types, ll.c.Core, ll.c.Object;

    public class ОбъФайл
    {
		private ЛЛФайлОбъекта экземпл;
		
        public this(БуфПам буфПам)
        {
            return this(ЛЛСоздайФайлОбъекта(буфПам.раскрой()));
        }        

        this(ЛЛФайлОбъекта экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        ~this()
		{
		 ЛЛВыместиФайлОбъекта(this.раскрой());
		}
		
		public ЛЛФайлОбъекта раскрой()
		{
            return this.экзэмпл;
		}

        public ИтераторСекций секции()
		{
			return ЛЛДайСекции(this.раскрой());
		}

        public бул вКонцеСекцИтер_ли(ИтераторСекций si)
		{ 
			return ЛЛИтераторСекцииВКонце_ли(this.раскрой(), si.раскрой());
         }

        public СимвИтератор символы()
		{ 
			return new СимвИтератор(ЛЛДайСимволы(this.раскрой()));
		}
        public проц вКонцеСимИтер_ли(СимвИтератор si) 
		{ 
			return ЛЛОбъФайл_СимвИтераторВКонце_ли(this.раскрой(), si.раскрой());
         }
    }

