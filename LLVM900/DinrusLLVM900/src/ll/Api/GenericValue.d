module ll.api.GenericValue;

import ll.c.ExecutionEngine;
import ll.api.typs.IntegerType;
import ll.api.typs.FPType;
import ll.api.Type;

    public  class ГенерноеЗначение
    {
       private  ЛЛГенерноеЗначение экземпл;

        this(ТипЦелое t, бдол n, бул соЗнаком)
		{
			 this.экземпл = ЛЛСоздайГенЗначЦел(t.раскрой(), n, соЗнаком);
		}

        this(ТипЦелое t, бдол n)
		 {
			this(t, n, нет);
		 }

        this(ТипПЗ ty, дво n)
		{
		   this.экземпл = ЛЛСоздайГенЗначПлав(ty.раскрой(), n);
		}

        public this(ук p)
		{
			this.экземпл = ЛЛСоздайГенЗначУк(p);
		}

		this(ЛЛГенерноеЗначение экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

		public ЛЛГенерноеЗначение раскрой()
		{
			return this.экземпл;
		}

        ~this()
        {
            ЛЛВыместиГенЗнач(this.раскрой());
        }

        public бцел целШирина()
			{ 
				return ЛЛШиринаГенЗначЦел(this.раскрой());
			}

        public бдол вЦел(бул соЗнаком)
		 { 
			return ЛЛГенЗначВЦел(this.раскрой(), соЗнаком);
		 }

        public ук вУк()
		{
			return ЛЛГенЗначВУк(this.раскрой());
		}

        public дво вПлав(Тип ty)
		{ 
			return ЛЛГенЗначВПлав(ty.раскрой(), this.раскрой());
		}

    }

