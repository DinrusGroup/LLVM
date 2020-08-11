module ll.api.Module;

import ll.common, ll.c.Core, ll.c.Types, ll.c.Linker;
import ll.api.Context, ll.api.Type, ll.api.Value;
import ll.api.vals.consts.GlobalValues.GlobalObjects.GlobalVariable;
import ll.api.vals.consts.GlobalValues.GlobalObjects.Function;
import ll.api.vals.consts.GlobalValue;
import ll.api.MemoryBuffer;
import ll.api.PassManager, ll.api.ModuleProvider;
import ll.c.BitWriter;

    public class Модуль 
    {
        private ЛЛМодуль экземпл;
		
        public this(ткст идМодуля)
		{
			this(ЛЛМодуль_СоздайСИменем(вТкст0(идМодуля)));
        }

        public this(ткст идМодуля, Контекст контекст)
		{ 
			this(ЛЛМодуль_СоздайСИменемВКонтексте(вТкст0(идМодуля), контекст.раскрой()));
        }

        public static проц линкуйМодули(Модуль куда, Модуль исток)
		{ 
			ЛЛКомпонуйМодули2(куда.раскрой(), исток.раскрой());
		}

		public ЛЛМодуль раскрой()
		{
			return this.экземпл;
		}

        this(ЛЛМодуль m) 
		{ 
			this.экземпл = m;
		}
		
        ~this() 
		{ 
		ЛЛВыместиМодуль(this.раскрой());
		}

        public ткст раскладкаДанных()
        {
            return ll.common.вТкст(ЛЛДайСтрРаскладкиДанных(this.раскрой()));           
        }

        public проц раскладкаДанных( ткст ткт)
        {           
             ЛЛУстРаскладкуДанных(this.раскрой(), ll.common.вТкст0(ткт));
        }

        public Контекст контекст()
		{ 
			return new Контекст(ЛЛДайКонтекстМодуля(this.раскрой()));
		}
/+
        public Модуль клонируйМодуль()
		{
			return LLVM.CloneModule(this.раскрой());
		}
+/
        public проц дамп()
		{
		ЛЛДампМодуля(this.раскрой());
		}

        public бул выведиВФайл(ткст имяф, out ткст0 ошСооб) 
		{ 
			return ЛЛВыведиМодульВФайл(this.раскрой(), ll.common.вТкст0(имяф), &ошСооб);
		}

        public ткст выведиВТкст()
        {
            auto ptr = ЛЛВыведиМодульВСтроку(this.раскрой());
            auto retVal = ll.common.вТкст(ptr);
            ЛЛВыместиСообщение(ptr);
            return retVal;
        }

        public проц устИнлайнАсм(ткст asm_)
		{ 
			ЛЛУстИнлайнАсмМодуля(this.раскрой(), вТкст0(asm_));
		}
        
        public ГлобПеременная дайИменГлоб(ткст имя)
		{
			return new ГлобПеременная(ЛЛДайИменованныйГлоб(this.раскрой(), ll.common.вТкст0(имя)));
		}

        public Тип дайТипПоИмени(ткст имя)
		{ 
			return new Тип(ЛЛДайТипПоИмени(this.раскрой(), ll.common.вТкст0(имя)));
		}

        public бцел дайЧлоОперандовИМД(ткст имя)
		{
			return ЛЛДайЧлоОперандовИменованныхМетаданных(this.раскрой(), ll.common.вТкст0(имя));
		}

        public Значение[] дайОперандыИМД(ткст имя)
		{ 
			ЛЛЗначение[] приёмник;
			ЛЛДайОперандыИменованныхМетаданных(this.раскрой(), ll.common.вТкст0(имя), cast(ЛЛЗначение*) &приёмник);
			Значение[] результат;
			foreach(зн; приёмник)
			{
				результат ~= new Значение(зн);
			}

			return результат;
	    }

        public проц добавьОперандИМД(ткст имя, Значение val)
		{ 
			ЛЛДобавьОперандИменованныхМетаданных(this.раскрой(), ll.common.вТкст0(имя), val.раскрой());
        }


        public Функция добавьФункцию(ткст имя, Тип типФн)
		{ 
			return new Функция(ЛЛДобавьФункц(this.раскрой(), вТкст0(имя), типФн.раскрой()));
		}

        public Функция дайИменФункцию(ткст имя) 
		{
			return new Функция(ЛЛДайИменованФункц(this.раскрой(), вТкст0(имя)));
		}

        public Функция первФункц() 
		{
			return new Функция(ЛЛДайПервФункц(this.раскрой()));
		}

        public Функция последнФункц()
		{
			return new Функция(ЛЛДайПоследнФункц(this.раскрой()));
		}

        public ГлобЗначение добавьГлоб(Тип тип, ткст имя) 
		{
			return new ГлобЗначение(ЛЛДобавьГлоб(this.раскрой(), тип.раскрой(), вТкст0(имя)));
		}

        public ГлобЗначение добавьГлобВАдрПростр(Тип тип, ткст имя, бцел адреснПрострво)
		{
			return new ГлобЗначение(ЛЛДобавьГлобВАдрПрострво(this.раскрой(), тип.раскрой(), вТкст0(имя), адреснПрострво));
		}

        public ГлобЗначение дайИменованЗнач(ткст имя) 
		{ 
			return new ГлобЗначение(ЛЛДайИменованныйГлоб(this.раскрой(), вТкст0(имя)));
		}

        public ГлобЗначение первГлоб() 
		{ 
			return new ГлобЗначение(ЛЛДайПервыйГлоб(this.раскрой()));
		}

        public ГлобЗначение последнГлоб() 
		{
			return new ГлобЗначение(ЛЛДайПоследнийГлоб(this.раскрой()));
		}

        public ГлобЗначение добавьНик(Тип тип, Значение aliasee, ткст имя)
		{
			return new ГлобЗначение(ЛЛДобавьНик(this.раскрой(), тип.раскрой(), aliasee.раскрой(), вТкст0(имя)));
		}

        public бцел дайИдТипаМД(ткст имя) 
		{ 
			return ЛЛДайИДТипаМДВКонтексте(this.контекст.раскрой(), вТкст0(имя), cast(бцел)имя.length);
		}
        
        public МодульПровайдер создайМПДляМодуля() 
		{ 
			return new МодульПровайдер(ЛЛСоздайМодульПровайдерДляСущМодуля(this.раскрой()));
		}
        public МенеджерПроходок создайМПФДляМодуля()
		{
			return new МенеджерПроходок(ЛЛСоздайМенеджерФукнцПроходокДляМодуля(this.раскрой()));
		}
/+
        public void Verify()
        {
            if(!this.TryVerify(out ткст message))
            {
                throw new InvalidOperationException(message);
            }
        }
        public bool TryVerify(out ткст message)
        {
            auto success = !LLVM.VerifyModule(this.раскрой(), LLVMVerifierFailureAction.LLVMPrintMessageAction, out ук messagePtr);
            message = Marshal.PtrToStringAnsi(messagePtr);
            return success;
        }
+/
        public цел пишиВФайл(ткст путь)
		{
			return ЛЛПишиБиткодВФайл(this.раскрой(), вТкст0(путь));
		}

        public цел пишиВФД(цел fd, бул закрыть_ли, бул небуферировать_ли)
		{
			return ЛЛПишиБиткодВФД(this.раскрой(), fd, закрыть_ли, небуферировать_ли);
		}

        public цел пишиВФук(цел handle)
		{
			return ЛЛПишиБиткодВФайлУк(this.раскрой(), handle);
		}

        public БуфПам пишиВБуфПам() 
		{
			return new БуфПам(ЛЛПишиБиткодВБуфПамяти(this.раскрой()));
		}
/+
        public bool Equals(Модуль other)
		{
			return ReferenceEquals(other, null) ? false : this.экземпл == other.экземпл;
		}

        public override bool Equals(object obj)
		{
			return this.Equals(obj as Модуль);
		}

        public static bool operator ==(Модуль op1, Модуль op2)
		{
			return ReferenceEquals(op1, null) ? ReferenceEquals(op2, null) : op1.Equals(op2);
		}

        public static bool operator !=(Модуль op1, Модуль op2) 
		{ 
			return !(op1 == op2);
		}

        public override цел GetHashCode() 
		{ 
			return this.экземпл.GetHashCode();
		}

        public ткст цель()
        {
           // get { Marshal.PtrToStringAnsi(LLVM.GetTargetAsPtr(this.раскрой()));}
            //set { LLVM.SetTarget(this.раскрой(), значение);}
        }
		+/
    }