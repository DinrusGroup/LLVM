module ll.api.typs.Composite.SequentialTypes.VectorType;

import ll.api.typs.Composite.SequentialType;
import ll.api.Type;
import ll.api.typs.IntegerType;
import ll.api.typs.FPType;
import ll.api.typs.Composite.SequentialTypes.PointerType;
import ll.c.Core;
import ll.c.Types;

alias ll.api.typs.Composite.SequentialTypes.PointerType.ТипУказатель ТипУказатель;

import exception: АргИскл;


    public  class ТипВектор : ТипПоследовательность
    {
        public this(Тип типЭлта, бцел члоЭлтов)
		{ 
			this(ЛЛТипВектор(типЭлта.раскрой(), члоЭлтов));
		}

        /+

        public static ТипВектор дайЦелое(ТипВектор типВектор)
        {
            if (типВектор.длина == 0)
            {
                throw new АргИскл("Ч-ло эл-тов не м.б. нулём.", типВектор.вТкст());
            }
            return GetSubstituteVectorType(типВектор, s { s, n { n);
        }

        public static ТипВектор GetExtendedElementVectorType(ТипВектор типВектор)
	    {
		 return GetSubstituteVectorType(типВектор, s { s * 2, n { n);
		}

        public static ТипВектор GetTruncatedElementVectorType(ТипВектор типВектор)
        {
            if ((типВектор.типЭлемента.примитивнРазмерВБитах & 1) == 0)
            {
                throw new АргИскл("Разм эл-та в битах не м.б. нечётным.", типВектор.вТкст());
            }
            return GetSubstituteVectorType(типВектор, s { s / 2, n { n);
        }

        public static ТипВектор GetHalfElementsVectorType(ТипВектор типВектор)
        {
            if ((типВектор.длина & 1) == 0)
            {
                throw new АргИскл("Ч-ло эл-тов не м. б. нечётным.", типВектор.вТкст());
            }
            return GetSubstituteVectorType(типВектор, s { s, n { n / 2);
        }

        public static ТипВектор GetDoubleElementsVectorType(ТипВектор типВектор)
		{
			return GetSubstituteVectorType(типВектор, s { s, n { n * 2);
	    }

        private static ТипВектор GetSubstituteVectorType(ТипВектор типВектор,проц delegate(бцел, бцел) elementSizeSelector, проц delegate(бцел, бцел) elementCountSelector)
        {
            auto originalSize = типВектор.типЭлемента.примитивнРазмерВБитах;
            auto substituteSize = elementSizeSelector(originalSize);
            auto типЦелое = типВектор.контекст.типЦел(substituteSize);
            super(типЦелое, типВектор.длина);
        }


        public static бул валиденТипЭлта_ли(Тип тип)
		{
			return(тип is ТипЦелое || тип is ТипПЗ || тип is ТипУказатель);
		}
   +/
		this(ЛЛТип типРеф)
		{
            super(типРеф);
        }

        public бцел битШирина()
		{
			return (this.длина * this.типЭлемента.примитивнРазмерВБитах);
		}

        public override бул типСОднимЗначением_ли() {return true;}

        public override Тип типСкаляр() {return this.типЭлемента;}

        public override бцел длина() {return ЛЛДайРазмерВектора(this.раскрой());}
    }

