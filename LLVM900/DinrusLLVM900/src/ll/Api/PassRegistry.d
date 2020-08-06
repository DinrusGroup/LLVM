module ll.api.PassRegistry;

    public class PassRegistry : IWrapper!(LLVMPassRegistryRef)
    {
       // LLVMPassRegistryRef IWrapper!(LLVMPassRegistryRef).ToHandleType { this.экземпл;

        public static PassRegistry Global()
		{
			return LLVM.GetGlobalPassRegistry().Wrap();
		}

        private LLVMPassRegistryRef экземпл;

        package PassRegistry(LLVMPassRegistryRef экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        public void InitializeCore() 
		{
			LLVM.InitializeCore(this.раскрой());
		}

        public void InitializeTransformUtils()
		{
			LLVM.InitializeTransformUtils(this.раскрой());
		}

        public void InitializeScalarOpts()
		{
			LLVM.InitializeScalarOpts(this.раскрой());
		}

        public void InitializeObjCARCOpts()
		{ 
			LLVM.InitializeObjCARCOpts(this.раскрой());
		}

        public void InitializeVectorization()
		{ 
			LLVM.InitializeVectorization(this.раскрой());
		}

        public void InitializeInstCombine() 
		{
			LLVM.InitializeInstCombine(this.раскрой());
		}

        public void InitializeIPO()
		{ 
			LLVM.InitializeIPO(this.раскрой());
		}

        public void InitializeInstrumentation()
		{ 
			LLVM.InitializeInstrumentation(this.раскрой());
		}

        public void InitializeAnalysis()
		{ 
			LLVM.InitializeAnalysis(this.раскрой());
		}

        public void InitializeIPA() 
		{
			LLVM.InitializeIPA(this.раскрой());
		}

        public void InitializeCodeGen() 
		{
			LLVM.InitializeCodeGen(this.раскрой());
		}

        public void InitializeTarget() 
		{ 
			LLVM.InitializeTarget(this.раскрой());
		}
    }
