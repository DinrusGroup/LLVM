module ll.api.typs.Composite.SequentialTypes.PointerType;

import ll.api.Type;
import ll.api.typs.VoidType;
import ll.api.typs.LabelType;
import ll.api.typs.MetadataType;
import ll.api.typs.FunctionType;
import ll.api.typs.TokenType;
import ll.c.Types;
import ll.c.Core;
import ll.common;

    public class ТипУказатель : Тип
    {
        public this(Тип типЭлта)
		{
			this(типЭлта, cast(бцел) 0);
		}

        public this(Тип типЭлта, бцел адреснПрострво)
		{ 
			this(ЛЛТипУказатель(типЭлта.раскрой(), адреснПрострво));
		}
/+
        public static бул валиденТипЭлта_ли(Тип тип)
		{
			return ((typeof(тип) !is ll.api.typs.VoidType.ТипПроц) && (typeof(тип) !is ll.api.typs.LabelType.ТипЯрлык) && (typeof(тип) !is ТипМетаданные) && (typeof(тип) !is ТипСема));
		}
        public static бул загружаемИлиСохраняемТип_ли(Тип тип)
		{ 
			return (валиденТипЭлта_ли(тип) && (typeof(тип) !is ll.api.typs.FunctionType.ТипФункция));
		}
+/
        this(ЛЛТип типРеф)
		{
            super(типРеф);
        }

        public override ткст вТкст()
		{
			return фм("{} *", this.типЭлемента().вТкст());
		}

        public бцел адрПрострво ()
		{ 
			return ЛЛДАйАдрПрострУказателя(this.раскрой());
		}

        public Тип типЭлемента()
		{
			return new Тип(ЛЛДайТипЭлемента(this.раскрой()));
		}

        public override бул типСОднимЗначением_ли() {return true;}
    }