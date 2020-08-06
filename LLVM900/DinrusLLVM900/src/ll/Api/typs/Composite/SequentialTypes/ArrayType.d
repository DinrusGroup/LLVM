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

    public class ТипМассив : SequentialType, IAggregateType
    {
        public static ТипМассив дай(Тип типЭлта, бцел длина)
		{ 
			new ТипМассив(ЛЛТипМассив(типЭлта.раскрой(), длина));
		}

        public static бул валиденТипЭлта_ли(Тип тип)
		{
			!(тип is VoidType) && !(тип is LabelType) && !(тип is MetadataType) && !(тип is FunctionType) && !(тип is TokenType);
		}

			this(ЛЛТип типРеф)
			{
            super(типРеф);
        }

        public override бцел длина()
		{ 
			return ЛЛДайДлинуМассива(this.раскрой());
		}
        public override ткст имя()
		{ 
			return фм("{}[{}]",типЭлемента.имя, длина);
		}
        public override бул пуст_ли()
		{
			return (this.длина == 0 || this.типЭлемента.пуст_ли);
		}
    }

