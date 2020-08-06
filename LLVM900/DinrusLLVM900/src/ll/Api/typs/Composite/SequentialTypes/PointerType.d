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
        public static ТипУказатель дайНеквал(Тип типЭлта)
		{
			return дай(типЭлта, cast(бцел) 0);
		}

        public static ТипУказатель дай(Тип типЭлта, бцел адреснПрострво)
		{ 
			return new ТипУказатель(ЛЛТипУказатель(типЭлта.раскрой(), адреснПрострво));
		}

        public static бул валиденТипЭлта_ли(Тип тип)
		{
			return (!(тип is ТипПроц) && !(тип is ТипЯрлык) && !(тип is ТипМетаданные) && !(тип is ТипСема));
		}
        public static бул загружаемИлиСохраняемТип_ли(Тип тип)
		{ 
			return (валиденТипЭлта_ли(тип) && !(тип is ТипФункция));
		}

        this(ЛЛТип типРеф)
		{
            super(типРеф);
        }

        public override ткст имя()
		{
			return фм("{} *", this.типЭлемента.имя);
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