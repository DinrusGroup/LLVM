module ll.api.Support;

    public static class Support
    {
        public static bool LoadLibraryPermanently(string им€ф)
		{ 
			return LLVM.LoadLibraryPermanently(им€ф);
		}
        public static void ParseCommandLineOptions(int argc, string[] argv, string overview)
		{ 
			LLVM.ParseCommandLineOptions(argc, argv, overview);
		}
    }

