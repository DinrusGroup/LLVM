module ll.api.vals.instructions.StoreInst;

   import ll.api.vals.Instruction;
   import ll.c.Types;
   import ll.c.Core;

    public class СохраниИнстр : Инструкция
    {
        this (ЛЛЗначение экзэмпл){ super(экзэмпл);}

        public бцел раскладка()
        {
            return ЛЛДайРаскладку(this.раскрой());
        }

        public проц раскладка(бцел з)
		{
            ЛЛУстРаскладку(this.раскрой(), з);
		}
    }
