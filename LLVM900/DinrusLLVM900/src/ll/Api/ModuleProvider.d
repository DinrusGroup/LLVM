module ll.api.ModuleProvider;

import ll.c.Core, ll.c.Types;

    public  class МодульПровайдер
    {
        private ЛЛМодульПровайдер экземпл;

        this(ЛЛМодульПровайдер экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        ~this()
        {
           ЛЛВыместиМодульПровайдер(this.экземпл);
        }

        public ЛЛМодульПровайдер раскрой()
		{
            return this.экземпл;
		}
    }