module ll.api.TargetLibraryInfo;

    public class TargetLibraryInfo : IWrapper!(LLVMTargetLibraryInfoRef)
    {
        LLVMTargetLibraryInfoRef IWrapper!(LLVMTargetLibraryInfoRef).ToHandleType()
		{ 
			this._instance;
		}

        private LLVMTargetLibraryInfoRef _instance;

		this(LLVMTargetLibraryInfoRef instance)
        {
            this._instance = instance;
        }

        public void AddTargetLibraryInfo(PassManager pm)
		{
			LLVM.AddTargetLibraryInfo(this.Unwrap(), pm.Unwrap());
		}
    }
