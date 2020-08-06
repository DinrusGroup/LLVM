module ll.api.typs.Composite.StructType;

import ll.api.typs.Composite.CompositeType;
import ll.api.typs.IAggregateType;
import ll.api.typs.VoidType;
import ll.api.typs.LabelType;
import ll.api.typs.MetadataType;
import ll.api.typs.FunctionType;
import ll.api.typs.TokenType;
import ll.api.Type;
import ll.api.Context;
import ll.c.Types;
import ll.c.Core;


    public class ТипСтрукт : ТипКомпозит, ИТипАгрегат
    {
        public static ТипСтрукт создай(Контекст контекст, ткст имя)
		{
			return ЛЛСтруктСоздайСИменем(контекст.раскрой(), имя);
		}

        public static ТипСтрукт создай(Контекст контекст) 
		{
			return ЛЛТипСтруктВКонтексте(контекст.раскрой(), new ЛЛТип[0], false);
		}

        public static ТипСтрукт создай(Тип[] типыЭлтов, ткст имя, бул упакован)
        {
            auto t = ЛЛСтруктСоздайСИменем(Контекст.Global.раскрой(), имя);
            t.SetBody(типыЭлтов, упакован);
            return t;
        }

        public static ТипСтрукт создай(Тип[] типыЭлтов, ткст имя)
		{
			создай(типыЭлтов, имя, false);
		}

        public static ТипСтрукт создай(Тип[] типыЭлтов, бул упакован) 
		{
			return ЛЛТипСтрукт(типыЭлтов.раскрой(), упакован);
		}

        public static ТипСтрукт создай(Контекст контекст, Тип[] типыЭлтов, ткст имя, бул упакован)
        {
            auto t = создай(контекст, имя);
            t.SetBody(типыЭлтов, упакован);
            return t;
        }

        public static ТипСтрукт дай(Контекст контекст, Тип[] типыЭлтов, бул упакован)
		{ 
			throw new NotImplementedException();
		}

        public static ТипСтрукт дай(Контекст контекст)
		{
			return ЛЛТипСтруктВКонтексте(контекст.раскрой(), new ЛЛТип[0], false);
		}

        public static ТипСтрукт дай(Тип[] типыЭлтов) 
		{
			return создай(типыЭлтов, false);
		}

        public static ТипСтрукт дай(ткст имя, Тип[] типыЭлтов)
		{ 
			return создай(типыЭлтов, имя);
		}

        public static бул валиденТипЭлта_ли(Тип тип)
        {
            return !(тип is ТипПроц) && !(тип is ТипЯрлык) &&
                   !(тип is ТипМетаданные) && !(тип is ТипФункц) &&
                   !(тип is TokenТип);
        }

		private ЛЛТип экзэмпл;

        this(ЛЛТип экзэмпл)
		{
            super(экзэмпл);
			this.экзэмпл = экзэмпл;
			
        }

        public override ЛЛТип раскрой()
		{
            return this.экзэмпл;
		}

        public uint длина()
		{
			return ЛЛПосчитайТипыЭлементовСтрукт(this.раскрой());
		}

        public Тип дайТипЭлта(uint индекс)
		{
			return ЛЛДайТипыЭлементовСтрукт(this.раскрой())[индекс];
		}

        public IReadOnlyList!(Тип) ElementТипs()
		{
			ЛЛДайТипыЭлементовСтрукт(this.раскрой()).Wrap!(LLVMТипRef, Тип)();
		}

        public бул естьИмя()
		{
			return ткст.IsNullOrEmpty(this.имя);
		}

        public override ткст имя()
		{
			return ЛЛДайИмяСтрукт(this.раскрой());
		}

        public бул упакован_ли()
        {
            return ЛЛУпакованнаяСтруктура_ли(this.раскрой());
          //  set { this.SetBody((Тип[])this.ElementТипs, значение);
        }

        public бул опак_ли()
		{
			return ЛЛОпакСтрукт_ли(this.раскрой());
		}

        public бул литерал_ли()
		{
			throw new NotImplementedException();
		}

        public void устТело(Тип[] типыЭлтов)
		{
			this.SetBody(типыЭлтов, false);
		}

        public void устТело(Тип[] типыЭлтов, бул упакован)
		{ 
			ЛЛСтруктУстТело(this.раскрой(), типыЭлтов.раскрой(), new LLVMBool(упакован));
		}

        public бул IsLayoutIdentical(ТипСтрукт other)
		{ 
			throw new NotImplementedException();
		}

        public override ткст вТкст() 
		{ 
			return $"{ткст.Join(", ", типыЭлтов)}";
		}

        public override бул валиденИндекс_ли(uint индекс) 
		{
			return индекс < this.длина;
		}

        public override Тип дайТипПоИндексу(uint индекс)
		{
		 return	ЛЛДайТипыЭлементовСтрукт(this.раскрой())[индекс];
		}

        public override бул пуст_ли ()
			
		{
			//this.типыЭлтов.Any(x) { !x.пуст_ли();)
	    }
/+
        public IEnumerator!(Тип) GetEnumerator()
		{ 
			this.типыЭлтов.GetEnumerator();
		}

        IEnumerator IEnumerable.GetEnumerator() 
		{ 
			this.GetEnumerator();
		}

		+/
    }

