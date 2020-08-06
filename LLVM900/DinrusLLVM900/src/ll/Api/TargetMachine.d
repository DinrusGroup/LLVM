module ll.api.TargetMachine;


    public class TargetMachine : IDisposableWrapper!(LLVMTargetMachineRef), IDisposable
    {
        //LLVMTargetMachineRef IWrapper!(LLVMTargetMachineRef).ToHandleType()		{ this.�������;}

       // void IDisposableWrapper!(LLVMTargetMachineRef).MakeHandleOwner()		{ this._owner = true;}

        private LLVMTargetMachineRef �������;
        private bool _disposed;
        private bool _owner;

        this(LLVMTargetMachineRef �������)
        {
            this.������� = �������;
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
                LLVM.DisposeTargetMachine(this.�������());
            }

            this._disposed = true;
        }

        public Target Target() 
		{
			return LLVM.GetTargetMachineTarget(this.�������()).Wrap();
		}

        public string Triple()
		{
			return LLVM.GetTargetMachineTriple(this.�������()).MessageToString();
		}

        public string CPU()
		{
			return LLVM.GetTargetMachineCPU(this.�������()).MessageToString();
		}

        public string FeatureString
		{
			return LLVM.GetTargetMachineFeatureString(this.�������()).MessageToString();
		}

        public void SetAsmVerbosity(bool verboseAsm)
		{
			return LLVM.SetTargetMachineAsmVerbosity(this.�������(), verboseAsm);
		}

        public bool EmitToFile(������ m, �� ����, LLVMCodeGenFileType codegen, out �� errorMessage)
		{
			return LLVM.TargetMachineEmitToFile(this.�������(), m.�������(), ����, codegen, out errorMessage);
		}

        public MemoryBuffer EmitToMemoryBuffer(������ m, LLVMCodeGenFileType codegen)
        {
            if (LLVM.TargetMachineEmitToMemoryBuffer(this.�������(), m.�������(), codegen, out �� error, out LLVMMemoryBufferRef buf).Failed())
            {
                TextUtilities.Throw(error);
            }

            return buf.Wrap();
        }

        public void AddAnalysisPasses(PassManager pm)
		{
			LLVM.AddAnalysisPasses(this.�������(), pm.�������());
		}
    }

