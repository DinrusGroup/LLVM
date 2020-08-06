module ll.api.typs.FunctionType;

import ll.api.Type;
import ll.c.Types;
import ll.c.Core;
import ll.common;

    public class ТипФункция : Тип
    {
        public this(Тип типВозврат)
		{
			this(типВозврат, false);
		}

        public this(Тип типВозврат, бул варАрг_ли)
		{
			this(типВозврат, new Тип[0], варАрг_ли);
		}

        public this(Тип типВозврат, Тип[] типыПарамов)
		{
			this(типВозврат, типыПарамов, false);
		}

        public this(Тип типВозврат, Тип[] типыПарамов, бул варАрг_ли)
		{ 
			this(ЛЛТипФункция(типВозврат.раскрой(), типыПарамов.раскрой(), варАрг_ли ? 1 : 0));
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

        public override ткст имя()
		{
			//needs formating!
			return фм("{} ({string.Join!(Тип)(", ", типыПарам)})", типВозврата );
		}

        public override бул типПервКласса_ли()
		{
			return false;
		}

        public Тип типВозврата()
		{
			return new Тип(ЛЛДайТипВозврата(this.раскрой()));
		}

        public бцел члоПарамов()
		{
			return ЛЛСчётТиповПарам(this.раскрой());
		}

        public Тип дайТипПарама(бцел индекс)
		{
			return new Тип(ЛЛДайТипыПарам(this.раскрой())[индекс]);
		}

        public Тип[] типыПарам()
		{
			Тип[] рез;
			ЛЛДайТипыПарам(this.раскрой(), cast(ЛЛТип*) &рез);
			return рез;
		}

        public бул варАрг_ли ()
		{
			return ЛЛВараргФункц_ли(this.раскрой());
		}
    }
