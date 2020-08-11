module ll.api.ObjectFile;

import ll.api.SymbolIterator;
import ll.api.SectionIterator;
import ll.c.Types, ll.c.Core, ll.c.Object;
import ll.api.MemoryBuffer;

    public class ОбъФайл
    {
		private ЛЛФайлОбъекта экземпл;
		
        public this(БуфПам буфПам)
        {
            this(ЛЛСоздайФайлОбъекта(буфПам.раскрой()));
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
            return this.экземпл;
		}

        public ИтераторСекций секции()
		{
			return new ИтераторСекций(ЛЛДайСекции(this.раскрой()));
		}

        public бул вКонцеСекцИтер_ли(ИтераторСекций si)
		{ 
			return ЛЛИтераторСекцииВКонце_ли(this.раскрой(), si.раскрой());
         }

        public СимвИтератор символы()
		{ 
			return new СимвИтератор(ЛЛДайСимволы(this.раскрой()));
		}
        public бул вКонцеСимИтер_ли(СимвИтератор si) 
		{ 
			return ЛЛОбъФайл_СимвИтераторВКонце_ли(cast(ЛЛБинарник) this.раскрой(), si.раскрой());
         }
    }

