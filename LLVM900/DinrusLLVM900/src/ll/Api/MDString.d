module ll.api.MDString;

import ll.api.MetadataAsValue;
import ll.c.Types, ll.c.Core;
import ll.api.Metadata;
import ll.api.Value;
import ll.api.Context;
import ll.common;

    public class МДТкст : Метаданные
    {
        public static МетаданКакЗначение дайМДТкст(ткст str)
		{
			return new МетаданКакЗначение(ЛЛМДТкст(вТкст0(str), cast(бцел)str.length));
		}

        public static МетаданКакЗначение дайМДТкст(Контекст контекст, ткст str)
		{ 
			return new МетаданКакЗначение(ЛЛМДТкстВКонтексте(контекст.раскрой(), вТкст0(str), cast(бцел)str.length));
		}

        public static МетаданКакЗначение дайМДУзел(Значение[] vals)
		{ 
			return new МетаданКакЗначение(ЛЛМДУзел(vals.раскрой()));
		}
    }

