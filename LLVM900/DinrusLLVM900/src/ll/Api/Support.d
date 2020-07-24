module ll.api.Support;

    public static class Support
    {
        public static bool LoadLibraryPermanently(string filename)
		{ 
			return LLVM.LoadLibraryPermanently(filename);
		}
        public static void ParseCommandLineOptions(int argc, string[] argv, string overview)
		{ 
			LLVM.ParseCommandLineOptions(argc, argv, overview);
		}
    }

