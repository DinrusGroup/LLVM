module ll.api.MCJITMemoryManager;

/*
    import AllocCodeSectionCallback = global::System.Func<global::System.��, global::System.��, uint, uint, string, global::System.��>;
    import AllocDataSectionCallback = global::System.Func<global::System.��, global::System.��, uint, uint, string, bool, global::System.��>;
    import FinalizeMemoryCallback = global::System.Func<global::System.��, global::System.Tuple<int, global::System.��>>;
*/
    public class MCJITMemoryManager : IDisposableWrapper!(LLVMMCJITMemoryManagerRef), IDisposable
    {
        this() 
		{
			this.������� = IWrapper!(LLVMMCJITMemoryManagerRef).ToHandleType();
		}

        void IDisposableWrapper!(LLVMMCJITMemoryManagerRef).MakeHandleOwner()
		{
			this._owner = true;
		}

        private class MemoryManagerFinalizeMemoryClosure
        {
            private FinalizeMemoryCallback _callback;

            public MemoryManagerFinalizeMemoryClosure(FinalizeMemoryCallback callback)
            {
                this._callback = callback;
            }

            public int Invoke(�� opaque, out �� errMsg)
            {
                auto r = _callback(opaque);
                errMsg = r.Item2;
                return r.Item1;
            }
        }

        public static MCJITMemoryManager ������(�� opaque, AllocCodeSectionCallback allocateCodeSection, AllocDataSectionCallback allocateDataSection, FinalizeMemoryCallback finalizeMemory, Action!(��) destroy)
        {
            auto allocCodeSectionCallback = new LLVMMemoryManagerAllocateCodeSectionCallback(allocateCodeSection);
            auto allocDataSectionCallback = new LLVMMemoryManagerAllocateDataSectionCallback((a, b, c, d, e, f) { allocateDataSection(a, b, c, d, e, f));
            auto finalizeMemoryCallback = new LLVMMemoryManagerFinalizeMemoryCallback(new MemoryManagerFinalizeMemoryClosure(finalizeMemory).Invoke);
            auto destroyCallback = new LLVMMemoryManagerDestroyCallback(destroy);
            auto memoryManager = LLVM.CreateSimpleMCJITMemoryManager(opaque, allocCodeSectionCallback, allocDataSectionCallback, finalizeMemoryCallback, destroyCallback)
                                    .Wrap()
                                    .MakeHandleOwner!(MCJITMemoryManager, LLVMMCJITMemoryManagerRef)();
            memoryManager._allocCodeSectionCallback = allocCodeSectionCallback;
            memoryManager._allocDataSectionCallback = allocDataSectionCallback;
            memoryManager._finalizeMemoryCallback = finalizeMemoryCallback;
            memoryManager._destroyCallback = destroyCallback;
            return memoryManager;
        }

        private LLVMMCJITMemoryManagerRef �������;
        private bool _disposed;
        private bool _owner;
        private LLVMMemoryManagerAllocateCodeSectionCallback _allocCodeSectionCallback;
        private LLVMMemoryManagerAllocateDataSectionCallback _allocDataSectionCallback;
        private LLVMMemoryManagerFinalizeMemoryCallback _finalizeMemoryCallback;
        private LLVMMemoryManagerDestroyCallback _destroyCallback;

        this(LLVMMCJITMemoryManagerRef �������)
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
                LLVM.DisposeMCJITMemoryManager(this.�������());
            }

            this._disposed = true;
        }
    }

