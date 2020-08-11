module ll.api.IRBuilder;

import ll.c.Core, ll.c.Types;
import ll.api.Context;

    public class ПостроительПП
    {

        public this() 
		{
			this(ЛЛСоздайПостроитель());
		}

        public this(Контекст контекст)
		{ 
			this(ЛЛСоздайПостроительВКонтексте(контекст.раскрой()));
		}

        private  ЛЛПостроитель экземпл;

        this(ЛЛПостроитель укНаПостр)
        {
            this.экземпл = укНаПостр;
        }

        ~this()
        {
            ЛЛВыместиПостроитель(this.экземпл);
        }

		public ЛЛПостроитель раскрой()
		{
			return this.экземпл;
		}
/+
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

        public void InsertIntoBuilder(Instruction instr, ткст имя = "")
		{
			LLVM.InsertIntoBuilderWithName(this.раскрой(), instr.раскрой(), имя);
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

        public InvokeInst CreateInvoke(Значение fn, Значение[] args, BasicBlock then, BasicBlock Catch, ткст имя = "")
		{ 
			return LLVM.BuildInvoke(this.раскрой(), fn.раскрой(), args.раскрой(), then.раскрой!(LLVMBasicBlockRef)(), Catch.раскрой!(LLVMBasicBlockRef)(), имя).WrapAs!(InvokeInst)();
		}

        public LandingPadInst CreateLandingPad(Тип ty, Значение persFn, uint numClauses, ткст имя = "")
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

        public Значение CreateAdd(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateNSWAdd(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildNSWAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateNUWAdd(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildNUWAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateFAdd(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildFAdd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateSub(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return LLVM.BuildSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateNSWSub(Значение lhs, Значение rhs, ткст имя = "") 
		{
			LLVM.BuildNSWSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateNUWSub(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildNUWSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateFSub(Значение lhs, Значение rhs, ткст имя = "") 
		{ 
			return LLVM.BuildFSub(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateMul(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateNSWMul(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildNSWMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateNUWMul(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return LLVM.BuildNUWMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateFMul(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildFMul(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateUDiv(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return LLVM.BuildUDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateExactUDiv(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return LLVM.BuildExactUDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateSDiv(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildSDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateExactSDiv(Значение lhs, Значение rhs, ткст имя = "") 
		{ 
			return LLVM.BuildExactSDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateFDiv(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildFDiv(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateURem(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildURem(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
         }

        public Значение CreateSRem(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildSRem(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateFRem(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildFRem(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateShl(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildShl(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateLShr(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildLShr(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateAShr(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildAShr(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateAnd(Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildAnd(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateOr(Значение lhs, Значение rhs, ткст имя = "") 
		{ 
			return LLVM.BuildOr(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateXor(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildXor(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateBinOp(Opcode op, Значение lhs, Значение rhs, ткст имя = "")
		{
			return LLVM.BuildBinOp(this.раскрой(), op.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateNeg(Значение v, ткст имя = "") 
		{
			return LLVM.BuildNeg(this.раскрой(), v.раскрой(), имя);
		}

        public Значение CreateNSWNeg(Значение v, ткст имя = "")
		{
			return LLVM.BuildNSWNeg(this.раскрой(), v.раскрой(), имя);
		}

        public Значение CreateNUWNeg(Значение v, ткст имя = "")
		{ 
			return LLVM.BuildNUWNeg(this.раскрой(), v.раскрой(), имя);
		}

        public Значение CreateFNeg(Значение v, ткст имя = "") 
		{
			return LLVM.BuildFNeg(this.раскрой(), v.раскрой(), имя);
		}

        public Значение CreateNot(Значение v, ткст имя = "")
		{
			return LLVM.BuildNot(this.раскрой(), v.раскрой(), имя);
		}

        public CallInst CreateMalloc(Тип ty, ткст имя = "")
		{ 
			return LLVM.BuildMalloc(this.раскрой(), ty.раскрой(), имя).WrapAs!(CallInst)();
		}

        public CallInst CreateArrayMalloc(Тип ty, Значение val, ткст имя = "")
		{
			return return LLVM.BuildArrayMalloc(this.раскрой(), ty.раскрой(), val.раскрой(), имя).WrapAs!(CallInst)();
		}

        public AllocaInst CreateAlloca(Тип ty, ткст имя = "") 
		{
			return LLVM.BuildAlloca(this.раскрой(), ty.раскрой(), имя).WrapAs!(AllocaInst)();
		}

        public AllocaInst CreateArrayAlloca(Тип ty, Значение val, ткст имя = "")
		{ 
			return LLVM.BuildArrayAlloca(this.раскрой(), ty.раскрой(), val.раскрой(), имя).WrapAs!(AllocaInst)();
		}

        public CallInst CreateFree(Значение pointerVal)
		{ 
			return LLVM.BuildFree(this.раскрой(), pointerVal.раскрой()).WrapAs!(CallInst)();
		}

        public LoadInst CreateLoad(Значение pointerVal, ткст имя = "")
		{
			return LLVM.BuildLoad(this.раскрой(), pointerVal.раскрой(), имя).WrapAs!(LoadInst)();
		}

        public StoreInst CreateStore(Значение val, Значение ptr) 
		{ 
			return LLVM.BuildStore(this.раскрой(), val.раскрой(), ptr.раскрой()).WrapAs!(StoreInst)();
		}

        public Значение CreateGEP(Значение pointer, Значение[] indices, ткст имя = "") 
		{ 
			return LLVM.BuildGEP(this.раскрой(), pointer.раскрой(), indices.раскрой(), имя);
		}

        public Значение CreateInBoundsGEP(Значение pointer, Значение[] indices, ткст имя = "")
		{
			return LLVM.BuildInBoundsGEP(this.раскрой(), pointer.раскрой(), indices.раскрой(), имя);
		}

        public Значение CreateStructGEP(Значение pointer, uint idx, ткст имя = "")
		{ 
			return LLVM.BuildStructGEP(this.раскрой(), pointer.раскрой(), idx, имя);
		}

        public Значение CreateGlobalString(ткст str, ткст имя = "")
		{
			return LLVM.BuildGlobalString(this.раскрой(), str, имя);
		}

        public Значение CreateGlobalStringPtr(ткст str, ткст имя = "")
		{
			return LLVM.BuildGlobalStringPtr(this.раскрой(), str, имя);
		}

        public Значение CreateTrunc(Значение val, Тип destTy, ткст имя = "")
		{
			return LLVM.BuildTrunc(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateZExt(Значение val, Тип destTy, ткст имя = "") 
		{
			return LLVM.BuildZExt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateSExt(Значение val, Тип destTy, ткст имя = "")
		{
			return LLVM.BuildSExt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateZExtOrBitCast(Значение val, Тип destTy, ткст имя = "")
		{ 
			return LLVM.BuildZExtOrBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateSExtOrBitCast(Значение val, Тип destTy, ткст имя = "") 
		{ 
			return LLVM.BuildSExtOrBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateFPToUI(Значение val, Тип destTy, ткст имя = "")
		{
			return LLVM.BuildFPToUI(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateFPToSI(Значение val, Тип destTy, ткст имя = "") 
		{
			return LLVM.BuildFPToSI(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateUIToFP(Значение val, Тип destTy, ткст имя = "") 
		{
			return LLVM.BuildUIToFP(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateSIToFP(Значение val, Тип destTy, ткст имя = "")
		{
			return LLVM.BuildSIToFP(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateFPTrunc(Значение val, Тип destTy, ткст имя = "")
		{
			return LLVM.BuildFPTrunc(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateFPExt(Значение val, Тип destTy, ткст имя = "") 
		{
			return LLVM.BuildFPExt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreatePtrToInt(Значение val, Тип destTy, ткст имя = "")
		{
			return LLVM.BuildPtrToInt(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateIntToPtr(Значение val, Тип destTy, ткст имя = "") 
		{ 
			return LLVM.BuildIntToPtr(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateBitCast(Значение val, Тип destTy, ткст имя = "")
		{ 
			return LLVM.BuildBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateAddrSpaceCast(Значение val, Тип destTy, ткст имя = "") 
		{
			return LLVM.BuildAddrSpaceCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateTruncOrBitCast(Значение val, Тип destTy, ткст имя = "")
		{ 
			return LLVM.BuildTruncOrBitCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateCast(Opcode op, Значение val, Тип destTy, ткст имя = "")
		{ 
			return LLVM.BuildCast(this.раскрой(), op.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreatePointerCast(Значение val, Тип destTy, ткст имя = "") 
		{
			return LLVM.BuildPointerCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateIntCast(Значение val, Тип destTy, ткст имя = "")
		{
			LLVM.BuildIntCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateFPCast(Значение val, Тип destTy, ткст имя = "")
		{
			return LLVM.BuildFPCast(this.раскрой(), val.раскрой(), destTy.раскрой(), имя);
		}

        public Значение CreateICmp(ЛЛЦелПредикат op, Значение lhs, Значение rhs, ткст имя = "") 
		{ 
			return LLVM.BuildICmp(this.раскрой(), op.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateICmpEQ(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return this.CreateICmp(ЛЛЦелПредикат.EQ, lhs, rhs, имя);
		}

        public Значение CreateICmpNE(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.NE, lhs, rhs, имя);
		}

        public Значение CreateICmpUGT(Значение lhs, Значение rhs, ткст имя = "")
		{
			this.CreateICmp(ЛЛЦелПредикат.UGT, lhs, rhs, имя);
		}

        public Значение CreateICmpULT(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.ULT, lhs, rhs, имя);
		}

        public Значение CreateICmpULE(Значение lhs, Значение rhs, ткст имя = "") 
		{ 
			return this.CreateICmp(ЛЛЦелПредикат.ULE, lhs, rhs, имя);
		}

        public Значение CreateICmpSGT(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return this.CreateICmp(ЛЛЦелПредикат.SGT, lhs, rhs, имя);
		}

        public Значение CreateICmpSGE(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return this.CreateICmp(ЛЛЦелПредикат.SGE, lhs, rhs, имя);
		}

        public Значение CreateICmpSLT(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.SLT, lhs, rhs, имя);
		}

        public Значение CreateICmpSLE(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateICmp(ЛЛЦелПредикат.SLE, lhs, rhs, имя);
		}

        public Значение CreateFCmp(ЛЛПредикатРеала op, Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return LLVM.BuildFCmp(this.раскрой(), op.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public Значение CreateFCmpOEQ(Значение lhs, Значение rhs, ткст имя = "") 
		{ 
			return this.CreateFCmp(ЛЛПредикатРеала.OEQ, lhs, rhs, имя);
		}

        public Значение CreateFCmpOGT(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OGT, lhs, rhs, имя);
		}

        public Значение CreateFCmpOGE(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OGE, lhs, rhs, имя);
		}

        public Значение CreateFCmpOLT(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OLT, lhs, rhs, имя);
		}

        public Значение CreateFCmpOLE(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.OLE, lhs, rhs, имя);
		}

        public Значение CreateFCmpONE(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.ONE, lhs, rhs, имя);
		}

        public Значение CreateFCmpORD(Значение lhs, Значение rhs, ткст имя = "")
		{
			this.CreateFCmp(ЛЛПредикатРеала.ORD, lhs, rhs, имя);
		}

        public Значение CreateFCmpUNO(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return this.CreateFCmp(ЛЛПредикатРеала.UNO, lhs, rhs, имя);
		}

        public Значение CreateFCmpUEQ(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.UEQ, lhs, rhs, имя);
		}

        public Значение CreateFCmpUGT(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.UGT, lhs, rhs, имя);
		}

        public Значение CreateFCmpUGE(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return this.CreateFCmp(ЛЛПредикатРеала.UGE, lhs, rhs, имя);
		}

        public Значение CreateFCmpULT(Значение lhs, Значение rhs, ткст имя = "")
		{
			return this.CreateFCmp(ЛЛПредикатРеала.ULT, lhs, rhs, имя);
		}

        public Значение CreateFCmpUNE(Значение lhs, Значение rhs, ткст имя = "")
		{ 
			return this.CreateFCmp(ЛЛПредикатРеала.UNE, lhs, rhs, имя);
		}

        public PHINode CreatePhi(Тип ty, ткст имя = "")
		{
			return LLVM.BuildPhi(this.раскрой(), ty.раскрой(), имя).WrapAs!(PHINode)();
		}

        public CallInst CreateCall(Значение fn, Значение[] args, ткст имя) 
		{ 
			return LLVM.BuildCall(this.раскрой(), fn.раскрой(), args.раскрой(), имя).WrapAs!(CallInst)();
		}

        public CallInst CreateCall(Значение fn, ткст имя, params Значение[] args)
		{
			return this.CreateCall(fn, args, имя);
		}

        public CallInst CreateCall(Значение fn, params Значение[] args) 
		{ 
			return this.CreateCall(fn, args, ткст.Empty);
		}

        public Значение CreateSelect(Значение @If, Значение then, Значение @Else, ткст имя = "")
		{
			return LLVM.BuildSelect(this.раскрой(), If.раскрой(), then.раскрой(), Else.раскрой(), имя);
		}

        public VAArgInst CreateVAArg(Значение list, Тип ty, ткст имя = "")
		{
			return LLVM.BuildVAArg(this.раскрой(), list.раскрой(), ty.раскрой(), имя).WrapAs!(VAArgInst)();
		}

        public Значение CreateExtractElement(Значение vecVal, Значение индекс, ткст имя = "")
		{
			return LLVM.BuildExtractElement(this.раскрой(), vecVal.раскрой(), индекс.раскрой(), имя);
		}

        public Значение CreateInsertElement(Значение vecVal, Значение eltVal, Значение индекс, ткст имя = "")
		{ 
			return LLVM.BuildInsertElement(this.раскрой(), vecVal.раскрой(), eltVal.раскрой(), индекс.раскрой(), имя);
		}

        public Значение CreateShuffleVector(Значение v1, Значение v2, Значение mask, ткст имя = "")
		{ 
			return LLVM.BuildShuffleVector(this.раскрой(), v1.раскрой(), v2.раскрой(), mask.раскрой(), имя);
		}

        public Значение CreateExtractValue(Значение aggVal, uint индекс, ткст имя = "") 
		{ 
			return LLVM.BuildExtractValue(this.раскрой(), aggVal.раскрой(), индекс, имя);
		}

        public Значение CreateInsertValue(Значение aggVal, Значение eltVal, uint индекс, ткст имя = "") 
		{ 
			return LLVM.BuildInsertValue(this.раскрой(), aggVal.раскрой(), eltVal.раскрой(), индекс, имя);
		}

        public Значение CreateIsNull(Значение val, ткст имя = "")
		{ 
			return LLVM.BuildIsNull(this.раскрой(), val.раскрой(), имя);
		}

        public Значение CreateIsNotNull(Значение val, ткст имя = "")
		{
			return LLVM.BuildIsNotNull(this.раскрой(), val.раскрой(), имя);
		}

        public Значение CreatePtrDiff(Значение lhs, Значение rhs, ткст имя = "") 
		{
			return LLVM.BuildPtrDiff(this.раскрой(), lhs.раскрой(), rhs.раскрой(), имя);
		}

        public FenceInst CreateFence(AtomicOrdering ordering, bool singleThread, ткст имя = "")
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
		+/
}