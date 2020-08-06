module ll.api.vals.consts.ConstantAggregateZero;

import ll.c.Types;
import ll.api.vals.Constant;

    public  class КонстАгрегатНоль : Константа
    {
        private ЛЛЗначение экземпл;
        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экземпл = экземпл;
        
        }

        public override ЛЛЗначение раскрой(){return this.экземпл;}
    }
