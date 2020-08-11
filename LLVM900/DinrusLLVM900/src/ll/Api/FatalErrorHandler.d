module ll.api.FatalErrorHandler;

/+

    public  class FatalErrorHandler : IDisposable
    {

        public static FatalErrorHandler Install(Action!(string) action)
		{ 
			return new FatalErrorHandler(new LLVMFatalErrorHandler(action));
		}

        public static void Reset()
		{
			LLVM.ResetFatalErrorHandler();
		}

        public static void EnablePrettyStackTrace()
		{
			LLVM.EnablePrettyStackTrace();
		}

        private  LLVMFatalErrorHandler _functionPtr;

		this(LLVMFatalErrorHandler functionPtr)
        {
            this._functionPtr = functionPtr;
            LLVM.InstallFatalErrorHandler(functionPtr);
        }

        public void Dispose()
		{ 
			LLVM.ResetFatalErrorHandler();
		}
    }

+/