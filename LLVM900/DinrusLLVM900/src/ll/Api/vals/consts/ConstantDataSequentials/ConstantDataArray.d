module ll.api.vals.consts.ConstantDataSequentials.ConstantDataArray;

import ll.c.Core, ll.c.Types;
import ll.api.Value, ll.api.Context;
import ll.api.vals.Constant;
import ll.api.vals.consts.ConstantDataSequential;
import ll.common;

    public  class КонстМассивДанных : КонстПоследовательностьДанных
    {
		/+
        private static Константа GetGeneric!(TType, TData)(TType тип, Func!(TType, бдол, Константа) селектор, TData[] данные)
           // where TType : Тип
        {
            auto константы = new Константа[данные.length];
            for(auto i = 0; i < данные.length; i++)
            {
                auto extended = Convert.ToUInt64(данные[i]);
                константы[i] = селектор(тип, extended);
            }
            return new Константа(ЛЛКонстМассив(тип.раскрой(), константы.раскрой()));
        }

        private static Константа дай!(TData)(ТипЦелое тип, TData[] данные)
		{
			GetGeneric(тип, (x, y) { new КонстЦел(x, y), данные);
         }

        private static Константа дайПЗ!(TData)(ТипПЗ тип, TData[] данные)
			{
				GetGeneric(тип, (x, y) { new КонстантаПЗ(x, y), данные);
            }

        public this(Контекст контекст, байт[] данные)
		{
			this(контекст.типЦел8.раскрой(), данные);
		}
        public this(Контекст контекст, бкрат[] данные) 
		{
			this(контекст.типЦел16.раскрой(), данные);
		}

        public this(Контекст контекст, бцел[] данные) 
		{
			this(контекст.типЦел32.раскрой(), данные);
		}

        public this(Контекст контекст, бдол[] данные)
		{ 
			this(контекст.типЦел64.раскрой(), данные);
		}

        public this(Контекст контекст, плав[] данные) 
		{ 
			this(контекст.типПлав.раскрой(), данные);
		}

        public this(Контекст контекст, дво[] данные)
		{
			this(контекст.типДво.раскрой(), данные);
		}
+/
        public static Константа дайТкст(Контекст контекст, ткст текст, бул nullTerminate = нет)
		{ 
			return new Константа(ЛЛКонстТкстВКонтексте(контекст.раскрой(), вТкст0(текст), cast(бцел)текст.length, nullTerminate));
		}

        public static Константа дайТкст(ткст ткт, бул nullTerminate = нет)
		{
			return new Константа(ЛЛКонстТкст(вТкст0(ткт), cast(бцел)ткт.length, nullTerminate));
		}
                   
        this(ЛЛЗначение v){super(v);}
    }