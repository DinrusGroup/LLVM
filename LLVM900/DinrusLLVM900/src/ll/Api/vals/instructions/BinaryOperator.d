module ll.api.vals.instructions.BinaryOperator;

import ll.c.Core, ll.c.Types;
import ll.api.vals.Instruction;
import ll.api.vals.instructions.binary.Add;
import ll.api.vals.instructions.binary.FAdd;
import ll.api.vals.instructions.binary.Sub;
import ll.api.vals.instructions.binary.FSub;
import ll.api.vals.instructions.binary.Mul;
import ll.api.vals.instructions.binary.FMul;
import ll.api.vals.instructions.binary.And;
import ll.api.vals.instructions.binary.Or;
import ll.api.vals.instructions.binary.Xor;
import ll.api.vals.instructions.binary.AShr;
import ll.api.vals.instructions.binary.LShr;
import ll.api.vals.instructions.binary.Shl;
import ll.api.vals.instructions.binary.SRem;
import ll.api.vals.instructions.binary.FRem;
import ll.api.vals.instructions.binary.URem;
import ll.api.vals.instructions.binary.FDiv;
import ll.api.vals.instructions.binary.SDiv;
import ll.api.vals.instructions.binary.UDiv;

public class БинОп : Инструкция
    {
		private ЛЛЗначение экзэмпл;

        БинОп создай()
        {
            auto опкод = ЛЛДайОпкодИнстр(this.экзэмпл);
            switch (опкод)
            {
                case ЛЛОпкод.Сложи:
                    return new Add(this.экзэмпл);
                case ЛЛОпкод.ПСложи:
                    return new FAdd(this.экзэмпл);
                case ЛЛОпкод.Отними:
                    return new Sub(this.экзэмпл);
                case ЛЛОпкод.ПОтними:
                    return new FSub(this.экзэмпл);
                case ЛЛОпкод.Умножь:
                    return new Mul(this.экзэмпл);
                case ЛЛОпкод.ПУмножь:
                    return new FMul(this.экзэмпл);
                case ЛЛОпкод.БДели:
                    return new UDiv(this.экзэмпл);
                case ЛЛОпкод.ЗДели:
                    return new SDiv(this.экзэмпл);
                case ЛЛОпкод.ПДели:
                    return new FDiv(this.экзэмпл);
                case ЛЛОпкод.БРем:
                    return new URem(this.экзэмпл);
                case ЛЛОпкод.ЗРем:
                    return new SRem(this.экзэмпл);
                case ЛЛОпкод.ПРем:
                    return new FRem(this.экзэмпл);
                case ЛЛОпкод.Shl:
                    return new Shl(this.экзэмпл);
                case ЛЛОпкод.LShr:
                    return new LShr(this.экзэмпл);
                case ЛЛОпкод.AShr:
                    return new AShr(this.экзэмпл);
                case ЛЛОпкод.И:
                    return new And(this.экзэмпл);
                case ЛЛОпкод.Или:
                    return new Or(this.экзэмпл);
                case ЛЛОпкод.ИИли:
                    return new Xor(this.экзэмпл);
                default:
                    return this;
            }
        }

        this(ЛЛЗначение экзэмпл)
		{
			super(экзэмпл);
			this.экзэмпл = экзэмпл;
		}

		public ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}

    }