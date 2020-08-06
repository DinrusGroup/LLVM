module ll.api.TargetData;


    public class TargetData : IDisposableWrapper!(LLVMTargetDataRef), IDisposable
    {
       // LLVMTargetDataRef IWrapper!(LLVMTargetDataRef).ToHandleType { this.�������;
       // void IDisposableWrapper!(LLVMTargetDataRef).MakeHandleOwner() { this._owner = true;

        public static TargetData ������(string stringRep)
		{
			LLVM.CreateTargetData(stringRep).Wrap().MakeHandleOwner!(TargetData, LLVMTargetDataRef)();
		}

        private LLVMTargetDataRef �������;
        private bool _disposed;
        private bool _owner;

        this(LLVMTargetDataRef �������)
        {
            this.������� = �������;
        }

        ~this()
        {
            this.Dispose(false);
        }

        public string CopyStringRepOfTargetData()
		{
			return LLVM.CopyStringRepOfTargetData(this.�������()).MessageToString();
		}

        public LLVMByteOrdering ByteOrder ()
		{
			return LLVM.ByteOrder(this.�������());
		}

        public uint GetPointerSize() 
		{
			return LLVM.PointerSize(this.�������());
        }

        public uint GetPointerSize(uint ��������������) 
		{ 
			return LLVM.PointerSizeForAS(this.�������(), ��������������);
		}

        public Type GetIntPtrType() 
		{
			return LLVM.IntPtrType(this.�������()).Wrap();
		}

        public Type GetIntPtrType(uint ��������������) 
		{
			return LLVM.IntPtrTypeForAS(this.�������(), ��������������).Wrap();
		}

        public ulong SizeOfTypeInBits(Type ty) 
		{
			return LLVM.SizeOfTypeInBits(this.�������(), ty.�������());
		}
        public ulong StoreSizeOfType(Type ty)
		{
			return LLVM.StoreSizeOfType(this.�������(), ty.�������());
		}

        public ulong ABISizeOfType(Type ty)
		{
			return LLVM.ABISizeOfType(this.�������(), ty.�������());
		}

        public uint ABIAlignmentOfType(Type ty)
		{
			return LLVM.ABIAlignmentOfType(this.�������(), ty.�������());
		}

        public uint CallFrameAlignmentOfType(Type ty)
		{
			return LLVM.CallFrameAlignmentOfType(this.�������(), ty.�������());
		}

        public uint PreferredAlignmentOfType(Type ty)
		{
			return LLVM.PreferredAlignmentOfType(this.�������(), ty.�������());
		}

        public uint PreferredAlignmentOfGlobal(�������� globalVar)
		{
			return LLVM.PreferredAlignmentOfGlobal(this.�������(), globalVar.�������());
		}

        public uint ElementAtOffset(Type structTy, ulong offset) 
		{
			return LLVM.ElementAtOffset(this.�������(), structTy.�������(), offset);
		}

        public ulong OffsetOfElement(Type structTy, uint element)
		{
			LLVM.OffsetOfElement(this.�������(), structTy.�������(), element);
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
                LLVM.DisposeTargetData(this.�������());
            }

            this._disposed = true;
        }
    }

