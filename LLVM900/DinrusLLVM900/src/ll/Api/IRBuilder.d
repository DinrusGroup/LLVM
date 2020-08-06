module ll.api.IRBuilder;


    public class IRBuilder : IDisposable, IEquatable!(IRBuilder), IDisposableWrapper!(LLVMBuilderRef)
    {
        LLVMBuilderRef IWrapper!(LLVMBuilderRef).ToHandleType
		{
			this.�������;
		}

        void IDisposableWrapper!(LLVMBuilderRef).MakeHandleOwner() 
	     { 
		    this._owner = true;
	     }

        public static IRBuilder ������() 
		{
			return LLVM.CreateBuilder().Wrap().MakeHandleOwner!(IRBuilder, LLVMBuilderRef)();
		}

        public static IRBuilder ������(Context ��������)
		{ 
			return LLVM.CreateBuilderInContext(��������.�������()).Wrap().MakeHandleOwner!(IRBuilder, LLVMBuilderRef)();
		}

        private  LLVMBuilderRef �������;
        private bool _disposed;
        private bool _owner;

        this(LLVMBuilderRef builderRef)
        {
            this.������� = builderRef;
        }

        ~this()
        {
            this.Dispose(false);
        }

        public void PositionBuilder(BasicBlock block, Instruction instr)
		{ 
			LLVM.PositionBuilder(this.�������(), block.�������!(LLVMBasicBlockRef)(), instr.�������());
		}

        public void PositionBuilderBefore(Instruction instr)
		{
			LLVM.PositionBuilderBefore(this.�������(), instr.�������());
		}

        public void PositionBuilderAtEnd(BasicBlock block)
		{ 
			LLVM.PositionBuilderAtEnd(this.�������(), block.�������!(LLVMBasicBlockRef)());
		}

        public BasicBlock GetInsertBlock()
		{
			return LLVM.GetInsertBlock(this.�������()).Wrap();
         }

        public void ClearInsertionPosition()
		{ 
			LLVM.ClearInsertionPosition(this.�������());
		}

        public void InsertIntoBuilder(Instruction instr) 
		{ 
			LLVM.InsertIntoBuilder(this.�������(), instr.�������());
		}

        public void InsertIntoBuilder(Instruction instr, string ��� = "")
		{
			LLVM.InsertIntoBuilderWithName(this.�������(), instr.�������(), ���);
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
                LLVM.DisposeBuilder(this.�������);
            }

            this._disposed = true;
        }

        public �������� CurrentDebugLocation()
        {
            get { LLVM.GetCurrentDebugLocation(this.�������()).Wrap();
            set { LLVM.SetCurrentDebugLocation(this.�������(), ��������.�������());
        }

        public void SetInstDebugLocation(Instruction inst)
		{ 
			LLVM.SetInstDebugLocation(this.�������(), inst.�������());
		}

        public ReturnInst CreateRetVoid() 
		{ 
			return LLVM.BuildRetVoid(this.�������()).WrapAs!(ReturnInst)();
		}

        public ReturnInst CreateRet(�������� v)
		{ 
			return LLVM.BuildRet(this.�������(), v.�������()).WrapAs!(ReturnInst)();
        }

        public ReturnInst CreateAggregateRet(��������[] retVals)
		{ 
			return LLVM.BuildAggregateRet(this.�������(), retVals.�������()).WrapAs!(ReturnInst)();
	    }

        public BranchInst CreateBr(BasicBlock dest)
		{ 
			return LLVM.BuildBr(this.�������(), dest.�������!(LLVMBasicBlockRef)()).WrapAs!(BranchInst)();
		}

        public BranchInst CreateCondBr(�������� If, BasicBlock then, BasicBlock Else)
		{ 
			return LLVM.BuildCondBr(this.�������(), If.�������(), then.�������!(LLVMBasicBlockRef)(), Else.�������!(LLVMBasicBlockRef)()).WrapAs!(BranchInst)();
		}

        public SwitchInst CreateSwitch(�������� v, BasicBlock Else, uint numCases)
		{ 
			return LLVM.BuildSwitch(this.�������(), v.�������(), Else.�������!(LLVMBasicBlockRef)(), numCases).WrapAs!(SwitchInst)();
		}

        public IndirectBrInst CreateIndirectBr(�������� addr, uint numDests)
		{ 
			return LLVM.BuildIndirectBr(this.�������(), addr.�������(), numDests).WrapAs!(IndirectBrInst)();
		}

        public InvokeInst CreateInvoke(�������� fn, ��������[] args, BasicBlock then, BasicBlock Catch, string ��� = "")
		{ 
			return LLVM.BuildInvoke(this.�������(), fn.�������(), args.�������(), then.�������!(LLVMBasicBlockRef)(), Catch.�������!(LLVMBasicBlockRef)(), ���).WrapAs!(InvokeInst)();
		}

        public LandingPadInst CreateLandingPad(Type ty, �������� persFn, uint numClauses, string ��� = "")
		{ 
			return LLVM.BuildLandingPad(this.�������(), ty.�������(), persFn.�������(), numClauses, ���).WrapAs!(LandingPadInst)();  
		}

        public ResumeInst CreateResume(�������� exn)
		{ 
			return LLVM.BuildResume(this.�������(), exn.�������()).WrapAs!(ResumeInst)();
		}

        public �������������� CreateUnreachable() 
		{
			return LLVM.BuildUnreachable(this.�������()).WrapAs!(��������������)();
		}

        public �������� CreateAdd(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildAdd(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNSWAdd(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildNSWAdd(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNUWAdd(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildNUWAdd(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFAdd(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildFAdd(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateSub(�������� lhs, �������� rhs, string ��� = "") 
		{
			return LLVM.BuildSub(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNSWSub(�������� lhs, �������� rhs, string ��� = "") 
		{
			LLVM.BuildNSWSub(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNUWSub(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildNUWSub(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFSub(�������� lhs, �������� rhs, string ��� = "") 
		{ 
			return LLVM.BuildFSub(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateMul(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildMul(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNSWMul(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildNSWMul(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNUWMul(�������� lhs, �������� rhs, string ��� = "") 
		{
			return LLVM.BuildNUWMul(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFMul(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildFMul(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateUDiv(�������� lhs, �������� rhs, string ��� = "") 
		{
			return LLVM.BuildUDiv(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateExactUDiv(�������� lhs, �������� rhs, string ��� = "") 
		{
			return LLVM.BuildExactUDiv(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateSDiv(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildSDiv(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateExactSDiv(�������� lhs, �������� rhs, string ��� = "") 
		{ 
			return LLVM.BuildExactSDiv(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFDiv(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildFDiv(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateURem(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildURem(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
         }

        public �������� CreateSRem(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildSRem(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFRem(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildFRem(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateShl(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildShl(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateLShr(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildLShr(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateAShr(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildAShr(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateAnd(�������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildAnd(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateOr(�������� lhs, �������� rhs, string ��� = "") 
		{ 
			return LLVM.BuildOr(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateXor(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildXor(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateBinOp(Opcode op, �������� lhs, �������� rhs, string ��� = "")
		{
			return LLVM.BuildBinOp(this.�������(), op.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNeg(�������� v, string ��� = "") 
		{
			return LLVM.BuildNeg(this.�������(), v.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNSWNeg(�������� v, string ��� = "")
		{
			return LLVM.BuildNSWNeg(this.�������(), v.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNUWNeg(�������� v, string ��� = "")
		{ 
			return LLVM.BuildNUWNeg(this.�������(), v.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFNeg(�������� v, string ��� = "") 
		{
			return LLVM.BuildFNeg(this.�������(), v.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateNot(�������� v, string ��� = "")
		{
			return LLVM.BuildNot(this.�������(), v.�������(), ���).WrapAs!(��������)();
		}

        public CallInst CreateMalloc(Type ty, string ��� = "")
		{ 
			return LLVM.BuildMalloc(this.�������(), ty.�������(), ���).WrapAs!(CallInst)();
		}

        public CallInst CreateArrayMalloc(Type ty, �������� val, string ��� = "")
		{
			return return LLVM.BuildArrayMalloc(this.�������(), ty.�������(), val.�������(), ���).WrapAs!(CallInst)();
		}

        public AllocaInst CreateAlloca(Type ty, string ��� = "") 
		{
			return LLVM.BuildAlloca(this.�������(), ty.�������(), ���).WrapAs!(AllocaInst)();
		}

        public AllocaInst CreateArrayAlloca(Type ty, �������� val, string ��� = "")
		{ 
			return LLVM.BuildArrayAlloca(this.�������(), ty.�������(), val.�������(), ���).WrapAs!(AllocaInst)();
		}

        public CallInst CreateFree(�������� pointerVal)
		{ 
			return LLVM.BuildFree(this.�������(), pointerVal.�������()).WrapAs!(CallInst)();
		}

        public LoadInst CreateLoad(�������� pointerVal, string ��� = "")
		{
			return LLVM.BuildLoad(this.�������(), pointerVal.�������(), ���).WrapAs!(LoadInst)();
		}

        public StoreInst CreateStore(�������� val, �������� ptr) 
		{ 
			return LLVM.BuildStore(this.�������(), val.�������(), ptr.�������()).WrapAs!(StoreInst)();
		}

        public �������� CreateGEP(�������� pointer, ��������[] indices, string ��� = "") 
		{ 
			return LLVM.BuildGEP(this.�������(), pointer.�������(), indices.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateInBoundsGEP(�������� pointer, ��������[] indices, string ��� = "")
		{
			return LLVM.BuildInBoundsGEP(this.�������(), pointer.�������(), indices.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateStructGEP(�������� pointer, uint idx, string ��� = "")
		{ 
			return LLVM.BuildStructGEP(this.�������(), pointer.�������(), idx, ���).WrapAs!(��������)();
		}

        public �������� CreateGlobalString(string str, string ��� = "")
		{
			return LLVM.BuildGlobalString(this.�������(), str, ���).WrapAs!(��������)();
		}

        public �������� CreateGlobalStringPtr(string str, string ��� = "")
		{
			return LLVM.BuildGlobalStringPtr(this.�������(), str, ���).WrapAs!(��������)();
		}

        public �������� CreateTrunc(�������� val, Type destTy, string ��� = "")
		{
			return LLVM.BuildTrunc(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateZExt(�������� val, Type destTy, string ��� = "") 
		{
			return LLVM.BuildZExt(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateSExt(�������� val, Type destTy, string ��� = "")
		{
			return LLVM.BuildSExt(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateZExtOrBitCast(�������� val, Type destTy, string ��� = "")
		{ 
			return LLVM.BuildZExtOrBitCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateSExtOrBitCast(�������� val, Type destTy, string ��� = "") 
		{ 
			return LLVM.BuildSExtOrBitCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFPToUI(�������� val, Type destTy, string ��� = "")
		{
			return LLVM.BuildFPToUI(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFPToSI(�������� val, Type destTy, string ��� = "") 
		{
			return LLVM.BuildFPToSI(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateUIToFP(�������� val, Type destTy, string ��� = "") 
		{
			return LLVM.BuildUIToFP(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateSIToFP(�������� val, Type destTy, string ��� = "")
		{
			return LLVM.BuildSIToFP(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFPTrunc(�������� val, Type destTy, string ��� = "")
		{
			return LLVM.BuildFPTrunc(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFPExt(�������� val, Type destTy, string ��� = "") 
		{
			return LLVM.BuildFPExt(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreatePtrToInt(�������� val, Type destTy, string ��� = "")
		{
			return LLVM.BuildPtrToInt(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateIntToPtr(�������� val, Type destTy, string ��� = "") 
		{ 
			return LLVM.BuildIntToPtr(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateBitCast(�������� val, Type destTy, string ��� = "")
		{ 
			return LLVM.BuildBitCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateAddrSpaceCast(�������� val, Type destTy, string ��� = "") 
		{
			return LLVM.BuildAddrSpaceCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateTruncOrBitCast(�������� val, Type destTy, string ��� = "")
		{ 
			return LLVM.BuildTruncOrBitCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateCast(Opcode op, �������� val, Type destTy, string ��� = "")
		{ 
			return LLVM.BuildCast(this.�������(), op.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreatePointerCast(�������� val, Type destTy, string ��� = "") 
		{
			return LLVM.BuildPointerCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateIntCast(�������� val, Type destTy, string ��� = "")
		{
			LLVM.BuildIntCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFPCast(�������� val, Type destTy, string ��� = "")
		{
			return LLVM.BuildFPCast(this.�������(), val.�������(), destTy.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateICmp(������������� op, �������� lhs, �������� rhs, string ��� = "") 
		{ 
			return LLVM.BuildICmp(this.�������(), op.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateICmpEQ(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return this.CreateICmp(�������������.EQ, lhs, rhs, ���);
		}

        public �������� CreateICmpNE(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateICmp(�������������.NE, lhs, rhs, ���);
		}

        public �������� CreateICmpUGT(�������� lhs, �������� rhs, string ��� = "")
		{
			this.CreateICmp(�������������.UGT, lhs, rhs, ���);
		}

        public �������� CreateICmpULT(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateICmp(�������������.ULT, lhs, rhs, ���);
		}

        public �������� CreateICmpULE(�������� lhs, �������� rhs, string ��� = "") 
		{ 
			return this.CreateICmp(�������������.ULE, lhs, rhs, ���);
		}

        public �������� CreateICmpSGT(�������� lhs, �������� rhs, string ��� = "") 
		{
			return this.CreateICmp(�������������.SGT, lhs, rhs, ���);
		}

        public �������� CreateICmpSGE(�������� lhs, �������� rhs, string ��� = "") 
		{
			return this.CreateICmp(�������������.SGE, lhs, rhs, ���);
		}

        public �������� CreateICmpSLT(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateICmp(�������������.SLT, lhs, rhs, ���);
		}

        public �������� CreateICmpSLE(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateICmp(�������������.SLE, lhs, rhs, ���);
		}

        public �������� CreateFCmp(��������������� op, �������� lhs, �������� rhs, string ��� = "")
		{ 
			return LLVM.BuildFCmp(this.�������(), op.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateFCmpOEQ(�������� lhs, �������� rhs, string ��� = "") 
		{ 
			return this.CreateFCmp(���������������.OEQ, lhs, rhs, ���);
		}

        public �������� CreateFCmpOGT(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateFCmp(���������������.OGT, lhs, rhs, ���);
		}

        public �������� CreateFCmpOGE(�������� lhs, �������� rhs, string ��� = "") 
		{
			return this.CreateFCmp(���������������.OGE, lhs, rhs, ���);
		}

        public �������� CreateFCmpOLT(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateFCmp(���������������.OLT, lhs, rhs, ���);
		}

        public �������� CreateFCmpOLE(�������� lhs, �������� rhs, string ��� = "") 
		{
			return this.CreateFCmp(���������������.OLE, lhs, rhs, ���);
		}

        public �������� CreateFCmpONE(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateFCmp(���������������.ONE, lhs, rhs, ���);
		}

        public �������� CreateFCmpORD(�������� lhs, �������� rhs, string ��� = "")
		{
			this.CreateFCmp(���������������.ORD, lhs, rhs, ���);
		}

        public �������� CreateFCmpUNO(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return this.CreateFCmp(���������������.UNO, lhs, rhs, ���);
		}

        public �������� CreateFCmpUEQ(�������� lhs, �������� rhs, string ��� = "") 
		{
			return this.CreateFCmp(���������������.UEQ, lhs, rhs, ���);
		}

        public �������� CreateFCmpUGT(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateFCmp(���������������.UGT, lhs, rhs, ���);
		}

        public �������� CreateFCmpUGE(�������� lhs, �������� rhs, string ��� = "") 
		{
			return this.CreateFCmp(���������������.UGE, lhs, rhs, ���);
		}

        public �������� CreateFCmpULT(�������� lhs, �������� rhs, string ��� = "")
		{
			return this.CreateFCmp(���������������.ULT, lhs, rhs, ���);
		}

        public �������� CreateFCmpUNE(�������� lhs, �������� rhs, string ��� = "")
		{ 
			return this.CreateFCmp(���������������.UNE, lhs, rhs, ���);
		}

        public PHINode CreatePhi(Type ty, string ��� = "")
		{
			return LLVM.BuildPhi(this.�������(), ty.�������(), ���).WrapAs!(PHINode)();
		}

        public CallInst CreateCall(�������� fn, ��������[] args, string ���) 
		{ 
			return LLVM.BuildCall(this.�������(), fn.�������(), args.�������(), ���).WrapAs!(CallInst)();
		}

        public CallInst CreateCall(�������� fn, string ���, params ��������[] args)
		{
			return this.CreateCall(fn, args, ���);
		}

        public CallInst CreateCall(�������� fn, params ��������[] args) 
		{ 
			return this.CreateCall(fn, args, string.Empty);
		}

        public �������� CreateSelect(�������� @If, �������� then, �������� @Else, string ��� = "")
		{
			return LLVM.BuildSelect(this.�������(), If.�������(), then.�������(), Else.�������(), ���).WrapAs!(��������)();
		}

        public VAArgInst CreateVAArg(�������� list, Type ty, string ��� = "")
		{
			return LLVM.BuildVAArg(this.�������(), list.�������(), ty.�������(), ���).WrapAs!(VAArgInst)();
		}

        public �������� CreateExtractElement(�������� vecVal, �������� ������, string ��� = "")
		{
			return LLVM.BuildExtractElement(this.�������(), vecVal.�������(), ������.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateInsertElement(�������� vecVal, �������� eltVal, �������� ������, string ��� = "")
		{ 
			return LLVM.BuildInsertElement(this.�������(), vecVal.�������(), eltVal.�������(), ������.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateShuffleVector(�������� v1, �������� v2, �������� mask, string ��� = "")
		{ 
			return LLVM.BuildShuffleVector(this.�������(), v1.�������(), v2.�������(), mask.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateExtractValue(�������� aggVal, uint ������, string ��� = "") 
		{ 
			return LLVM.BuildExtractValue(this.�������(), aggVal.�������(), ������, ���).WrapAs!(��������)();
		}

        public �������� CreateInsertValue(�������� aggVal, �������� eltVal, uint ������, string ��� = "") 
		{ 
			return LLVM.BuildInsertValue(this.�������(), aggVal.�������(), eltVal.�������(), ������, ���).WrapAs!(��������)();
		}

        public �������� CreateIsNull(�������� val, string ��� = "")
		{ 
			return LLVM.BuildIsNull(this.�������(), val.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreateIsNotNull(�������� val, string ��� = "")
		{
			return LLVM.BuildIsNotNull(this.�������(), val.�������(), ���).WrapAs!(��������)();
		}

        public �������� CreatePtrDiff(�������� lhs, �������� rhs, string ��� = "") 
		{
			return LLVM.BuildPtrDiff(this.�������(), lhs.�������(), rhs.�������(), ���).WrapAs!(��������)();
		}

        public FenceInst CreateFence(AtomicOrdering ordering, bool singleThread, string ��� = "")
		{ 
			return LLVM.BuildFence(this.�������(), ordering.�������(), singleThread, ���).WrapAs!(FenceInst)();
		}

        public AtomicRMWInst CreateAtomicRMW(AtomicRMWBinOp op, �������� ptr, �������� val, AtomicOrdering ordering, bool singleThread) 
		{
			return LLVM.BuildAtomicRMW(this.�������(), op.�������(), ptr.�������(), val.�������(), ordering.�������(), singleThread).WrapAs!(AtomicRMWInst)();
		}

        public bool Equals(IRBuilder other) 
		{
			return ReferenceEquals(other, null) ? false : this.������� == other.�������;
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
			return this.�������.GetHashCode();
		}
    }
  }
}