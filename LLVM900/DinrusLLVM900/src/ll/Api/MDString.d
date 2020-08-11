module ll.api.MDString;

//import ll.api.MetadataAsValue;
import ll.c.Types, ll.c.Core;
import ll.api.Metadata;
import ll.api.Value;
import ll.api.Context;
import ll.common;

alias ll.api.Value.Значение МДУзел;

public static МДУзел дайМДУзел(Значение[] значения)
{ 
	ЛЛЗначение[] знач;
	foreach(зн; значения)
	{
		знач ~= зн.раскрой();
	}
	return new МДУзел(ЛЛМДУзел(&знач, знач.length));
}

    public class МДТкст : Метаданные
    {
		private ЛЛЗначение экземпл;

		private this(ЛЛЗначение зн)
		{
			this.экземпл = зн;
		}

		public ЛЛЗначение раскрой()
		{
			return this.экземпл;
		}

        public this(ткст т)
		{
			this(ЛЛМДТкст(вТкст0(т), т.length));
		}

        public this(Контекст контекст, ткст str)
		{ 
			this(ЛЛМДТкстВКонтексте(контекст.раскрой(), вТкст0(str), cast(бцел)str.length));
		}

		public ткст текстМД()
		{
            бцел длин;
			return вТкст(ЛЛДайМДТкст(this.раскрой(), &длина));

		}
		
	}

