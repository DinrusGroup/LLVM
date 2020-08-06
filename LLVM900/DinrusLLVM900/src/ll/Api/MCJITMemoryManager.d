module ll.api.MCJITMemoryManager;

/*
    import AllocCodeSectionCallback = global::System.Func<global::System.ук, global::System.ук, uint, uint, string, global::System.ук>;
    import AllocDataSectionCallback = global::System.Func<global::System.ук, global::System.ук, uint, uint, string, bool, global::System.ук>;
    import FinalizeMemoryCallback = global::System.Func<global::System.ук, global::System.Tuple<int, global::System.ук>>;
*/
    public class MCJITMemoryManager : IDisposableWrapper!(LLVMMCJITMemoryManagerRef), IDisposable
    {
        this() 
		{
			this.экземпл = IWrapper!(LLVMMCJITMemoryManagerRef).ToHandleType();
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

            public int Invoke(ук opaque, out ук errMsg)
            {
                auto r = _callback(opaque);
                errMsg = r.Item2;
                return r.Item1;
            }
        }

        public static MCJITMemoryManager создай(ук opaque, AllocCodeSectionCallback allocateCodeSection, AllocDataSectionCallback allocateDataSection, FinalizeMemoryCallback finalizeMemory, Action!(ук) destroy)
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

        private LLVMMCJITMemoryManagerRef экземпл;
        private bool _disposed;
        private bool _owner;
        private LLVMMemoryManagerAllocateCodeSectionCallback _allocCodeSectionCallback;
        private LLVMMemoryManagerAllocateDataSectionCallback _allocDataSectionCallback;
        private LLVMMemoryManagerFinalizeMemoryCallback _finalizeMemoryCallback;
        private LLVMMemoryManagerDestroyCallback _destroyCallback;

        this(LLVMMCJITMemoryManagerRef экзэмпл)
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
                LLVM.DisposeMCJITMemoryManager(this.раскрой());
            }

            this._disposed = true;
        }
    }

