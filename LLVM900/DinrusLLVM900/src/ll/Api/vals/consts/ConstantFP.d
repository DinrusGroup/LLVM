module ll.api.vals.consts.ConstantFP;

    import ll.api.Type;
	import ll.c.Types, ll.c.Core;
	import ll.api.vals.Constant;
	import ll.api.typs.FPType;
	import ll.common;

    public class КонстПЗ : Константа
    {
        public this(ТипПЗ тип, дво значение)
		{
			this(ЛЛКонстРеал(тип.раскрой(), значение));
		}
		
        public this(Тип тип, ткст текст)
		{
			this(ЛЛКонстРеалИзТкста(тип.раскрой(), вТкст0(текст)));
		}

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);        
        }
/+
        public Кортеж!(дво, бул) значДво()
		{
		ЛЛБул li;
		return new Кортеж!(дво, бул)(ЛЛКонстРеалДайДво(this.раскрой(), &li), cast(бул) li);
		}
		+/
    }
