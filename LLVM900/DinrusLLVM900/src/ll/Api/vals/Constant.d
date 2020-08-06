module ll.api.vals.Constant;

import ll.c.Types;
import ll.c.Core;
import ll.api.Value;
import ll.api.vals.consts.BlockAddress;
import ll.api.vals.consts.ConstantAggregateZero;
import ll.api.vals.consts.ConstantArray;
import ll.api.vals.consts.ConstantDataSequentials.ConstantDataArray;
import ll.api.vals.consts.ConstantDataSequentials.ConstantDataVector;
import  ll.api.vals.consts.ConstantDataSequential;
import ll.api.vals.consts.ConstantPointerNull;
import ll.api.vals.consts.GlobalValues.GlobalAlias;
import ll.api.vals.consts.ConstantExpr;
import ll.api.vals.consts.ConstantDataSequential;
import ll.api.vals.consts.ConstantFP;
import ll.api.vals.consts.ConstantInt;
import ll.api.vals.consts.ConstantVector;
import ll.api.vals.consts.ConstantStruct;
import ll.api.vals.consts.UndefValue;
import ll.api.vals.consts.GlobalValue;
import ll.api.vals.consts.GlobalValues.GlobalObject;
import ll.api.vals.consts.GlobalValues.GlobalObjects.GlobalVariable;
import ll.api.vals.consts.GlobalValues.GlobalObjects.Function;


    public class Константа : Значение
    {
	
	private ЛЛЗначение экземпл;
	
        public Значение создай()
        {
            if (cast(бул) ЛЛАдресБлока_ли(this.экземпл))
            {
                return new АдресБлока(this.экземпл);
            }

            if (cast(бул)ЛЛКонстАгрегатНоль_ли(this.экземпл))
            {
                return new КонстАгрегатНоль(this.экземпл);
            }

            if (cast(бул) ЛЛМассивКонстант_ли(this.экземпл))
            {
                return new КонстМассив(this.экземпл);
            }

            if (cast(бул) ЛЛКонстПоследовательностьДанных_ли(this.экземпл))
            {
                if (cast(бул) ЛЛКонстМассивДанных_ли(this.экземпл))
                {
                    return new КонстМассивДанных(this.экземпл);
                }

                if (cast(бул) ЛЛКонстВекторДанных_ли(this.экземпл))
                {
                    return new КонстВекторДанных(this.экземпл);
                }

                return new КонстПоследовательностьДанных(this.экземпл);
            }

            if (cast(бул) ЛЛКонстВыражение_ли(this.экземпл))
            {
                return new КонстВыр(this.экземпл);
            }

            if (cast(бул) ЛЛКонстПЗ_ли(this.экземпл))
            {
                return new КонстПЗ(this.экземпл);
            }

            if (cast(бул) ЛЛКонстЦел_ли(this.экземпл))
            {
                return new КонстЦел(this.экземпл);
            }

            if (cast(бул) ЛЛКонстНуллУказатель_ли(this.экземпл))
            {
                return new КонстУкПусто(this.экземпл);
            }

            if (cast(бул) ЛЛКонстСтрукт_ли(this.экземпл))
            {
                return new КонстСтрукт(this.экземпл);
            }

            if (cast(бул) ЛЛКонстВектор_ли(this.экземпл))
            {
                return new КонстВектор(this.экземпл);
            }

            if (cast(бул) ЛЛГлобЗначение_ли(this.экземпл))
            {
                if (cast(бул) ЛЛГлобНик_ли(this.экземпл))
                {
                    return new ГлобНик(this.экземпл);
                }

                if (cast(бул) ЛЛГлобОбъект_ли(this.экземпл))
                {
                    if (cast(бул) ЛЛФункция_ли(this.экземпл))
                    {
                        return new Функция(this.экземпл);
                    }

                    if (cast(бул) ЛЛГлобПеременная_ли(this.экземпл))
                    {
                        return new ГлобПеременная(this.экземпл);
                    }

                    return new ГлобОбъект(this.экземпл);
                }

                return new ГлобЗначение(this.экземпл);
            }

            if (cast(бул) ЛЛНеопрЗначение_ли(this.экземпл))
            {
                return new НеопрЗначение(this.экземпл);
            }

            return new Константа(this.экземпл);
        }

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
			this.экземпл = экземпл;
        }
		
		public override ЛЛЗначение раскрой()
		{
		return this.экземпл;
		}

        public бул нулл_ли() { cast(бул) ЛЛПусто_ли(this.раскрой());}
    }
