module ll.api.TargetMachine;


    public class TargetMachine : IDisposableWrapper!(LLVMTargetMachineRef), IDisposable
    {
        //LLVMTargetMachineRef IWrapper!(LLVMTargetMachineRef).ToHandleType()		{ this.экземпл;}

       // void IDisposableWrapper!(LLVMTargetMachineRef).MakeHandleOwner()		{ this._owner = true;}

        private LLVMTargetMachineRef экземпл;
        private bool _disposed;
        private bool _owner;

        this(LLVMTargetMachineRef экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        ~this()
        {
            this.Dispose(false);
        }

        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (this._disposed)
            {
                return;
            }

            if (this._owner)
            {
                LLVM.DisposeTargetMachine(this.раскрой());
            }

            this._disposed = true;
        }

        public Target Target() 
		{
			return LLVM.GetTargetMachineTarget(this.раскрой()).Wrap();
		}

        public string Triple()
		{
			return LLVM.GetTargetMachineTriple(this.раскрой()).MessageToString();
		}

        public string CPU()
		{
			return LLVM.GetTargetMachineCPU(this.раскрой()).MessageToString();
		}

        public string FeatureString
		{
			return LLVM.GetTargetMachineFeatureString(this.раскрой()).MessageToString();
		}

        public void SetAsmVerbosity(bool verboseAsm)
		{
			return LLVM.SetTargetMachineAsmVerbosity(this.раскрой(), verboseAsm);
		}

        public bool EmitToFile(Модуль m, ук имяф, LLVMCodeGenFileType codegen, out ук errorMessage)
		{
			return LLVM.TargetMachineEmitToFile(this.раскрой(), m.раскрой(), имяф, codegen, out errorMessage);
		}

        public MemoryBuffer EmitToMemoryBuffer(Модуль m, LLVMCodeGenFileType codegen)
        {
            if (LLVM.TargetMachineEmitToMemoryBuffer(this.раскрой(), m.раскрой(), codegen, out ук error, out LLVMMemoryBufferRef buf).Failed())
            {
                TextUtilities.Throw(error);
            }

            return buf.Wrap();
        }

        public void AddAnalysisPasses(PassManager pm)
		{
			LLVM.AddAnalysisPasses(this.раскрой(), pm.раскрой());
		}
    }

