module ll.IRBuilder;

import ll.c.Core;
import ll.c.Types;
import stdrus;

    public  class ПостроительПП
    {
        private ЛЛПостроитель экземпл;

       private бул вымещен;

        public this(ЛЛКонтекст контекст)
        {
            this.экземпл = ЛЛСоздайПостроительВКонтексте(контекст);
        }

        public this()
        {
		this(ЛЛДайГлобКонтекст());
        }

        ~this()
        {
           
        }

        public void построительПозиции(ЛЛБазовыйБлок блок, ЛЛЗначение инстр)
        {
            ЛЛПостроительПозиции(this.экземпл, блок, инстр);
        }

        public void построительПозицииПеред(ЛЛЗначение инстр)
        {
            ЛЛПостроительПозицииПеред(this.экземпл, инстр);
        }

        public void построительПозицииВКонце(ЛЛБазовыйБлок блок)
        {
            ЛЛПостроительПозицииВКонце(this.экземпл, блок);
        }

        public ЛЛБазовыйБлок дайБлокВставки()
        {
            return ЛЛДайБлокВставки(this.экземпл);
        }

        public void очистьПозициюВставки()
        {
            ЛЛОчистиПозициюВставки(this.экземпл);
        }

        public void вставьВПостроитель(ЛЛЗначение инстр)
        {
            ЛЛВставьВПостроитель(this.экземпл, инстр);
        }

        public void вставьВПостроительСИменем(ЛЛЗначение инстр, ткст имя)
        {
            ЛЛВставьВПостроительСИменем(this.экземпл, инстр, вТкст0(имя));
        }

        private void вымести()
        {
            if (this.вымещен)
            {
                return;
            }

            ЛЛВыместиПостроитель(this.экземпл);

            this.вымещен = true;
        }

        public void устТекЛокОтладки(ЛЛЗначение п)
        {
            ЛЛУстТекЛокОтладки(this.экземпл, п);
        }

        public ЛЛЗначение дайТекЛокОтладки()
        {
            return ЛЛДайТекЛокОтладки(this.экземпл);
        }

        public void устТекЛОкОтладкиИнстр(ЛЛЗначение инстр)
        {
            ЛЛУстТекЛокОтладкиИнстр(this.экземпл, инстр);
        }

        public ЛЛЗначение создайВозврПроц()
        {
            return ЛЛСтройВозврПроц(this.экземпл);
        }

        public ЛЛЗначение создайВозвр(ЛЛЗначение з)
        {
            return ЛЛСтройВозвр(this.экземпл, з);
        }

        public ЛЛЗначение создайАгрегатВозвр(ЛЛЗначение[] возврЗнач)
        {
            return ЛЛСтройАгрегатВозвр(this.экземпл, возврЗнач);
        }

        public ЛЛЗначение создайБр(ЛЛБазовыйБлок где)
        {
            return ЛЛСтройБр(this.экземпл, где);
        }

        public ЛЛЗначение создайУсловнБр(ЛЛЗначение если, ЛЛБазовыйБлок то, ЛЛБазовыйБлок иначе)
        {
            return ЛЛСтройУсловнБр(this.экземпл, если, то, иначе);
        }

        public ЛЛЗначение создайЩит(ЛЛЗначение з, ЛЛБазовыйБлок иначе, бцел члоРеле)
        {
            return ЛЛСтройЩит(this.экземпл, , иначе, члоРеле);
        }

        public ЛЛЗначение создайНепрямБр(ЛЛЗначение адр, бцел члоПриёмн)
        {
            return ЛЛСтройНепрямБр(this.экземпл, адр, члоПриёмн);
        }

        public ЛЛЗначение создайИнвок(ЛЛЗначение фн, ЛЛЗначение[] арги, ЛЛБазовыйБлок тогда, ЛЛБазовыйБлок лови, ткст имя)
        {
            return ЛЛСтройИнвок(this.экземпл, фн, арги, тогда, лови, имя);
        }

        public ЛЛЗначение создайЛэндингПад(ЛЛТип тип, ЛЛЗначение персФн, бцел члоКлоз, ткст имя)
        {
            return ЛЛСтойЛэндингПад(this.экземпл, тип, персФн, члоКлоз, имя);
        }

        public ЛЛЗначение создайРезюм(ЛЛЗначение расш)
        {
            return ЛЛСтройВозобнови(this.экземпл, расш);
        }

        public ЛЛЗначение CreateUnreachable()
        {
            return LLVM.BuildUnreachable(this.экземпл);
        }

        public ЛЛЗначение CreateAdd(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildAdd(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateNSWAdd(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildNSWAdd(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateNUWAdd(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildNUWAdd(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateFAdd(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildFAdd(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateSub(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildSub(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateNSWSub(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildNSWSub(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateNUWSub(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildNUWSub(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateFSub(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildFSub(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateMul(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildMul(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateNSWMul(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildNSWMul(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateNUWMul(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildNUWMul(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateFMul(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildFMul(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateUDiv(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildUDiv(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateSDiv(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildSDiv(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateExactSDiv(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildExactSDiv(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateFDiv(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildFDiv(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateURem(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildURem(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateSRem(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildSRem(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateFRem(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildFRem(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateShl(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildShl(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateLShr(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildLShr(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateAShr(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildAShr(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateAnd(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildAnd(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateOr(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildOr(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateXor(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildXor(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateBinOp(LLVMOpcode @Op, ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildBinOp(this.экземпл, @Op, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateNeg(ЛЛЗначение @V, ткст имя)
        {
            return LLVM.BuildNeg(this.экземпл, @V, имя);
        }

        public ЛЛЗначение CreateNSWNeg(ЛЛЗначение @V, ткст имя)
        {
            return LLVM.BuildNSWNeg(this.экземпл, @V, имя);
        }

        public ЛЛЗначение CreateNUWNeg(ЛЛЗначение @V, ткст имя)
        {
            return LLVM.BuildNUWNeg(this.экземпл, @V, имя);
        }

        public ЛЛЗначение CreateFNeg(ЛЛЗначение @V, ткст имя)
        {
            return LLVM.BuildFNeg(this.экземпл, @V, имя);
        }

        public ЛЛЗначение CreateNot(ЛЛЗначение @V, ткст имя)
        {
            return LLVM.BuildNot(this.экземпл, @V, имя);
        }

        public ЛЛЗначение CreateMalloc(ЛЛТип @Ty, ткст имя)
        {
            return LLVM.BuildMalloc(this.экземпл, @Ty, имя);
        }

        public ЛЛЗначение CreateArrayMalloc(ЛЛТип @Ty, ЛЛЗначение @Val, ткст имя)
        {
            return LLVM.BuildArrayMalloc(this.экземпл, @Ty, @Val, имя);
        }

        public ЛЛЗначение CreateAlloca(ЛЛТип @Ty, ткст имя)
        {
            return LLVM.BuildAlloca(this.экземпл, @Ty, имя);
        }

        public ЛЛЗначение CreateArrayAlloca(ЛЛТип @Ty, ЛЛЗначение @Val, ткст имя)
        {
            return LLVM.BuildArrayAlloca(this.экземпл, @Ty, @Val, имя);
        }

        public ЛЛЗначение CreateFree(ЛЛЗначение @PointerVal)
        {
            return LLVM.BuildFree(this.экземпл, @PointerVal);
        }

        public ЛЛЗначение CreateLoad(ЛЛЗначение @PointerVal, ткст имя)
        {
            return LLVM.BuildLoad(this.экземпл, @PointerVal, имя);
        }

        public ЛЛЗначение CreateStore(ЛЛЗначение @Val, ЛЛЗначение @Ptr)
        {
            return LLVM.BuildStore(this.экземпл, @Val, @Ptr);
        }

        public ЛЛЗначение CreateGEP(ЛЛЗначение @Pointer, ЛЛЗначение[] @Indices, ткст имя)
        {
            return LLVM.BuildGEP(this.экземпл, @Pointer, @Indices, имя);
        }

        public ЛЛЗначение CreateInBoundsGEP(ЛЛЗначение @Pointer, ЛЛЗначение[] @Indices, ткст имя)
        {
            return LLVM.BuildInBoundsGEP(this.экземпл, @Pointer, @Indices, имя);
        }

        public ЛЛЗначение CreateStructGEP(ЛЛЗначение @Pointer, uint @Idx, ткст имя)
        {
            return LLVM.BuildStructGEP(this.экземпл, @Pointer, @Idx, имя);
        }

        public ЛЛЗначение CreateGlobalString(ткст @Str, ткст имя)
        {
            return LLVM.BuildGlobalString(this.экземпл, @Str, имя);
        }

        public ЛЛЗначение CreateGlobalStringPtr(ткст @Str, ткст имя)
        {
            return LLVM.BuildGlobalStringPtr(this.экземпл, @Str, имя);
        }

        public ЛЛЗначение CreateTrunc(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildTrunc(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateZExt(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildZExt(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateSExt(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildSExt(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateFPToUI(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildFPToUI(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateFPToSI(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildFPToSI(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateUIToFP(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildUIToFP(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateSIToFP(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildSIToFP(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateFPTrunc(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildFPTrunc(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateFPExt(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildFPExt(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreatePtrToInt(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildPtrToInt(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateIntToPtr(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildIntToPtr(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateBitCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildBitCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateAddrSpaceCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildAddrSpaceCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateZExtOrBitCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildZExtOrBitCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateSExtOrBitCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildSExtOrBitCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateTruncOrBitCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildTruncOrBitCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateCast(LLVMOpcode @Op, ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildCast(this.экземпл, @Op, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreatePointerCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildPointerCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateIntCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildIntCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateFPCast(ЛЛЗначение @Val, ЛЛТип @DestTy, ткст имя)
        {
            return LLVM.BuildFPCast(this.экземпл, @Val, @DestTy, имя);
        }

        public ЛЛЗначение CreateICmp(LLVMIntPredicate @Op, ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildICmp(this.экземпл, @Op, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateFCmp(LLVMRealPredicate @Op, ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildFCmp(this.экземпл, @Op, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreatePhi(ЛЛТип @Ty, ткст имя)
        {
            return LLVM.BuildPhi(this.экземпл, @Ty, имя);
        }

        public ЛЛЗначение CreateCall(ЛЛЗначение @Fn, ЛЛЗначение[] @Args, ткст имя)
        {
            return LLVM.BuildCall(this.экземпл, @Fn, @Args, имя);
        }

        public ЛЛЗначение CreateSelect(ЛЛЗначение @If, ЛЛЗначение @Then, ЛЛЗначение @Else, ткст имя)
        {
            return LLVM.BuildSelect(this.экземпл, @If, @Then, @Else, имя);
        }

        public ЛЛЗначение CreateVAArg(ЛЛЗначение @List, ЛЛТип @Ty, ткст имя)
        {
            return LLVM.BuildVAArg(this.экземпл, @List, @Ty, имя);
        }

        public ЛЛЗначение CreateExtractElement(ЛЛЗначение @VecVal, ЛЛЗначение @Index, ткст имя)
        {
            return LLVM.BuildExtractElement(this.экземпл, @VecVal, @Index, имя);
        }

        public ЛЛЗначение CreateInsertElement(ЛЛЗначение @VecVal, ЛЛЗначение @EltVal, ЛЛЗначение @Index, ткст имя)
        {
            return LLVM.BuildInsertElement(this.экземпл, @VecVal, @EltVal, @Index, имя);
        }

        public ЛЛЗначение CreateShuffleVector(ЛЛЗначение @V1, ЛЛЗначение @V2, ЛЛЗначение @Mask, ткст имя)
        {
            return LLVM.BuildShuffleVector(this.экземпл, @V1, @V2, @Mask, имя);
        }

        public ЛЛЗначение CreateExtractValue(ЛЛЗначение @AggVal, uint @Index, ткст имя)
        {
            return LLVM.BuildExtractValue(this.экземпл, @AggVal, @Index, имя);
        }

        public ЛЛЗначение CreateInsertValue(ЛЛЗначение @AggVal, ЛЛЗначение @EltVal, uint @Index, ткст имя)
        {
            return LLVM.BuildInsertValue(this.экземпл, @AggVal, @EltVal, @Index, имя);
        }

        public ЛЛЗначение CreateIsNull(ЛЛЗначение @Val, ткст имя)
        {
            return LLVM.BuildIsNull(this.экземпл, @Val, имя);
        }

        public ЛЛЗначение CreateIsNotNull(ЛЛЗначение @Val, ткст имя)
        {
            return LLVM.BuildIsNotNull(this.экземпл, @Val, имя);
        }

        public ЛЛЗначение CreatePtrDiff(ЛЛЗначение @LHS, ЛЛЗначение @RHS, ткст имя)
        {
            return LLVM.BuildPtrDiff(this.экземпл, @LHS, @RHS, имя);
        }

        public ЛЛЗначение CreateFence(LLVMAtomicOrdering @ordering, bool @singleThread, ткст имя)
        {
            return LLVM.BuildFence(this.экземпл, @ordering, @singleThread, имя);
        }

        public ЛЛЗначение CreateAtomicRMW(LLVMAtomicRMWBinOp @op, ЛЛЗначение @PTR, ЛЛЗначение @Val, LLVMAtomicOrdering @ordering, bool @singleThread)
        {
            return LLVM.BuildAtomicRMW(this.экземпл, @op, @PTR, @Val, @ordering, @singleThread);
        }
    }
