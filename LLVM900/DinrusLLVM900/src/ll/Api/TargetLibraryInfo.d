module ll.api.TargetLibraryInfo;

    public class TargetLibraryInfo : IWrapper!(LLVMTargetLibraryInfoRef)
    {
       // LLVMTargetLibraryInfoRef IWrapper!(LLVMTargetLibraryInfoRef).ToHandleType(){ this.экземпл;
		

        private LLVMTargetLibraryInfoRef экземпл;

		this(LLVMTargetLibraryInfoRef экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        public void AddTargetLibraryInfo(PassManager pm)
		{
			LLVM.AddTargetLibraryInfo(this.раскрой(), pm.раскрой());
		}
    }
