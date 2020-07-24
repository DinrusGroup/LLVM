module ll.api.Threading;

    public static class Threading
    {
        public static bool IsMultithreaded() {return LLVM.IsMultithreaded();}
    }

