module ll.api.vals.instructions.AtomicCmpXchgInst;

import ll.api.vals.Instruction;
import ll.c.Types, ll.c.Core;

    public  class AtomicCmpXchgInst : Инструкция
    {
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

        public ЛЛАтомныйПорядок порядокУспеха()
        {
            return LLGetCmpXchgSuccessOrdering(this.раскрой());
           // set { LLVM.SetCmpXchgSuccessOrdering(this.раскрой(), значение.раскрой());
        }
        public ЛЛАтомныйПорядок порядокПровала()
        {
            return LLGetCmpXchgFailureOrdering(this.раскрой());
           // set { LLVM.SetCmpXchgFailureOrdering(this.раскрой(), значение.раскрой());
        }
    }
