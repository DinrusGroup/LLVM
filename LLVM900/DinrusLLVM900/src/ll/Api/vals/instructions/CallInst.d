module ll.api.vals.instructions.CallInst;

import ll.api.vals.Instruction;
import ll.c.Types;
import ll.c.Core;

    public class ВызовИнстр : Инструкция
    {
        private ЛЛЗначение экземпл;
        this(ЛЛЗначение экзэмпл)
		{
			super(экзэмпл);
            this.экземпл = экземпл;
		}

        public ЛЛЗначение раскрой(){return this.экземпл;}

        public бул тейлВызов()
        {
   
            return ЛЛТейлВызов_ли(this.раскрой());
        }

        public проц устТейлВызов(бул знач)
		{
            ЛЛУстТейлВызов(this.раскрой(), cast(ЛЛБул) значение);
		}

        public ЛЛКонвВызова конвенцияВызова()
        {
            return cast(ЛЛКонвВызова)ЛЛДайКонвВызИнстр(this.раскрой()); 
        }

        public проц устКонвенциюВызова(ЛЛКонвВызова значение)
		{
            ЛЛУстКонвВызИнстр(this.раскрой(), значение);
		}
    }
