module ll.api.MetadataAsValue;

import ll.common;
import ll.c.Types, ll.c.Core;
import ll.api.Value;

    public abstract class МетаданКакЗначение : Значение
    {
        бцел длина;
        ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл) 
		{
            super(экзэмпл);        
        }

        public ЛЛЗначение раскрой()
		{
            return this.экземпл;
		}

        public ткст текстМД()
		{
            бцел длин;
			return вТкст(ЛЛДайМДТкст(this.раскрой(), &длина));

		}
    }

