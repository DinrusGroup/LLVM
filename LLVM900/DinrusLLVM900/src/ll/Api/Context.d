module ll.api.Context;

import ll.c.Core;
import ll.c.Types;
import ll.api.typs.Composite.SequentialTypes.ArrayType;
import ll.api.typs.Composite.SequentialTypes.PointerType;
import ll.api.typs.Composite.SequentialTypes.VectorType;
import ll.api.typs.Composite.StructType;
import ll.api.typs.HalfType;
import ll.api.typs.DoubleType;
import ll.api.typs.FloatType;
import ll.api.typs.IntegerType;
import ll.api.typs.FunctionType;
import ll.api.typs.X86FP80Type;
import ll.api.typs.X86MMXType;
import ll.api.typs.PPCFP128Type;
import ll.api.typs.VoidType;
import ll.api.typs.LabelType;
import ll.api.typs.FP128Type;
import ll.api.typs.LabelType;

import ll.api.Value;
import ll.api.vals.BasicBlock;

import ll.c.BitReader;
import ll.c.IRReader;

import ll.api.MemoryBuffer;
import ll.api.Module;

import ll.common;


    public class Контекст
    {

		private  ЛЛКонтекст экземпл;
        private ЛЛОбработчикДиагностики _обрабДиаг;
        private ЛЛОбрвызовЖни _обрвызЖни;

		this(ЛЛКонтекст контекстРеф)
        {
            this.экземпл = контекстРеф;
        }

        ~this()
        {
			ЛЛКонтекстВымести(this.раскрой()); 
        }

        public this()
		{ 
			this(ЛЛКонтекстСоздай());
		}

		public ЛЛКонтекст раскрой(){return this.экземпл;}

        public ЛЛКонтекст роскрой()
		{
            return this.экземпл;
		}

        public ТипЦелое типЦел1()
		{
			return new ТипЦелое(ЛЛТипЦел1ВКонтексте(this.раскрой()));
		}

        public ТипЦелое типЦел8()
		{
			return new ТипЦелое(ЛЛТипЦел8ВКонтексте(this.раскрой()));		
		}

        public ТипЦелое типЦел16()
		{
			return new ТипЦелое(ЛЛТипЦел16ВКонтексте(this.раскрой()));
		}

        public ТипЦелое типЦел32()
		{ 
            return new ТипЦелое(ЛЛТипЦел32Контексте(this.раскрой()));
		}

        public ТипЦелое типЦел64()
		{
			return new ТипЦелое(ЛЛТипЦел64ВКонтексте(this.раскрой()));
		}

        public ТипЦелое типЦел(бцел длинаБит)
		{
            return new ТипЦелое(ЛЛТипЦел(длинаБит));
		}

        public ТипХ86ММХ типХ86ММХ()
		{
			return new ТипХ86ММХ(ЛЛТипХ86ММХВКонтексте(this.раскрой()));
		}
        public Полутип полутип()
		{
			return new Полутип(ЛЛПолутипВКонтексте(this.раскрой()));
		}

        public ТипПлав типПлав()
		{
			return new ТипПлав(ЛЛТипПлавВКонтексте(this.раскрой()));
		}

        public ТипДво типДво()
		{
			return new ТипДво(ЛЛТипДвоВКонтексте(this.раскрой()));
		}

        public ТипХ86ПЗ80 типХ86ПЗ80()
		{ 
			return new ТипХ86ПЗ80(ЛЛТипХ86ФП80ВКонтексте(this.раскрой()));
		}

        public ТипПЗ128 типПЗ128()
		{ 
			return new ТипПЗ128(ЛЛТипФП128ВКонтексте(this.раскрой()));
		}

        public ТипППЦПЗ128 типППЦПЗ128()
		{ 
			return new ТипППЦПЗ128(ЛЛТипППЦФП128ВКонтексте(this.раскрой()));
		}

        public ТипПроц типПроц()
		{ 
			return new ТипПроц(ЛЛТипПроцВКонтексте(this.раскрой()));
		}

        public ТипЯрлык типЯрлык()
		{ 
			return new ТипЯрлык(ЛЛТипЯрлыкВКонтексте(this.раскрой()));
		}
        
        public бцел дайИдТипаМД(ткст имя)
		{
			return ЛЛДайИДТипаМДВКонтексте(this.раскрой(), имя, cast(бцел)имя.length);
		}

        public проц устОбработчикДиагностики(ЛЛОбработчикДиагностики обработчикДиагностики, ук контекстДиаг)
        {
            this._обрабДиаг =  обработчикДиагностики;
            ЛЛКонтекстУстОбработчикДиагностики(this.раскрой(), &this._обрабДиаг, контекстДиаг);
        }

        public проц устОбработчикДиагностики(ЛЛОбработчикДиагностики обработчикДиагностики)
        {
            this.устОбработчикДиагностики(обработчикДиагностики, null);
        }

        public проц устОбрвызовЖни(ЛЛОбрвызовЖни обрвыз, ук opaqueHande)
        {
            this._обрвызЖни = обрвыз;
            ЛЛОбрвызовЖни(this.раскрой(), &this._обрвызЖни, opaqueHande);
        }
  
        public ТипСтрукт типСтрукт(Тип[] типыЭлтов, бул упакован)
		{
			return new ТипСтрукт(ЛЛТипСтруктВКонтексте(this.раскрой(), типыЭлтов.раскрой(), упакован));
		}

        public Значение узелМДВКонтексте(Значение[] знач)
		{ 
			return new Значение(ЛЛМДУзелВКонтексте(this.раскрой(), знач.раскрой()));
		}

        public БазБлок приставьБазБлок(Значение фн, ткст имя)
		{
			return new БазБлок(ЛЛПриставьБазБлокВКонтексте(this.раскрой(), фн.раскрой(), имя)));
        }

        public БазБлок вставьБазБлокВКонтекст(БазБлок bb, ткст имя)
		{
			return new БазБлок(ЛЛВставьБазБлокВКонтекст(this.раскрой(), bb.раскрой(), имя));
		}

        public Модуль разбериБиткодВКонтексте(БуфПам memBuf)
        {
		
		ЛЛМодуль модуль;
		ткст0 ош;		
            if (!ЛЛРазбериБиткодВКонтексте(this.раскрой(), memBuf.раскрой(), &модуль, &ош))
            {
                throw new Искл(вТкст(ош));
            }

            return new Модуль(модуль);
        }

        public Модуль дайБиткодВКонтексте(БуфПам буфПам)
        {
		ЛЛМодуль модуль;
		ткст0 ош;	
		
            if (!ЛЛДайБиткодМодульВКонтексте(this.раскрой(), буфПам.раскрой(), &модуль, &ош))
            {
                 throw new Искл(вТкст(ош));
            }

            return new Модуль(модуль);
        }
/+
        public Тип дайТипЦелУк(TargetData targetData)
		{
			LLVM.IntPtrTypeInContext(this.раскрой(), targetData.раскрой()).Wrap();
		}

        public Type GetIntPtrType(TargetData targetData, uint адреснПрострво)
		{
			LLVM.IntPtrTypeForASInContext(this.раскрой(), targetData.раскрой(), адреснПрострво).Wrap();
		}
+/
        public Модуль разборПП(БуфПам буфПам)
        {		
		ЛЛМодуль модуль;
		ткст0 ош;	
		
            if (!ЛЛПарсируйППВКонтексте(this.раскрой(), буфПам.раскрой(), &модуль, &ош))
            {
                 throw new Искл(вТкст(ош));
            }

            return new Модуль(модуль);
        }
/+
        public override int GetHashCode()
		{ 
			this.экземпл.GetHashCode();
		}
+/
        public override бул Equals(Объект obj)
		{
			this.Equals(cast(Контекст) obj);
		}
/+
        public бул Equals(Контекст other)
		{
			ReferenceEquals(other, null) ? false : this.экземпл == other.экземпл;
		}
        public static bool operator ==(Context op1, Context op2)
		{
			ReferenceEquals(op1, null) ? ReferenceEquals(op2, null) : op1.Equals(op2);
		}

        public static bool operator !=(Context op1, Context op2)
		{
			!(op1 == op2);
		}
		+/
    }


	public Контекст глобальныйКонтекст()
	{
		return new Контекст(ЛЛДайГлобКонтекст());
	}

	//Создаём статический глобальный контекст (ГлобКонтекст) в автоматическом режиме.
	//Правда, возможно, следует вначале выполнить инициализацию LLVM!
public static Контекст ГлобКонтекст;

static this()
{
	ГлобКонтекст = глобальныйКонтекст();

}
