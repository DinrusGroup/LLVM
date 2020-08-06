module ll.api.vals.consts.GlobalValues.GlobalObjects.GlobalVariable;

import ll.c.Types;
import ll.api.vals.consts.GlobalValues.GlobalObject;
import ll.api.Value;
import ll.c.Core;

    public class ГлобПеременная : ГлобОбъект
    {
        private ЛЛЗначение экземпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экземпл = экземпл;
         }

        public override ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}

        public Значение инициализатор()
        {
            return new Значение(ЛЛДайИнициализатор(this.раскрой()));
           // set { ЛЛУстИнициализатор(this.раскрой(), значение.раскрой());
        }

        public бул извнеИниц_ли()
        {
            return ЛЛИзвнеИнициализуем_ли(this.раскрой());
            //set { return ЛЛУстИзвнеИнициализуем(this.раскрой(), значение);
        }

        public ГлобПеременная следщ()
		{ 
			return ЛЛДайСледщГлоб(this.раскрой()).WrapAs!(GlobalVariable)();
		}

        public ГлобПеременная предш()
		{
			return ЛЛДайПредшГлоб(this.раскрой()).WrapAs!(GlobalVariable)();
		}

        public бул глобКонстанта_ли()
        {
            return return ЛЛГлобКонст_ли(this.раскрой());
            //set { return ЛЛУстГлобКонст(this.раскрой(), значение);
        }

        public бул нителок_ли()
        {
            return return ЛЛНителок_ли(this.раскрой());
           // set { return ЛЛУстНителок(this.раскрой(), значение);
        }

        public ThreadLocalMode нителокРежим()
        {
            return return ЛЛДайНителокРежим(this.раскрой()).Wrap();
           // set { return ЛЛУстНителокРежим(this.раскрой(), значение.раскрой());
        }

        public проц удали()
		{ 
			return ЛЛУдалиГлоб(this.раскрой());
		}
    }
}