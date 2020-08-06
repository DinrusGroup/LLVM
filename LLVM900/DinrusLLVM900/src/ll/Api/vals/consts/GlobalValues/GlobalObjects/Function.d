module ll.api.vals.consts.GlobalValues.GlobalObjects.Function;

    import ll.api.typs.FunctionType;
    import ll.api.vals.consts.GlobalValues.GlobalObject;
    import ll.c.Types;
    import ll.c.Core;
    import ll.api.Module;
    import ll.api.typs.FunctionType;
    import ll.api.vals.BasicBlock;
    import ll.api.Context;
    import ll.api.vals.Argument;
    import ll.api.Value;

    import ll.common;

    public  class Функция : ГлобОбъект
    {
        public this(ТипФункция тип, ЛЛКомпоновка линкаж, ткст имя, Модуль модуль)
        {
            auto значение = ЛЛДобавьФункц(модуль.раскрой(), вТкст0(имя), тип.раскрой());            
            ЛЛУстКомпоновку(значение, линкаж);
            this(значение);
        }

        private ЛЛЗначение экзэмпл;

        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);
            this.экзэмпл = экзэмпл;
        }

        public override ЛЛЗначение раскрой()
		{
            return this.экзэмпл;
		}
        
        public ЛЛКонвВызова конвВызова()
        {
            return cast(ЛЛКонвВызова) ЛЛДайКонвВызФунции(this.раскрой());
        }

        проц устКонвВызова(ЛЛКонвВызова конв)
		{
            ЛЛУстКонвВызФунции(this.раскрой(), cast(бцел) конв);
		}

        public Значение АдресБлока(БазБлок bb)
		{ 
			return ЛЛАдрБлока(this.раскрой(), bb.раскрой());
		}

        public бцел интринсикИд()
		{ 
			return ЛЛДАйИнтринсикИД(this.раскрой());
		}

        public ткст дайСМ()
        {
            return вТкст(ЛЛДайСМ(this.раскрой()));
        }

        public проц устСМ(ткст имя)
		{
            ЛЛУстСМ(this.раскрой(), вТкст0(имя));
		}

        public проц добавьЦелеЗависимАтр(ткст a, ткст v)
		{
		return ЛЛДобавьЦелеЗависимАтрФции(this.раскрой(), вТкст0(a), вТкст0(v));
		}
/+
        public Аргумент[] параметры()
		{
            ЛЛЗначение пармы;//Надо получить из этого список аргументов!
             ЛЛДайПарамы(this.раскрой(), &пармы);
            Аргумент[] результат;// = пармы, представленные как массив аргументов.
		   
            return результат;
		}


        public БазБлок[] базБлоки()
		{
			return ЛЛДайБазБлоки(this.раскрой());
		}

        public ТипФункция тип()
		{ 
			return new ТипФункция( ЛЛДайТипВозврата(this.тип.раскрой()));
		}
+/
        public bool варАрг_ли()
		{
			return ЛЛВараргФункц_ли(this.Type.раскрой());
		}

        public БазБлок вводный()
		{ 
			return ЛЛДайВводнБазБлок(this.раскрой());
		}

        public БазБлок приставь(ткст имя) 
		{
			return ЛЛПриставьБазБлок(this.раскрой(), имя);
		}

        public БазБлок приставь(ткст имя, Контекст контекст)
		{ 
			return new БазБлок(ЛЛПриставьБазБлокВКонтексте(контекст.раскрой(), this.раскрой(), вТкст0(имя)));
		}

        public Функция следщ()
		{
			return ЛЛДайСледщФункц(this.раскрой());
		}

        public Функция предш ()
		{
			return ЛЛДайПредшФункц(this.раскрой());
		}
/+
        public void Verify()
        {
            if (!this.TryVerify())
            {
                throw new InvalidOperationException($"Функция \"{this.имя}\" has errors. Verify the containing module for detailed information.");
            }
        }
        public bool TryVerify()
		{ 
			!LLVMVerifyFunction(this.раскрой(), LLVMVerifierFailureAction.LLVMReturnStatusAction);
		}

        public void ViewFunctionCFG() 
		{
			return LLVMViewFunctionCFG(this.раскрой());
		}
        public void ViewFunctionCFGOnly()
		{ 
			return LLVMViewFunctionCFGOnly(this.раскрой());
		}
+/
        public проц удали() 
		{ 
			return ЛЛУдалиФункц(this.раскрой());
		}
    }
}