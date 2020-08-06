module ll.api.vals.Instruction;

import ll.c.Core, ll.c.Types;
import ll.api.Value;
import ll.api.vals.instructions.terminator.BranchInst;
import ll.api.vals.instructions.terminator.IndirectBrInst;
import ll.api.vals.instructions.terminator.InvokeInst;
import ll.api.vals.instructions.terminator.ReturnInst;
import ll.api.vals.instructions.terminator.SwitchInst;
import ll.api.vals.instructions.terminator.UnreachableInst;
import ll.api.vals.instructions.unary.AllocaInst;
import ll.api.vals.instructions.unary.LoadInst;
import ll.api.vals.instructions.StoreInst;
import ll.api.vals.instructions.unary.casts.TruncInst;
import ll.api.vals.instructions.GetElementPtrInst;
import ll.api.vals.instructions.unary.casts.ZExtInst;
import ll.api.vals.instructions.unary.casts.SExtInst;
import ll.api.vals.instructions.unary.casts.SIToFPInst;
import ll.api.vals.instructions.unary.casts.UIToFPInst;
import ll.api.vals.instructions.unary.casts.FPToSIInst;
import ll.api.vals.instructions.unary.casts.FPToUIInst;
import ll.api.vals.instructions.unary.casts.FPTruncInst;
import ll.api.vals.instructions.unary.casts.FPExtInst;
import ll.api.vals.instructions.unary.casts.IntToPtrInst;
import ll.api.vals.instructions.unary.casts.PtrToIntInst;
import ll.api.vals.instructions.unary.casts.BitCastInst;
import ll.api.vals.instructions.unary.casts.AddrSpaceCastInst;
import ll.api.vals.instructions.cmp.ICmpInst;
import ll.api.vals.instructions.cmp.FCmpInst;
import ll.api.vals.instructions.PHINode;
import ll.api.vals.instructions.CallInst;
import ll.api.vals.instructions.SelectInst;
import ll.api.vals.instructions.unary.VAArgInst;
import ll.api.vals.instructions.unary.LoadInst;
import ll.api.vals.instructions.ExtractElementInst;
import ll.api.vals.instructions.InsertElementInst;
import ll.api.vals.instructions.ShuffleVectorInst;
import ll.api.vals.instructions.InsertValueInst;
import ll.api.vals.instructions.unary.ExtractValueInst;
import ll.api.vals.instructions.FenceInst;
import ll.api.vals.instructions.AtomicCmpXchgInst;
import ll.api.vals.instructions.AtomicRMWInst;
import ll.api.vals.instructions.terminator.ResumeInst;
import ll.api.vals.instructions.LandingPadInst;
import ll.api.vals.BasicBlock;

class Инструкция : Значение
{

    private ЛЛЗначение экзэмпл;

        static Инструкция создай()
        {
            if (this.экзэмпл == null)
            {
                return null;
            }

            auto опкод = ЛЛДайОпкодИнстр(this.экзэмпл);

            switch (опкод)
            {
                case ЛЛОпкод.Возвр:
                    return new ВозвратИнстр(this.экзэмпл);
                case ЛЛОпкод.Бр:
                    return new ВетвьИнстр(this.экзэмпл);
                case ЛЛОпкод.Щит:
                    return new ЩитИнстр(this.экзэмпл);
                case ЛЛОпкод.НепрямБр:
                    return new НепрямБрИнстр(this.экзэмпл);
                case ЛЛОпкод.Инвок:
                    return new ИнвокИнстр(this.экзэмпл);
                case ЛЛОпкод.Недоступно:
                    return new НедоступнИнстр(this.экзэмпл);
					
			//	case ЛЛОпкод.КоллБр:
				
                case ЛЛОпкод.Разместа:
                    return new РазместаИнстр(this.экзэмпл);
                case ЛЛОпкод.Загрузи:
                    return new ГрузиИнстр(this.экзэмпл);
                case ЛЛОпкод.Сохрани:
                    return new СохраниИнстр(this.экзэмпл);
                case ЛЛОпкод.ДайУкзЭлта:
                    return new ДайУкЭлтаИнстр(this.экзэмпл);
                case ЛЛОпкод.Обрежь:
                    return new ОбрежьИнстр(this.экзэмпл);
                case ЛЛОпкод.НРасш:
                    return new НРасшИнстр(this.экзэмпл);
                case ЛЛОпкод.ЗРасш:
                    return new ЗРасшИнстр(this.экзэмпл);				
                case ЛЛОпкод.ПЗвБЦ:
                    return new ПЗвБЦИнстр(this.экзэмпл);
                case ЛЛОпкод.ПЗвЗЦ:
                    return new ПЗвЗЦИнстр(this.экзэмпл);
                case ЛЛОпкод.БЦвПЗ:
                    return new БЦвПЗИнстр(this.экзэмпл);
                case ЛЛОпкод.ЗЦвПЗ:
                    return new ЗЦвПЗИнстр(this.экзэмпл);
                case ЛЛОпкод.ПЗОбрежь:
                    return new ПЗОбрежьИнстр(this.экзэмпл);
                case ЛЛОпкод.ПЗРасш:
                    return new ПЗРасшИнстр(this.экзэмпл);
                case ЛЛОпкод.УкзВЦел:
                    return new УкВЦелИнстр(this.экзэмпл);
                case ЛЛОпкод.ЦелВУкз:
                    return new ЦелВУкИнстр(this.экзэмпл);
                case ЛЛОпкод.БитКаст:
                    return new БитКастИнстр(this.экзэмпл);
                case ЛЛОпкод.АдрПрострКаст:
                    return new АдрПрострКастИнстр(this.экзэмпл);				
                case ЛЛОпкод.ЦСравн:
                    return new ЦСравнИнстр(this.экзэмпл);
                case ЛЛОпкод.ПСравн:
                    return new ПСравнИнстр(this.экзэмпл);
                case ЛЛОпкод.ПХИ:
                    return new УзелПХИ(this.экзэмпл);
                case ЛЛОпкод.Вызов:
                    return new ВызовИнстр(this.экзэмпл);
                case ЛЛОпкод.Выбор:
                    return new ВыбериИнстр(this.экзэмпл);	
				case ЛЛОпкод.ЮзерОп1:
                   // return new NotSupportedException();
                case ЛЛОпкод.ЮзерОп2:
                  //  return new NotSupportedException();
                case ЛЛОпкод.ВаАрг:
                    return new ВаАргИнстр(this.экзэмпл);
                case ЛЛОпкод.ИзвлЭлта:
                    return new ИзвлекиЭлтИнстр(this.экзэмпл);
                case ЛЛОпкод.ВставкаЭлта:
                    return new ВствьЭлтИнстр(this.экзэмпл);
                case ЛЛОпкод.ШафлВектор:
                    return new ШафлВекторИнстр(this.экзэмпл);
                case ЛЛОпкод.ИзвлЗнач:
                    return new ИзвлекиЗначИнстр(this.экзэмпл);				
                case ЛЛОпкод.ВставкаЗнач:
                    return new ВставьЗначИнстр(this.экзэмпл);
                case ЛЛОпкод.Забор:
                    return new ЗаборИнстр(this.экзэмпл);
                case ЛЛОпкод.AtomicCmpXchg:
                    return new AtomicCmpXchgInst(this.экзэмпл);
                case ЛЛОпкод.AtomicRMW:
                    return new AtomicRMWInst(this.экзэмпл);
                case ЛЛОпкод.Возобнови:
                    return new ВозобновиИнстр(this.экзэмпл);
				case ЛЛОпкод.ЛэндингПад:
                    return new ЛэндингПадИнстр(this.экзэмпл);
                default:
                    //this(экзэмпл);
            }
            }
        }

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
        }

        public бул естьМетаданные()
		{
			return ЛЛЕстьМетаданные_ли(this.раскрой()) != 0;
		}

        public Значение дайМетаданные(бцел идВида)
		{
			return new Значение(ЛЛДайМетаданные(this.раскрой(), идВида));
		}

        public проц устМетаданные(бцел идВида, Значение узел) 
		{
			ЛЛУстМетаданные(this.раскрой(), идВида, узел.раскрой());
		}

        public БазБлок родитель()
		{
			return new БазБлок(ЛЛДайРодителяИнстр(this.раскрой()));
		}

        public Инструкция предш()
		{
			return new Инструкция(ЛЛДайПредшИнстр(this.раскрой()));
		}

        public Инструкция следщ()
		{
			return new Инструкция(ЛЛДайСледщИнстр(this.раскрой()));
		}

        public проц сотриИзРодителя()
		{ 
			ЛЛИнструкция_СотриИзРодителя(this.раскрой());
		}

        public Инструкция клонируй()
		{ 
			return new Инструкция(ЛЛИнструкция_Клонируй(this.раскрой()));
		}

        public проц устРаскладкуПараметра(бцел индекс, бцел раскладка)
		{ 
			ЛЛУстРаскладПарамовИнстр(this.раскрой(), индекс, раскладка);
		}

        public ЛЛОпкод опкод()
		{ 
			return ЛЛДайОпкодИнстр(this.раскрой());
		}
    }
}