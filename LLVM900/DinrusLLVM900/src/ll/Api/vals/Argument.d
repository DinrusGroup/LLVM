module ll.api.vals.Argument;

    import ll.api.vals.consts.GlobalValues.GlobalObjects;
	import ll.api.Value;
	import ll.c.Types;
	import ll.c.Core;
	import ll.api.vals.consts.GlobalValues.GlobalObjects.Function;

    public class Аргумент : Значение
    {
		private ЛЛЗначение экземпл;
        public this(ЛЛЗначение экземпл)
		{
            super(экземпл);
			this.экземпл = экземпл;
        }

		public override ЛЛЗначение раскрой(){return this.экземпл;}

        public void устРасклад(бцел раскл)
		{ 
			ЛЛУстРаскладПарама(this.раскрой(), раскл); 
		}

        public Функция родитель()
		{ 
			return new Функция( ЛЛДайПредкаПарам(this.раскрой()));
		}

        public Аргумент следщПарам ()
		{
			return new Аргумент( ЛЛДайСледщПарам(this.раскрой()));
		}

        public Аргумент предшПарам()
		{
			return new Аргумент(ЛЛДайПредшПарам(this.раскрой()));
		}
    }

