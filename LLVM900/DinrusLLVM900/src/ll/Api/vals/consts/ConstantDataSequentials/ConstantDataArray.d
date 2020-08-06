module ll.api.vals.consts.ConstantDataSequentials.ConstantDataArray;

import ll.c.Core, ll.c.Types;
import ll.api.Value, ll.api.Context;
import ll.api.vals.Constant;
import ll.api.vals.consts.ConstantDataSequential;

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
				GetGeneric(тип, (x, y) { КонстантаПЗ.дай(x, y), данные);
            }
+/
        public this(Контекст контекст, байт[] данные)
		{
			this(контекст.типЦел8, данные);
		}
        public this(Контекст контекст, бкрат[] данные) 
		{
			this(контекст.типЦел16, данные);
		}

        public this(Контекст контекст, бцел[] данные) 
		{
			this(контекст.типЦел32, данные);
		}

        public this(Контекст контекст, бдол[] данные)
		{ 
			this(контекст.типЦел64, данные);
		}

        public this(Контекст контекст, плав[] данные) 
		{ 
			this(контекст.типПлав, данные);
		}

        public this(Контекст контекст, дво[] данные)
		{
			this(контекст.типДво, данные);
		}

        public static Константа дайТкст(Контекст контекст, ткст текст, бул nullTerminate)
		{ 
			return new Константа(ЛЛКонстТкстВКонтексте(контекст.раскрой(), текст, cast(бцел)текст.length, nullTerminate));
		}

        public static Константа дайТкст(Контекст контекст, ткст текст)
		{
			дайТкст(контекст, текст, true);
		}

        public static Константа дайТкст(ткст ткт, бул nullTerminate)
		{
			return new Константа(ЛЛКонстТкст(ткт, cast(бцел)ткт.length, !nullTerminate));
		}
        public static Константа дайТкст(ткст ткт)
		{
			дайТкст(ткт, true);
		}
                   
        this(ЛЛЗначение v){super(v);}
    }