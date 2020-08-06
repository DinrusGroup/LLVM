module ll.api.TargetData;


    public class TargetData : IDisposableWrapper!(LLVMTargetDataRef), IDisposable
    {
       // LLVMTargetDataRef IWrapper!(LLVMTargetDataRef).ToHandleType { this.экземпл;
       // void IDisposableWrapper!(LLVMTargetDataRef).MakeHandleOwner() { this._owner = true;

        public static TargetData создай(string stringRep)
		{
			LLVM.CreateTargetData(stringRep).Wrap().MakeHandleOwner!(TargetData, LLVMTargetDataRef)();
		}

        private LLVMTargetDataRef экземпл;
        private bool _disposed;
        private bool _owner;

        this(LLVMTargetDataRef экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        ~this()
        {
            this.Dispose(false);
        }

        public string CopyStringRepOfTargetData()
		{
			return LLVM.CopyStringRepOfTargetData(this.раскрой()).MessageToString();
		}

        public LLVMByteOrdering ByteOrder ()
		{
			return LLVM.ByteOrder(this.раскрой());
		}

        public uint GetPointerSize() 
		{
			return LLVM.PointerSize(this.раскрой());
        }

        public uint GetPointerSize(uint адреснПрострво) 
		{ 
			return LLVM.PointerSizeForAS(this.раскрой(), адреснПрострво);
		}

        public Type GetIntPtrType() 
		{
			return LLVM.IntPtrType(this.раскрой()).Wrap();
		}

        public Type GetIntPtrType(uint адреснПрострво) 
		{
			return LLVM.IntPtrTypeForAS(this.раскрой(), адреснПрострво).Wrap();
		}

        public ulong SizeOfTypeInBits(Type ty) 
		{
			return LLVM.SizeOfTypeInBits(this.раскрой(), ty.раскрой());
		}
        public ulong StoreSizeOfType(Type ty)
		{
			return LLVM.StoreSizeOfType(this.раскрой(), ty.раскрой());
		}

        public ulong ABISizeOfType(Type ty)
		{
			return LLVM.ABISizeOfType(this.раскрой(), ty.раскрой());
		}

        public uint ABIAlignmentOfType(Type ty)
		{
			return LLVM.ABIAlignmentOfType(this.раскрой(), ty.раскрой());
		}

        public uint CallFrameAlignmentOfType(Type ty)
		{
			return LLVM.CallFrameAlignmentOfType(this.раскрой(), ty.раскрой());
		}

        public uint PreferredAlignmentOfType(Type ty)
		{
			return LLVM.PreferredAlignmentOfType(this.раскрой(), ty.раскрой());
		}

        public uint PreferredAlignmentOfGlobal(Значение globalVar)
		{
			return LLVM.PreferredAlignmentOfGlobal(this.раскрой(), globalVar.раскрой());
		}

        public uint ElementAtOffset(Type structTy, ulong offset) 
		{
			return LLVM.ElementAtOffset(this.раскрой(), structTy.раскрой(), offset);
		}

        public ulong OffsetOfElement(Type structTy, uint element)
		{
			LLVM.OffsetOfElement(this.раскрой(), structTy.раскрой(), element);
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
                LLVM.DisposeTargetData(this.раскрой());
            }

            this._disposed = true;
        }
    }

