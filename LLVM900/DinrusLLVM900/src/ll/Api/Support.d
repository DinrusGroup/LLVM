module ll.api.Support;

import ll.c.Support;
import ll.common;

    public static class Support
    {
        public static bool LoadLibraryPermanently(ткст имяф)
		{ 
			return ЛЛГрузиБибПерманентно(вТкст0(имяф));
		}
        public static void ParseCommandLineOptions(int argc, ткст[] argv, ткст обзор)
		{ 
			ткст арги;
			foreach(арг; argv)
			{
                арги ~= арг;
			}
			ткст0 резарг = вТкст0(арги);
			ЛЛРазбериОпцКомСтроки(argc, &резарг, вТкст0(обзор));
		}
    }

