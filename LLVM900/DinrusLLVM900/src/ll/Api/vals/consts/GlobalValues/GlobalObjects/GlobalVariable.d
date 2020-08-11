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
            return this.экземпл;
		}

        public Значение инициализатор()
        {
            return new Значение(ЛЛДайИнициализатор(this.раскрой()));

        }

        проц инициализатор(Значение значение)
		{
            ЛЛУстИнициализатор(this.раскрой(), значение.раскрой());
		}

        public бул извнеИниц_ли()
        {
            return ЛЛИзвнеИнициализуем_ли(this.раскрой());
         }

        public проц инициализоватьИзвне(бул данет)
		{
            ЛЛУстИзвнеИнициализуем(this.раскрой(), данет);
		}

        public ГлобПеременная следщ()
		{ 
			return new ГлобПеременная(ЛЛДайСледщГлоб(this.раскрой()));
		}

        public ГлобПеременная предш()
		{
			return new ГлобПеременная(ЛЛДайПредшГлоб(this.раскрой()));
		}

        public бул глобКонстанта_ли()
        {
            return ЛЛГлобКонст_ли(this.раскрой());
            //set { return ЛЛУстГлобКонст(this.раскрой(), значение);
        }

        public бул нителок_ли()
        {
            return ЛЛНителок_ли(this.раскрой());
           // set { return ЛЛУстНителок(this.раскрой(), значение);
        }

        public ЛЛНителокРежим нителокРежим()
        {
            return ЛЛДайНителокРежим(this.раскрой());
        }

        public проц нителокРежим(ЛЛНителокРежим режим)
		{
            ЛЛУстНителокРежим(this.раскрой(), режим);
		}

        public проц удали()
		{ 
			return ЛЛУдалиГлоб(this.раскрой());
		}
    }