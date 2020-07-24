module ll.api.DiagnosticInfo;
import ll.api.DiagnosticSeverity;

    public class DiagnosticInfo : IWrapper!(LLVMDiagnosticInfoRef)
    {
        private LLVMDiagnosticInfoRef _instance;

        this()
		{
         this._instance = IWrapper!(LLVMDiagnosticInfoRef).ToHandleType();
		}
        

        this(LLVMDiagnosticInfoRef instance)
        {
            this._instance = instance;
        }

        public DiagnosticSeverity Severity()
		{ 
			return LLVM.GetDiagInfoSeverity(this.Unwrap()).Wrap();
		}

        public string Description()
		{
			LLVM.GetDiagInfoDescription(this.Unwrap()).MessageToString();
		}
    }
}
