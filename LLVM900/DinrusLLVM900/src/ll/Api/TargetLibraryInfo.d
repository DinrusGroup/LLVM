module ll.api.TargetLibraryInfo;

    public class TargetLibraryInfo : IWrapper!(LLVMTargetLibraryInfoRef)
    {
       // LLVMTargetLibraryInfoRef IWrapper!(LLVMTargetLibraryInfoRef).ToHandleType(){ this.�������;
		

        private LLVMTargetLibraryInfoRef �������;

		this(LLVMTargetLibraryInfoRef �������)
        {
            this.������� = �������;
        }

        public void AddTargetLibraryInfo(PassManager pm)
		{
			LLVM.AddTargetLibraryInfo(this.�������(), pm.�������());
		}
    }
