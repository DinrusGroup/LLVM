module ll.api.vals.consts.ConstantDataSequential;

import ll.c.Types;
import ll.c.Core;
import ll.api.vals.Constant;
import ll.api.Value;
import ll.common;

    public class КонстПоследовательностьДанных : Константа
    {
       this(ЛЛЗначение v){super(v);}

        public бул ткст_ли()
		{ 
			return ЛЛКонстТкст_ли(this.раскрой());
		}

        public ткст дайКакТкст()
		{ 
			т_мера длина;

			if(this.ткст_ли())
				return ll.common.вТкст(ЛЛДайКакТкст(this.раскрой(), &длина));// : throw new InvalidOperationException();
		}

        public Значение дайЭлтКакКонст(бцел инд)
		{ 
			return new Значение(ЛЛДайЭлтКакКонст(this.раскрой(), инд));
		}
    }
