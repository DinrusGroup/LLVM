module ll.api.PassRegistry;

    public class PassRegistry : IWrapper!(LLVMPassRegistryRef)
    {
       // LLVMPassRegistryRef IWrapper!(LLVMPassRegistryRef).ToHandleType { this.�������;

        public static PassRegistry Global()
		{
			return LLVM.GetGlobalPassRegistry().Wrap();
		}

        private LLVMPassRegistryRef �������;

        package PassRegistry(LLVMPassRegistryRef �������)
        {
            this.������� = �������;
        }

        public void InitializeCore() 
		{
			LLVM.InitializeCore(this.�������());
		}

        public void InitializeTransformUtils()
		{
			LLVM.InitializeTransformUtils(this.�������());
		}

        public void InitializeScalarOpts()
		{
			LLVM.InitializeScalarOpts(this.�������());
		}

        public void InitializeObjCARCOpts()
		{ 
			LLVM.InitializeObjCARCOpts(this.�������());
		}

        public void InitializeVectorization()
		{ 
			LLVM.InitializeVectorization(this.�������());
		}

        public void InitializeInstCombine() 
		{
			LLVM.InitializeInstCombine(this.�������());
		}

        public void InitializeIPO()
		{ 
			LLVM.InitializeIPO(this.�������());
		}

        public void InitializeInstrumentation()
		{ 
			LLVM.InitializeInstrumentation(this.�������());
		}

        public void InitializeAnalysis()
		{ 
			LLVM.InitializeAnalysis(this.�������());
		}

        public void InitializeIPA() 
		{
			LLVM.InitializeIPA(this.�������());
		}

        public void InitializeCodeGen() 
		{
			LLVM.InitializeCodeGen(this.�������());
		}

        public void InitializeTarget() 
		{ 
			LLVM.InitializeTarget(this.�������());
		}
    }
