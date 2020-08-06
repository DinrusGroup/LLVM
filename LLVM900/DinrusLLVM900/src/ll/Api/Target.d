module ll.api.Target;


    public class Target : IWrapper!(LLVMTargetRef)
    {
        //LLVMTargetRef IWrapper!(LLVMTargetRef).ToHandleType { this.экземпл;

        public static string DefaultTriple()
		{
			LLVM.GetDefaultTargetTriple().MessageToString();
		}

        public static IReadOnlyList!(Target) Targets()
        {
            //get
            
                auto targets = new List!(Target)();
                auto t = LLVM.GetFirstTarget().Wrap();
                while (t != null)
                {
                    targets.Add(t);
                    t = LLVM.GetNextTarget(t.раскрой()).Wrap();
                }
                return targets;
            
        }

        public static Target FromName(string имя)
		{
			LLVM.GetTargetFromName(имя).Wrap();
		}

        public static Target FromTriple(string triple)
		{
			LLVM.GetTargetFromTriple(triple, out LLVMTargetRef tRef, out ук errorMessage) ? tRef.Wrap() : throw new Exception(errorMessage.MessageToString());
		}

        private  LLVMTargetRef экземпл;

        this(LLVMTargetRef экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        public string имя ()
		{
			return Marshal.PtrToStringAnsi(LLVM.GetTargetNameAsPtr(this.раскрой()));
		}

        public string Description()
		{ 
			return Marshal.PtrToStringAnsi(LLVM.GetTargetDescriptionAsPtr(this.раскрой()));
		}

        public bool HasJIT()
		{
			return LLVM.TargetHasJIT(this.раскрой());
		}
        public bool HasTargetMachine
		{
			return LLVM.TargetHasTargetMachine(this.раскрой());
		}

        public bool HasAsmBackend()
		{ 
			return LLVM.TargetHasAsmBackend(this.раскрой());
		}

        public TargetMachine CreateTargetMachine(string triple, string cpu, string features, LLVMCodeGenOptLevel level, LLVMRelocMode reloc, LLVMCodeModel codeModel) 
		{
			return LLVM.CreateTargetMachine(this.раскрой(), triple, cpu, features, level, reloc, codeModel).Wrap();
		}

        public override string ToString() { this.имя;}
    }