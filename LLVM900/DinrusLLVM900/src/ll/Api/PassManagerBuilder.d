module ll.api.PassManagerBuilder;

import ll.c.Core, ll.c.Types, ll.c.PassManagerBuilder;
import ll.api.PassManager;

//Построитель менеджеров проходок
    public class ПМП 
    {
        public this()
		{
			this(ЛЛПМП_Создай());
		}

        private ЛЛПостроительМенеджеровПроходок экземпл;

        this(ЛЛПостроительМенеджеровПроходок экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        ~this()
        {
            ЛЛПМП_Вымести(this.раскрой());
        }

		public ЛЛПостроительМенеджеровПроходок раскрой()
		{
			return this.экземпл;
		}

        public проц устУровеньОпц(бцел optLevel)
		{
			ЛЛПМП_УстановиУровеньОпц(this.раскрой(), optLevel);
		}

        public проц устУровеньРазм(бцел sizeLevel)
		{
			ЛЛПМП_УстановиУровеньРазм(this.раскрой(), sizeLevel);
		}

        public проц устОтклЮнит(бул значение)
		{ 
			ЛЛПМП_УстановиОтклЮнитВНВремя(this.раскрой(), значение);
		}

        public проц устОтклРазмот(бул значение) 
		{
			ЛЛПМП_УстОтклРазмоткуЦиклов(this.раскрой(), значение);
		}

        public проц устОтклУпрощВызБиб(бул значение)
		{
			ЛЛПМП_УстОтклУпроститьВызовБиб(this.раскрой(), значение);
		}

        public проц испИнлайнер(бцел порог)
		{
			ЛЛПМП_ИспользуйИнлайнерСПорогом(this.раскрой(), порог);
		}

        public проц наполниМПФ(МенеджерПроходок pm)
		{
			ЛЛПМП_НаполниМенеджерПроходокФункций(this.раскрой(), pm.раскрой());
		}

        public проц наполниМПМ(МенеджерПроходок pm) 
		{
			ЛЛПМП_НаполниМенеджерПроходокМодулей(this.раскрой(), pm.раскрой());
		}

        public проц наполниМПОВК(МенеджерПроходок pm, бул internalize, бул runInliner) 
		{ 
			ЛЛПМП_НаполниМенеджерПроходокОВК(this.раскрой(), pm.раскрой(), internalize, runInliner);
		}
    }