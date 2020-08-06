module ll.api.typs.MetadataType;

import ll.api.Type;
import ll.c.Types;

    public  class ТипМетаданные : Тип
    {
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
    }

