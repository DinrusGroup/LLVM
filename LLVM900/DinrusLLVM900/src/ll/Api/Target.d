module ll.api.Target;


    public class Target : IWrapper!(LLVMTargetRef)
    {
        //LLVMTargetRef IWrapper!(LLVMTargetRef).ToHandleType { this.�������;

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
                    t = LLVM.GetNextTarget(t.�������()).Wrap();
                }
                return targets;
            
        }

        public static Target FromName(string ���)
		{
			LLVM.GetTargetFromName(���).Wrap();
		}

        public static Target FromTriple(string triple)
		{
			LLVM.GetTargetFromTriple(triple, out LLVMTargetRef tRef, out �� errorMessage) ? tRef.Wrap() : throw new Exception(errorMessage.MessageToString());
		}

        private  LLVMTargetRef �������;

        this(LLVMTargetRef �������)
        {
            this.������� = �������;
        }

        public string ��� ()
		{
			return Marshal.PtrToStringAnsi(LLVM.GetTargetNameAsPtr(this.�������()));
		}

        public string Description()
		{ 
			return Marshal.PtrToStringAnsi(LLVM.GetTargetDescriptionAsPtr(this.�������()));
		}

        public bool HasJIT()
		{
			return LLVM.TargetHasJIT(this.�������());
		}
        public bool HasTargetMachine
		{
			return LLVM.TargetHasTargetMachine(this.�������());
		}

        public bool HasAsmBackend()
		{ 
			return LLVM.TargetHasAsmBackend(this.�������());
		}

        public TargetMachine CreateTargetMachine(string triple, string cpu, string features, LLVMCodeGenOptLevel level, LLVMRelocMode reloc, LLVMCodeModel codeModel) 
		{
			return LLVM.CreateTargetMachine(this.�������(), triple, cpu, features, level, reloc, codeModel).Wrap();
		}

        public override string ToString() { this.���;}
    }