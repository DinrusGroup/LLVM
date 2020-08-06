module ll.api.Module;

import ll.common, ll.c.Core, ll.c.Types, ll.c.Linker;
import ll.api.Context, ll.api.Type, ll.api.Value;
import ll.api.vals.consts.GlobalValues.GlobalObjects.GlobalVariable;
import ll.api.vals.consts.GlobalValues.GlobalObjects.Function;
import ll.api.vals.consts.GlobalValue;

    public  class Модуль 
    {

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

		public ЛЛМодуль раскрой(){return this.экземпл;}

        private ЛЛМодуль экземпл;
        private bool _disposed;
        private bool _owner;

        this(ЛЛМодуль m) { this.экземпл = m;}
        ~this() { this.Dispose(false);}

        public ткст раскладкаДанных()
        {
            return вТкст(ЛЛДайСтрРаскладкиДанных(this.раскрой()));           
        }

        public проц раскладкаДанных( ткст ткт)
        {           
             ЛЛУстРаскладкуДанных(this.раскрой(), вТкст0(ткт));}
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
        public проц дамп() { ЛЛДампМодуля(this.раскрой());}

        public бул выведиВФайл(ткст имяф, out ук ошСооб) 
		{ 
			return ЛЛВыведиМодульВФайл(this.раскрой(), вТкст0(имяф), ошСооб);
		}

        public ткст выведиВТкст()
        {
            auto ptr = ЛЛВыведиМодульВСтроку(this.раскрой());
            auto retVal = вТкст(ptr);
            ЛЛВыместиСообщение(ptr);
            return retVal;
        }

        public проц устИнлайнАсм(ткст asm_)
		{ 
			ЛЛУстИнлайнАсмМодуля(this.раскрой(), вТкст0(asm_));
		}
        
        public ГлобПеременная дайИменГлоб(ткст имя)
		{
			return new ГлобПеременная(ЛЛДайИменованныйГлоб(this.раскрой(), вТкст0(имя)));
		}

        public Тип дайТипПоИмени(ткст имя)
		{ 
			return new Тип(ЛЛДайТипПоИмени(this.раскрой(), вТкст0(имя)));
		}

        public бцел дайЧлоОперандовИМД(ткст имя)
		{
			return ЛЛДайЧлоОперандовИменованныхМетаданных(this.раскрой(), вТкст0(имя));
		}

        public Значение[] дайОперандыИМД(тксь имя)
		{ 
			ЛЛЗначение приёмник;
			ЛЛДайОперандыИменованныхМетаданных(this.раскрой(), вТкст0(имя), &приёмник);
			return cast(Значение[]) приёмник;
	    }

        public проц добавьОперандИМД(ткст имя, Значение val)
		{ 
			ЛЛДобавьОперандИменованныхМетаданных(this.раскрой(), вТкст0(имя), val.раскрой());
        }


        public Функция добавьФункцию(ткст имя, Тип типФн)
		{ 
			return new Функция(ЛЛДобавьФункц(this.раскрой(), вТкст0(имя), типФн.раскрой()));
		}

        public Функция дайИменФункцию(ткст имя) 
		{
			return new Функция(ЛЛДайИменованФункц(this.раскрой(), имя));
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

        public ГлобЗначение AddGlobalInAddressSpace(Type ty, string имя, uint адреснПрострво)
		{
			return LLVM.AddGlobalInAddressSpace(this.раскрой(), ty.раскрой(), имя, адреснПрострво).WrapAs!(ГлобЗначение)();
		}

        public ГлобЗначение GetNamedValue(string имя) 
		{ 
			return LLVM.GetNamedGlobal(this.раскрой(), имя).WrapAs!(ГлобЗначение)();
		}

        public ГлобЗначение GetFirstGlobal() 
		{ 
			return LLVM.GetFirstGlobal(this.раскрой()).WrapAs!(ГлобЗначение)();
		}

        public ГлобЗначение GetLastGlobal() 
		{
			return LLVM.GetLastGlobal(this.раскрой()).WrapAs!(ГлобЗначение)();
		}

        public ГлобЗначение AddAlias(Type ty, Значение aliasee, string имя)
		{
			return LLVM.AddAlias(this.раскрой(), ty.раскрой(), aliasee.раскрой(), имя).WrapAs!(ГлобЗначение)();
		}

        public uint GetMDKindID(string имя) 
		{ 
			return LLVM.GetMDKindIDInContext(this.Context.раскрой(), имя, (uint)имя.длина);
		}
        
        public ModuleProvider CreateModuleProviderForExistingModule() 
		{ 
			return LLVM.CreateModuleProviderForExistingModule(this.раскрой()).Wrap();
		}
        public PassManager CreateFunctionPassManagerForModule()
		{
			return LLVM.CreateFunctionPassManagerForModule(this.раскрой()).Wrap();
		}

        public void Verify()
        {
            if(!this.TryVerify(out string message))
            {
                throw new InvalidOperationException(message);
            }
        }
        public bool TryVerify(out string message)
        {
            auto success = !LLVM.VerifyModule(this.раскрой(), LLVMVerifierFailureAction.LLVMPrintMessageAction, out ук messagePtr);
            message = Marshal.PtrToStringAnsi(messagePtr);
            return success;
        }

        public int WriteBitcodeToFile(string path)
		{
			return LLVM.WriteBitcodeToFile(this.раскрой(), path);
		}

        public int WriteBitcodeToFD(int fd, int shouldClose, int unbuffered)
		{
			return LLVM.WriteBitcodeToFD(this.раскрой(), fd, shouldClose, unbuffered);
		}

        public int WriteBitcodeToFileHandle(int handle)
		{
			return LLVM.WriteBitcodeToFileHandle(this.раскрой(), handle);
		}

        public MemoryBuffer WriteBitcodeToMemoryBuffer() 
		{
			return LLVM.WriteBitcodeToMemoryBuffer(this.раскрой()).Wrap();
		}

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

        public override int GetHashCode() 
		{ 
			return this.экземпл.GetHashCode();
		}

        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (this._disposed)
            {
                return;
            }

            if (this._owner)
            {
                LLVM.DisposeModule(this.раскрой());
            }

            this._disposed = true;
        }

        public string Target()
        {
            get { Marshal.PtrToStringAnsi(LLVM.GetTargetAsPtr(this.раскрой()));}
            set { LLVM.SetTarget(this.раскрой(), значение);}
        }
    }