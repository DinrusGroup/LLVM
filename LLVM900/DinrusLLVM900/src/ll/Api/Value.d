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
import ll.api.MDStringAsValue;
import ll.api.OperandList;

import ll.common;

    public abstract class Значение
    {
        static Значение создай()
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
                return new БинОп(this.экземпл).создай();
            }

            if (cast(бул) ЛЛИнструкция_ли(this.экземпл))
            {
                return new Инструкция(this.экземпл).создай();
            }

            if (cast(бул) ЛЛКонстанта_ли(this.экземпл))
            {
                return Константа(this.экземпл).создай();
            }

            if (cast(бул)  ЛЛАргумент_ли(this.экземпл))
            {
                return new Аргумент(this.экземпл);
            }

            if (cast(бул) ЛЛМДТкст_ли(this.экземпл))
            {
                return new МДТекстКакЗначение(this.экземпл);
            }

            throw new NotImplementedException();
        }
        
        private ЛЛЗначение экземпл;

        this(ЛЛЗначение экземпл)
        {
            this.экземпл = экземпл;
            this.операнды = new СписокОперандов(this);
        }

        public Тип тип(){ return new Тип(ЛЛТипУ(this.раскрой()));}

        public ткст имя()
        {
            return вТкст(ЛЛДайИмяЗначения(this.раскрой()));
         }

        public проц имя(ткст знач)
		{
            ЛЛУстИмяЗначения(this.раскрой(), вТкст0(знач));
		}

        public Контекст контекст()
		{ 
			return this.тип.Context;
		}
                
        public проц дамп()
		{ 
			ЛЛЗначениеДампа(this.раскрой());
		}
        
        public Использование[] использования()
        {
           // get
            
                Использование[] список;
                auto исп = new Использование(ЛЛДайПервоеИспользование(this.раскрой()));
                while(исп != null)
                {
                    список += исп;
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
			return вТкст(cast(ткст0) this.раскрой());
		}
/+
        public override int GetHashCode()
		{
			return this.экземпл.GetHashCode();
		}

        public override bool Equals(object obj)
		{
			return this.Equals(obj as Значение);
		}

        public bool Equals(Значение other) 
		{ 
			return ReferenceEquals(other, null) ? false : this.экземпл == other.экземпл;
		}

        public static bool operator ==(Значение op1, Значение op2) 
		{
			return ReferenceEquals(op1, null) ? ReferenceEquals(op2, null) : op1.Equals(op2);
		}

        public static bool operator !=(Значение op1, Значение op2) {return !(op1 == op2);}
+/
    }