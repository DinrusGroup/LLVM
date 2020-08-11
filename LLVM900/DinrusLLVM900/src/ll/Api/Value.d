module ll.api.Value;

import ll.c.Types;
import ll.c.Core;
import ll.api.Type;
import ll.api.vals.BasicBlock;
import ll.api.Context;
import ll.api.vals.consts.GlobalValues.GlobalObjects.Function;
import ll.api.vals.instructions.BinaryOperator;
import ll.api.vals.Instruction;
import ll.api.Use;
import ll.api.vals.Constant;
import ll.api.vals.Argument;
import ll.api.Metadata;
import ll.api.OperandList;

import ll.common;

alias Значение[] Значения;

    public class Значение
    {
        Значение создай()
        {
            if (this.экземпл == null)
            {
                return null;
            }
            
            if (ЛЛЗначение_БазБлок_ли(this.экземпл))
            {
                return new БазБлок(ЛЛЗначениеКакБазБлок(this.экземпл));
            }

            if (cast(бул) ЛЛФункция_ли(this.экземпл))
            {
                return new Функция(this.экземпл);
            }

            if (cast(бул) ЛЛБинарныйОператор_ли(this.экземпл))
            {
                auto оп = new БинОп(this.экземпл);
                return оп.создай();
            }

            if (cast(бул) ЛЛИнструкция_ли(this.экземпл))
            {
                auto оп = new Инструкция(this.экземпл);
                return оп.создай();
            }

            if (cast(бул) ЛЛКонстанта_ли(this.экземпл))
            {
                auto оп = new Константа(this.экземпл);
                return оп.создай();
            }

            if (cast(бул)  ЛЛАргумент_ли(this.экземпл))
            {
                return new Аргумент(this.экземпл);
            }

            if (cast(бул) ЛЛМДТкст_ли(this.экземпл))
            {
                return new МДТкст(this.экземпл);
            }

            throw new Искл("NotImplementedException()");
        }
        
        private ЛЛЗначение экземпл;

        this(ЛЛЗначение экземпл)
        {
            this.экземпл = экземпл;
            this.операнды = new СписокОперандов(this);
        }

        public ЛЛЗначение раскрой(){return this.экземпл;}

        public Тип тип(){ return new Тип(ЛЛТипУ(this.раскрой()));}

        public ткст имя()
        {
            return ll.common.вТкст(ЛЛДайИмяЗначения(this.раскрой()));
         }

        public проц имя(ткст знач)
		{
            ЛЛУстИмяЗначения(this.раскрой(), вТкст0(знач));
		}

        public Контекст контекст()
		{ 
			return this.тип().контекст();
		}
                
        public проц дамп()
		{ 
			ЛЛЗначениеДампа(this.раскрой());
		}
        
        public Использование[] использования()
        {
           // get
            
                Использование[] список;
                Использование исп;
                исп = new Использование(ЛЛДайПервоеИспользование(this.раскрой()));
                while(исп !is пусто)
                {
                    список ~= исп;
                    исп = исп.следщ;
                }
                return список;            
        }

        public проц замениВсеИспользованияНа(Значение v)
		{ 
			ЛЛЗамениВсеИспользованияНа(this.раскрой(), v.раскрой());
		}

        public Использование дайИспользованиеОперанда(бцел индекс) 
		{
			return new Использование(ЛЛДайИспользованиеОперанда(this.раскрой(), индекс));
		}

        public СписокОперандов операнды;// {return  get; } 

        public override ткст вТкст()
		{
			return ll.common.вТкст(cast(ткст0) this.раскрой());
		}

    }