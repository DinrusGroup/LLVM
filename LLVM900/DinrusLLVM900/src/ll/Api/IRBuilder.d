module ll.api.IRBuilder;


    public class IRBuilder : IDisposable, IEquatable!(IRBuilder), IDisposableWrapper!(LLVMBuilderRef)
    {
        LLVMBuilderRef IWrapper!(LLVMBuilderRef).ToHandleType
		{
			this.экземпл;
		}

        void IDisposableWrapper!(LLVMBuilderRef).MakeHandleOwner() 
	     { 
		    this._owner = true;
	     }

        public static IRBuilder создай() 
		{
			return LLVM.CreateBuilder().Wrap().MakeHandleOwner!(IRBuilder, LLVMBuilderRef)();
		}

        public static IRBuilder создай(Context контекст)
		{ 
			return LLVM.CreateBuilderInContext(контекст.раскрой()).Wrap().MakeHandleOwner!(IRBuilder, LLVMBuilderRef)();
		}

        private  LLVMBuilderRef экземпл;
        private bool _disposed;
        private bool _owner;

        this(LLVMBuilderRef builderRef)
        {
            this.экземпл = builderRef;
        }

        ~this()
        {
            this.Dispose(false);
        }

        public void PositionBuilder(BasicBlock block, Instruction instr)
		{ 
			LLVM.PositionBuilder(this.раскрой(), block.раскрой!(LLVMBasicBlockRef)(), instr.раскрой());
		}

        public void PositionBuilderBefore(Instruction instr)
		{
			LLVM.PositionBuilderBefore(this.раскрой(), instr.раскрой());
		}

        public void PositionBuilderAtEnd(BasicBlock block)
		{ 
			LLVM.PositionBuilderAtEnd(this.раскрой(), block.раскрой!(LLVMBasicBlockRef)());
		}

        public BasicBlock GetInsertBlock()
		{
			return LLVM.GetInsertBlock(this.раскрой()).Wrap();
         }

        public void ClearInsertionPosition()
		{ 
			LLVM.ClearInsertionPosition(this.раскрой());
		}

        public void InsertIntoBuilder(Instruction instr) 
		{ 
			LLVM.InsertIntoBuilder(this.раскрой(), instr.раскрой());
		}

        public void InsertIntoBuilder(Instruction instr, string имя = "")
		{
			LLVM.InsertIntoBuilderWithName(this.раскрой(), instr.раскрой(), имя);
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
                LLVM.DisposeBuilder(this.экземпл);
            }

            this._disposed = true;
        }

        public Значение CurrentDebugLocation()
        {
            get { LLVM.GetCurrentDebugLocation(this.раскрой()).Wrap();
            set { LLVM.SetCurrentDebugLocation(this.раскрой(), значение.раскрой());
        }

        public void SetInstDebugLocation(Instruction inst)
		{ 
			LLVM.SetInstDebugLocation(this.раскрой(), inst.раскрой());
		}

        public ReturnInst CreateRetVoid() 
		{ 
			return LLVM.BuildRetVoid(this.раскрой()).WrapAs!(ReturnInst)();
		}

        public ReturnInst CreateRet(Значение v)
		{ 
			return LLVM.BuildRet(this.раскрой(), v.раскрой()).WrapAs!(ReturnInst)();
        }

        public ReturnInst CreateAggregateRet(Значение[] retVals)
		{ 
			return LLVM.BuildAggregateRet(this.раскрой(), retVals.раскрой()).WrapAs!(ReturnInst)();
	    }

        public BranchInst CreateBr(BasicBlock dest)
		{ 
			return LLVM.BuildBr(this.раскрой(), dest.раскрой!(LLVMBasicBlockRef)()).WrapAs!(BranchInst)();
		}

        public BranchInst CreateCondBr(Значение If, BasicBlock then, BasicBlock Else)
		{ 
			return LLVM.BuildCondBr(this.раскрой(), If.раскрой(), then.раскрой!(LLVMBasicBlockRef)(), Else.раскрой!(LLVMBasicBlockRef)()).WrapAs!(BranchInst)();
		}

        public SwitchInst CreateSwitch(Значение v, BasicBlock Else, uint numCases)
		{ 
			return LLVM.BuildSwitch(this.раскрой(), v.раскрой(), Else.раскрой!(LLVMBasicBlockRef)(), numCases).WrapAs!(SwitchInst)();
		}

        public IndirectBrInst CreateIndirectBr(Значение addr, uint numDests)
		{ 
			return LLVM.BuildIndirectBr(this.раскрой(), addr.раскрой(), numDests).WrapAs!(IndirectBrInst)();
		}

        public InvokeInst CreateInvoke(Значение fn, Значение[] args, BasicBlock then, BasicBlock Catch, string имя = "")
		{ 
			return LLVM.BuildInvoke(this.раскрой(), fn.раскрой(), args.раскрой(), then.раскрой!(LLVMBasicBlockRef)(), Catch.раскрой!(LLVMBasicBlockRef)(), имя).WrapAs!(InvokeInst)();
		}

        public LandingPadInst CreateLandingPad(Type ty, Значение persFn, uint numClauses, string имя = "")
		{ 
			return LLVM.BuildLandingPad(this.раскрой(), ty.раскрой(), persFn.раскрой(), numClauses, имя).WrapAs!(LandingPadInst)();  
		}

        public ResumeInst CreateResume(Значение exn)
		{ 
			return LLVM.BuildResume(this.раскрой(), exn.раскрой()).WrapAs!(ResumeInst)();
		}

        public НедоступнИнстр CreateUnreachable() 
		{
			return LLVM.BuildUnreachable(this.раскрой()).WrapAs!(НедоступнИнстр)();
		}

        public Значение CreateAdd(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNSWAdd(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildNSWAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNUWAdd(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildNUWAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFAdd(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildFAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateSub(Значение lhs, Значение rhs, string имя = "") 
		{
			return LLVM.BuildSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNSWSub(Значение lhs, Значение rhs, string имя = "") 
		{
			LLVM.BuildNSWSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNUWSub(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildNUWSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFSub(Значение lhs, Значение rhs, string имя = "") 
		{ 
			return LLVM.BuildFSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateMul(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNSWMul(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildNSWMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNUWMul(Значение lhs, Значение rhs, string имя = "") 
		{
			return LLVM.BuildNUWMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFMul(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildFMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateUDiv(Значение lhs, Значение rhs, string имя = "") 
		{
			return LLVM.BuildUDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateExactUDiv(Значение lhs, Значение rhs, string имя = "") 
		{
			return LLVM.BuildExactUDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateSDiv(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildSDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateExactSDiv(Значение lhs, Значение rhs, string имя = "") 
		{ 
			return LLVM.BuildExactSDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFDiv(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildFDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateURem(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildURem(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
         }

        public Значение CreateSRem(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildSRem(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFRem(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildFRem(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateShl(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildShl(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateLShr(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildLShr(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateAShr(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildAShr(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateAnd(Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildAnd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateOr(Значение lhs, Значение rhs, string имя = "") 
		{ 
			return LLVM.BuildOr(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateXor(Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildXor(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateBinOp(Opcode op, Значение lhs, Значение rhs, string имя = "")
		{
			return LLVM.BuildBinOp(this.раскрой(), op.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNeg(Значение v, string имя = "") 
		{
			return LLVM.BuildNeg(this.раскрой(), v.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNSWNeg(Значение v, string имя = "")
		{
			return LLVM.BuildNSWNeg(this.раскрой(), v.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNUWNeg(Значение v, string имя = "")
		{ 
			return LLVM.BuildNUWNeg(this.раскрой(), v.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFNeg(Значение v, string имя = "") 
		{
			return LLVM.BuildFNeg(this.раскрой(), v.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateNot(Значение v, string имя = "")
		{
			return LLVM.BuildNot(this.раскрой(), v.раскрой(), имя).WrapAs!(Значение)();
		}

        public CallInst CreateMalloc(Type ty, string имя = "")
		{ 
			return LLVM.BuildMalloc(this.раскрой(), ty.раскрой(), имя).WrapAs!(CallInst)();
		}

        public CallInst CreateArrayMalloc(Type ty, Значение val, string имя = "")
		{
			return return LLVM.BuildArrayMalloc(this.раскрой(), ty.раскрой(), val.раскрой(), имя).WrapAs!(CallInst)();
		}

        public AllocaInst CreateAlloca(Type ty, string имя = "") 
		{
			return LLVM.BuildAlloca(this.раскрой(), ty.раскрой(), имя).WrapAs!(AllocaInst)();
		}

        public AllocaInst CreateArrayAlloca(Type ty, Значение val, string имя = "")
		{ 
			return LLVM.BuildArrayAlloca(this.раскрой(), ty.раскрой(), val.раскрой(), имя).WrapAs!(AllocaInst)();
		}

        public CallInst CreateFree(Значение pointerVal)
		{ 
			return LLVM.BuildFree(this.раскрой(), pointerVal.раскрой()).WrapAs!(CallInst)();
		}

        public LoadInst CreateLoad(Значение pointerVal, string имя = "")
		{
			return LLVM.BuildLoad(this.раскрой(), pointerVal.раскрой(), имя).WrapAs!(LoadInst)();
		}

        public StoreInst CreateStore(Значение val, Значение ptr) 
		{ 
			return LLVM.BuildStore(this.раскрой(), val.раскрой(), ptr.раскрой()).WrapAs!(StoreInst)();
		}

        public Значение CreateGEP(Значение pointer, Значение[] indices, string имя = "") 
		{ 
			return LLVM.BuildGEP(this.раскрой(), pointer.раскрой(), indices.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateInBoundsGEP(Значение pointer, Значение[] indices, string имя = "")
		{
			return LLVM.BuildInBoundsGEP(this.раскрой(), pointer.раскрой(), indices.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateStructGEP(Значение pointer, uint idx, string имя = "")
		{ 
			return LLVM.BuildStructGEP(this.раскрой(), pointer.раскрой(), idx, имя).WrapAs!(Значение)();
		}

        public Значение CreateGlobalString(string str, string имя = "")
		{
			return LLVM.BuildGlobalString(this.раскрой(), str, имя).WrapAs!(Значение)();
		}

        public Значение CreateGlobalStringPtr(string str, string имя = "")
		{
			return LLVM.BuildGlobalStringPtr(this.раскрой(), str, имя).WrapAs!(Значение)();
		}

        public Значение CreateTrunc(Значение val, Type destTy, string имя = "")
		{
			return LLVM.BuildTrunc(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateZExt(Значение val, Type destTy, string имя = "") 
		{
			return LLVM.BuildZExt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateSExt(Значение val, Type destTy, string имя = "")
		{
			return LLVM.BuildSExt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateZExtOrBitCast(Значение val, Type destTy, string имя = "")
		{ 
			return LLVM.BuildZExtOrBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateSExtOrBitCast(Значение val, Type destTy, string имя = "") 
		{ 
			return LLVM.BuildSExtOrBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFPToUI(Значение val, Type destTy, string имя = "")
		{
			return LLVM.BuildFPToUI(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFPToSI(Значение val, Type destTy, string имя = "") 
		{
			return LLVM.BuildFPToSI(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateUIToFP(Значение val, Type destTy, string имя = "") 
		{
			return LLVM.BuildUIToFP(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateSIToFP(Значение val, Type destTy, string имя = "")
		{
			return LLVM.BuildSIToFP(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFPTrunc(Значение val, Type destTy, string имя = "")
		{
			return LLVM.BuildFPTrunc(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFPExt(Значение val, Type destTy, string имя = "") 
		{
			return LLVM.BuildFPExt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreatePtrToInt(Значение val, Type destTy, string имя = "")
		{
			return LLVM.BuildPtrToInt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateIntToPtr(Значение val, Type destTy, string имя = "") 
		{ 
			return LLVM.BuildIntToPtr(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateBitCast(Значение val, Type destTy, string имя = "")
		{ 
			return LLVM.BuildBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateAddrSpaceCast(Значение val, Type destTy, string имя = "") 
		{
			return LLVM.BuildAddrSpaceCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateTruncOrBitCast(Значение val, Type destTy, string имя = "")
		{ 
			return LLVM.BuildTruncOrBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateCast(Opcode op, Значение val, Type destTy, string имя = "")
		{ 
			return LLVM.BuildCast(this.раскрой(), op.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreatePointerCast(Значение val, Type destTy, string имя = "") 
		{
			return LLVM.BuildPointerCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateIntCast(Значение val, Type destTy, string имя = "")
		{
			LLVM.BuildIntCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFPCast(Значение val, Type destTy, string имя = "")
		{
			return LLVM.BuildFPCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateICmp(ЛЛЦелПредикат op, Значение lhs, Значение rhs, string имя = "") 
		{ 
			return LLVM.BuildICmp(this.раскрой(), op.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateICmpEQ(Значение lhs, Значение rhs, string имя = "")
		{ 
			return this.CreateICmp(ЛЛЦелПредикат.EQ, lhs, rhs, имя);
		}

        public Значение CreateICmpNE(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.NE, lhs, rhs, имя);
		}

        public Значение CreateICmpUGT(Значение lhs, Значение rhs, string имя = "")
		{
			this.CreateICmp(ЛЛЦелПредикат.UGT, lhs, rhs, имя);
		}

        public Значение CreateICmpULT(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.ULT, lhs, rhs, имя);
		}

        public Значение CreateICmpULE(Значение lhs, Значение rhs, string имя = "") 
		{ 
			return this.CreateICmp(ЛЛЦелПредикат.ULE, lhs, rhs, имя);
		}

        public Значение CreateICmpSGT(Значение lhs, Значение rhs, string имя = "") 
		{
			return this.CreateICmp(ЛЛЦелПредикат.SGT, lhs, rhs, имя);
		}

        public Значение CreateICmpSGE(Значение lhs, Значение rhs, string имя = "") 
		{
			return this.CreateICmp(ЛЛЦелПредикат.SGE, lhs, rhs, имя);
		}

        public Значение CreateICmpSLT(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.SLT, lhs, rhs, имя);
		}

        public Значение CreateICmpSLE(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.SLE, lhs, rhs, имя);
		}

        public Значение CreateFCmp(ЛЛПредикатРеала op, Значение lhs, Значение rhs, string имя = "")
		{ 
			return LLVM.BuildFCmp(this.раскрой(), op.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateFCmpOEQ(Значение lhs, Значение rhs, string имя = "") 
		{ 
			return this.CreateFCmp(ЛЛПредикатРеала.OEQ, lhs, rhs, имя);
		}

        public Значение CreateFCmpOGT(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OGT, lhs, rhs, имя);
		}

        public Значение CreateFCmpOGE(Значение lhs, Значение rhs, string имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OGE, lhs, rhs, имя);
		}

        public Значение CreateFCmpOLT(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OLT, lhs, rhs, имя);
		}

        public Значение CreateFCmpOLE(Значение lhs, Значение rhs, string имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OLE, lhs, rhs, имя);
		}

        public Значение CreateFCmpONE(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.ONE, lhs, rhs, имя);
		}

        public Значение CreateFCmpORD(Значение lhs, Значение rhs, string имя = "")
		{
			this.CreateFCmp(ЛЛПредикатРеала.ORD, lhs, rhs, имя);
		}

        public Значение CreateFCmpUNO(Значение lhs, Значение rhs, string имя = "")
		{ 
			return this.CreateFCmp(ЛЛПредикатРеала.UNO, lhs, rhs, имя);
		}

        public Значение CreateFCmpUEQ(Значение lhs, Значение rhs, string имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.UEQ, lhs, rhs, имя);
		}

        public Значение CreateFCmpUGT(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.UGT, lhs, rhs, имя);
		}

        public Значение CreateFCmpUGE(Значение lhs, Значение rhs, string имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.UGE, lhs, rhs, имя);
		}

        public Значение CreateFCmpULT(Значение lhs, Значение rhs, string имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.ULT, lhs, rhs, имя);
		}

        public Значение CreateFCmpUNE(Значение lhs, Значение rhs, string имя = "")
		{ 
			return this.CreateFCmp(ЛЛПредикатРеала.UNE, lhs, rhs, имя);
		}

        public PHINode CreatePhi(Type ty, string имя = "")
		{
			return LLVM.BuildPhi(this.раскрой(), ty.раскрой(), имя).WrapAs!(PHINode)();
		}

        public CallInst CreateCall(Значение fn, Значение[] args, string имя) 
		{ 
			return LLVM.BuildCall(this.раскрой(), fn.раскрой(), args.раскрой(), имя).WrapAs!(CallInst)();
		}

        public CallInst CreateCall(Значение fn, string имя, params Значение[] args)
		{
			return this.CreateCall(fn, args, имя);
		}

        public CallInst CreateCall(Значение fn, params Значение[] args) 
		{ 
			return this.CreateCall(fn, args, string.Empty);
		}

        public Значение CreateSelect(Значение @If, Значение then, Значение @Else, string имя = "")
		{
			return LLVM.BuildSelect(this.раскрой(), If.раскрой(), then.раскрой(), Else.раскрой(), имя).WrapAs!(Значение)();
		}

        public VAArgInst CreateVAArg(Значение list, Type ty, string имя = "")
		{
			return LLVM.BuildVAArg(this.раскрой(), list.раскрой(), ty.раскрой(), имя).WrapAs!(VAArgInst)();
		}

        public Значение CreateExtractElement(Значение vecVal, Значение индекс, string имя = "")
		{
			return LLVM.BuildExtractElement(this.раскрой(), vecVal.раскрой(), индекс.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateInsertElement(Значение vecVal, Значение eltVal, Значение индекс, string имя = "")
		{ 
			return LLVM.BuildInsertElement(this.раскрой(), vecVal.раскрой(), eltVal.раскрой(), индекс.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateShuffleVector(Значение v1, Значение v2, Значение mask, string имя = "")
		{ 
			return LLVM.BuildShuffleVector(this.раскрой(), v1.раскрой(), v2.раскрой(), mask.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateExtractValue(Значение aggVal, uint индекс, string имя = "") 
		{ 
			return LLVM.BuildExtractValue(this.раскрой(), aggVal.раскрой(), индекс, имя).WrapAs!(Значение)();
		}

        public Значение CreateInsertValue(Значение aggVal, Значение eltVal, uint индекс, string имя = "") 
		{ 
			return LLVM.BuildInsertValue(this.раскрой(), aggVal.раскрой(), eltVal.раскрой(), индекс, имя).WrapAs!(Значение)();
		}

        public Значение CreateIsNull(Значение val, string имя = "")
		{ 
			return LLVM.BuildIsNull(this.раскрой(), val.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreateIsNotNull(Значение val, string имя = "")
		{
			return LLVM.BuildIsNotNull(this.раскрой(), val.раскрой(), имя).WrapAs!(Значение)();
		}

        public Значение CreatePtrDiff(Значение lhs, Значение rhs, string имя = "") 
		{
			return LLVM.BuildPtrDiff(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя).WrapAs!(Значение)();
		}

        public FenceInst CreateFence(AtomicOrdering ordering, bool singleThread, string имя = "")
		{ 
			return LLVM.BuildFence(this.раскрой(), ordering.раскрой(), singleThread, имя).WrapAs!(FenceInst)();
		}

        public AtomicRMWInst CreateAtomicRMW(AtomicRMWBinOp op, Значение ptr, Значение val, AtomicOrdering ordering, bool singleThread) 
		{
			return LLVM.BuildAtomicRMW(this.раскрой(), op.раскрой(), ptr.раскрой(), val.раскрой(), ordering.раскрой(), singleThread).WrapAs!(AtomicRMWInst)();
		}

        public bool Equals(IRBuilder other) 
		{
			return ReferenceEquals(other, null) ? false : this.экземпл == other.экземпл;
		}

        public override bool Equals(object obj) 
		{ 
			return this.Equals(obj as IRBuilder);
		}

        public static bool operator ==(IRBuilder op1, IRBuilder op2)
		{ 
			return ReferenceEquals(op1, null) ? ReferenceEquals(op2, null) : op1.Equals(op2);
		}

        public static bool operator !=(IRBuilder op1, IRBuilder op2)
		{
			return !(op1 == op2);
		}

        public override int GetHashCode() 
		{
			return this.экземпл.GetHashCode();
		}
    }
  }
}