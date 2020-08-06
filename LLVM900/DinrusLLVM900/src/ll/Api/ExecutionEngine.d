module ll.api.ExecutionEngine;

import ll.c.Types, ll.c.Core;
import ll.c.ExecutionEngine;
import ll.api.vals.consts.GlobalValues.GlobalObjects.Function;
import  ll.api.GenericValue;
import ll.api.Module;

import ll.common;

    public class ДвигВып
    {
        /*
        private ЛЛДвижокВыполнения[Модуль] _engineModuleMap;

        private ДвигВып ассоциируйСМодулем(Модуль m)
        {
            auto экзэмпл = this.раскрой();
            if (!_engineModuleMap.ContainsKey(экзэмпл))
            {
                _engineModuleMap[экзэмпл] = new List!(Модуль)();
            }
            _engineModuleMap[экзэмпл].Add(m);
            return this;
        }

        private ДвигВып DisassosicateWithModule(Модуль m)
        {
            auto экзэмпл = this.раскрой();
            if(_engineModuleMap.ContainsKey(экзэмпл))
            {
                _engineModuleMap[экзэмпл].Remove(m);
            }
            return this;
        }

        private IEnumerable!(Модуль) GetAssociatedModules()
        {
            auto экзэмпл = this.раскрой();
            if(_engineModuleMap.ContainsKey(экзэмпл))
            {
                return _engineModuleMap[экзэмпл].ToArray();
            }
            else
            {
                return new Модуль[0];
            }
        }
*/

        private ЛЛДвижокВыполнения экземпл;

        this(){}
        
        this(Модуль модуль)
        {
            ЛЛДвижокВыполнения экз;
            ткст0 ош;

            if (!ЛЛСоздайДвижВыпДляМодуля(&экз, модуль.раскрой(), ош))
            {
                throw new Искл(вТкст(ош));
            }

			this.экземпл = экз ;
        }
        
        this(ЛЛДвижокВыполнения дв)
        {
            this.экземпл = дв;
        }

        ~this()
        {
            ЛЛВыместиДвижВып(this.раскрой());
        }

        public ЛЛДвижокВыполнения раскрой(){return this.экземпл;}

        public проц выполниСтатКонструкторы() 
		{
			ЛЛВыполниСтатичКонструкторы(this.раскрой());

		}
        public проц выполниСтатДеструкторы() 
		{ 
			ЛЛВыполниСтатичДеструкторы(this.раскрой());
		}

        public ГенерноеЗначение выполни(Функция ф, ГенерноеЗначение[] арги)
		{
            //ЛЛГенерноеЗначение
			return new ГенерноеЗначение(ЛЛВыполниФункц(this.раскрой(), ф.раскрой(), арги.раскрой()));
		}

        public цел выполниКакГлавную(Функция ф, бцел argC, ткст[] argV, ткст[] envP)
		{
			return ЛЛВыполниФункцКакГлавную(this.раскрой(), ф.раскрой(), argC, argV, envP);
		}

        public цел выполниКакГлавную(Функция ф, ткст[] argV)
		{
			return выполниКакГлавную(ф, cast(бцел)argV.length, argV, new ткст[0]); 
		}

        public проц освободиМашКод(Функция ф) 
		{
			ЛЛОсвободиМашКодДляФункции(this.раскрой(), ф.раскрой());
		}

        public проц добавьМодуль(Модуль м)
        {
            ЛЛДобавьМодуль(this.раскрой(), м.раскрой());
           // this.AssociateWithModule(м);
        }

        public Модуль удалиМодуль(Модуль м)
        {
            ЛЛМодуль outModRef;
            ткст0 ош;

            ЛЛУдалиМодуль(this.раскрой(), м.раскрой(), &outModRef, &ош);
            //this.DisassosicateWithModule(m);
            return new Модуль(outModRef);
        }

        public Функция FindFunction(string имя) 
		{
			LLVM.FindFunction(this.раскрой(), имя, out ЛЛЗначение outFnValueRef) ? null : outFnValueRef.WrapAs!(Функция)();
		}

        public ук RecompileAndRelinkFunction(Значение fn)
		{ 
			LLVM.RecompileAndRelinkFunction(this.раскрой(), fn.раскрой());
		}

        public TargetData TargetData
		{
			LLVM.GetExecutionEngineTargetData(this.раскрой()).Wrap();
		}

        public TargetMachine TargetMachine
		{
			LLVM.GetExecutionEngineTargetMachine(this.раскрой()).Wrap();
		}

        public void AddGlobalMapping(Значение global, ук addr)
		{ 
			LLVM.AddGlobalMapping(this.раскрой(), global.раскрой(), addr);
		}

        public ук GetPointerToGlobal(ГлобЗначение global)
		{
			LLVM.GetPointerToGlobal(this.раскрой(), global.раскрой());
		}

        public ulong GetGlobalValueAddress(string имя)
		{
			LLVM.GetGlobalValueAddress(this.раскрой(), имя);
		}

        public ulong GetFunctionAddress(string имя)
		{ 
			LLVM.GetFunctionAddress(this.раскрой(), имя);
		}

        public TDelegate GetDelegate<TDelegate)(Функция function)
        {
            auto functionPtr = this.GetPointerToGlobal(function);
            return (TDelegate)(object)Marshal.GetDelegateForFunctionPointer(functionPtr, typeof(TDelegate));
        }

        public override int GetHashCode() 
		{ 
			this.экземпл.GetHashCode();
		}
        public override bool Equals(object obj) 
		{
			this.Equals(obj as ExecutionEngine);
		}

        public bool Equals(ExecutionEngine other)
		{
			ReferenceEquals(other, null) ? false : this.экземпл == other.экземпл;
		}

        public static bool operator ==(ExecutionEngine op1, ExecutionEngine op2)
		{
			ReferenceEquals(op1, null) ? ReferenceEquals(op2, null) : op1.Equals(op2);
		}

        public static bool operator !=(ExecutionEngine op1, ExecutionEngine op2) 
		{ 
			!(op1 == op2);
		}

    }
}
/////////////////////
class Интерпретатор: ДвигВып
{
   this(Модуль модуль)
{
	ЛЛДвижокВыполнения экзэмпл;
	ткст0 ош;
	if (!ЛЛСоздайИнтерпретаторДляМодуля(&экзэмпл, модуль.раскрой(), &ош))
	{
		throw new Искл(вТкст(ош));
	}

	super(экзэмпл);
}

}

class ДжИТКомпилятор: ДвигВып
{
	this(Модуль модуль, бцел уровеньОпц)
	{
		ЛЛДвижокВыполнения экзэмпл;
		ткст0 ош;

		if (!ЛЛСоздайДжИТКомпиляторДляМодуля(&экзэмпл, модуль.раскрой(), уровеньОпц, &ош))
		{
			throw new Искл(вТкст(ош));
		}

		super(экзэмпл);
	}

}

class МЦДжИТКомпилятор: ДвигВып
{
    this(Модуль модуль)
    { 
        //ЛЛОпцииКомпиляцииМЦДжИТ опции;
	    this(модуль, бцел.init);
    }

    this(Модуль модуль,ЛЛОпцииКомпиляцииМЦДжИТ опции)
    {
	    ЛЛДвижокВыполнения экзэмпл;
	    ткст0 ош;	
	    ЛЛИнициализуйОпцииМЦДжИТКомпилятора(&опции, cast(т_мера) опции.size);
	    if (!ЛЛСоздайМЦДжИТКомпиляторДляМодуля(&экзэмпл, модуль.раскрой(), &опции,  cast(т_мера) опции.size, &ош))
	    {
		    throw new Искл(вТкст(ош));
	    }

	    super(экзэмпл);
    }
}