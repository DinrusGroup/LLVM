module ll.api.typs.Composite.SequentialTypes.ArrayType;

import ll.api.typs.Composite.SequentialType;
import ll.api.typs.IAggregateType;
import ll.api.Type;
import ll.api.typs.VoidType;
import ll.api.typs.LabelType;
import ll.api.typs.MetadataType;
import ll.api.typs.FunctionType;
import ll.api.typs.TokenType;
import ll.c.Core;
import ll.c.Types;
import ll.common;

//alias ll.api.typs.FloatType.ТипПлав ТипПлав;
//alias ll.api.typs.DoubleType.ТипДво ТипДво;
alias ll.api.typs.VoidType.ТипПроц ТипПроц;
//alias ll.api.typs.Composite.StructType.ТипСтрукт ТипСтрукт;
//alias ll.api.typs.Composite.SequentialTypes.PointerType.ТипУказатель ТипУказатель;
alias ll.api.typs.FunctionType.ТипФункция ТипФункция;
//alias ll.api.typs.Composite.SequentialTypes.ArrayType.ТипМассив ТипМассив;

    public class ТипМассив : ТипПоследовательность, ИТипАгрегат
    {
        public this(Тип типЭлта, бцел длина)
		{ 
			this(ЛЛТипМассив(типЭлта.раскрой(), длина));
		}
/+
        public static бул валиденТипЭлта_ли(Тип тип)
		{
		return	!(тип is ТипПроц) && !(тип is ТипЯрлык) && !(тип is ТипМетаданные) && !(тип is ТипФункция) && !(тип is ТипСема);
		}
+/
			this(ЛЛТип типРеф)
			{
            super(типРеф);
        }

        public override бцел длина()
		{ 
			return ЛЛДайДлинуМассива(this.раскрой());
		}
        public override ткст вТкст()
		{ 
			return фм("{}[{}]",типЭлемента.вТкст(), длина);
		}
        public override бул пуст_ли()
		{
			return (this.длина == 0 || this.типЭлемента.пуст_ли);
		}
    }

