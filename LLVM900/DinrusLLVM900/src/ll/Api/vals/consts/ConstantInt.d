module ll.api.vals.consts.ConstantInt;

    import ll.api.typs.IntegerType;
    import ll.api.vals.Constant;
	import ll.c.Types, ll.c.Core;

    public class КонстЦел : Константа
    {
        public this(ТипЦелое тип, бдол значение)
		{ 
			this(тип, значение, false);
		}

        public this(ТипЦелое тип, бдол значение, бул signExtend)
		{ 
			this(ЛЛКонстЦел(тип.раскрой(), значение, signExtend));
		}

        public this(ТипЦелое тип, бдол[] слова)
		{
			this(ЛЛКонстЦелПроизвольнойТочности(тип.раскрой(), cast(бцел) слова.length, слова));
		}

        public this(ТипЦелое тип, ткст ткт, байт корень)
		{ 
			this(ЛЛКонстЦелИзТкста(тип.раскрой(), ткт, корень)));
		}

			this(ЛЛЗначение экзэмпл){ super(экзэмпл);}

        public бдол нРасшЗнач()
		{ 
			return ЛЛКонстЦелДайНРасшЗначение(this.раскрой());
		}

        public дол зРасшЗнач() 
		{ 
			return ЛЛКонстЦелДайЗРасшЗначение(this.раскрой());
		}
    }