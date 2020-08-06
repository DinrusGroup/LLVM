module ll.api.typs.Composite.SequentialTypes.VectorType;

import ll.api.typs.Composite.SequentialType;
import ll.api.Type;
import ll.api.typs.IntegerType;
import ll.api.typs.FPType;
import ll.api.typs.Composite.SequentialTypes.PointerType;
import ll.c.Core;
import ll.c.Types;

    public  class ТипВектор : SequentialType
    {
        public static ТипВектор дай(Тип типЭлта, бцел члоЭлтов)
		{ 
			return cast(ТипВектор) ЛЛТипВектор(типЭлта.раскрой(), члоЭлтов);
		}

        public static ТипВектор дайЦелое(ТипВектор типВектор)
        {
            if (типВектор.длина == 0)
            {
                //throw new ArgumentException("Element count cannot be zero.", nameof(типВектор));
            }
          //  return GetSubstituteVectorType(типВектор, s { s, n { n);
        }

        public static ТипВектор GetExtendedElementVectorType(ТипВектор типВектор)
	    {
		// return GetSubstituteVectorType(типВектор, s { s * 2, n { n);
		}

        public static ТипВектор GetTruncatedElementVectorType(ТипВектор типВектор)
        {
            if ((типВектор.типЭлемента.примитивнРазмерВБитах & 1) == 0)
            {
               // throw new ArgumentException("Element size in bits cannot be odd.", nameof(типВектор));
            }
           // return GetSubstituteVectorType(типВектор, s { s / 2, n { n);
        }

        public static ТипВектор GetHalfElementsVectorType(ТипВектор типВектор)
        {
            if ((типВектор.длина & 1) == 0)
            {
               // throw new ArgumentException("Element count cannot be odd.", nameof(типВектор));
            }
           // return GetSubstituteVectorType(типВектор, s { s, n { n / 2);
        }

        public static ТипВектор GetDoubleElementsVectorType(ТипВектор типВектор)
		{
			//return GetSubstituteVectorType(типВектор, s { s, n { n * 2);
	    }
/*
        private static ТипВектор GetSubstituteVectorType(ТипВектор типВектор,Func!(бцел, бцел) elementSizeSelector, Func!(бцел, бцел) elementCountSelector)
        {
            auto originalSize = типВектор.типЭлемента.примитивнРазмерВБитах;
            auto substituteSize = elementSizeSelector(originalSize);
            auto типЦелое = типВектор.контекст.типЦел(substituteSize);
            return дай(типЦелое, типВектор.длина);
        }
*/
        public static bool валиденТипЭлта_ли(Тип тип)
		{
			return(тип is ТипЦелое || тип is ТипПЗ || тип is ТипУказатель);
		}

		this(ЛЛТип типРеф)
		{
            super(типРеф);
        }

        public uint битШирина()
		{
			return (this.длина * this.типЭлемента.примитивнРазмерВБитах);
		}

        public override бул типСОднимЗначением_ли() {return true;}

        public override Тип типСкаляр() {return this.типЭлемента;}

        public override бцел длина() {return ЛЛДайРазмерВектора(this.раскрой());}
    }

