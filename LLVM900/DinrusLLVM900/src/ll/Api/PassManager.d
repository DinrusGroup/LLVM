module ll.api.PassManager;

import ll.c.Core, ll.c.Types;
import ll.api.Module;
import ll.api.ModuleProvider;
import ll.api.vals.consts.GlobalValues.GlobalObjects.Function;
import ll.c.Transforms.IPO;
import ll.c.Transforms.Scalar;

    public class МенеджерПроходок
    {
        public this()
		{
			this(ЛЛСоздайМенеджерПроходок());
		}

        public this(Модуль modulei)
		{
			this(ЛЛСоздайМенеджерФукнцПроходокДляМодуля(modulei.раскрой()));
		}

        public this(МодульПровайдер provider)
		{ 
			this(ЛЛСоздайМенеджерФукнцПроходок(provider.раскрой()));
		}

        private ЛЛМенеджерПроходок экземпл;

        this(ЛЛМенеджерПроходок passManagerRef)
        {
            this.экземпл = passManagerRef;
        }

        ~this()
        {
            ЛЛВыместиМенеджерПроходок(this.раскрой());
        }

		public ЛЛМенеджерПроходок раскрой()
		{
			return this.экземпл;
		}

        public бул выполни(Модуль m)
		{
			return ЛЛЗапустиМенеджерПроходок(this.раскрой(), m.раскрой());
		}

        public бул инициализуйМПФ()
		{ 
		    return ЛЛИнициализуйМенеджерФукнцПроходок(this.раскрой());
		}

        public бул выполниМПФ(Функция f)
		{
			return ЛЛЗапустиМенеджерФукнцПроходок(this.раскрой(), f.раскрой());
		}

         public бул завершиМПФ()
		{ 
			return ЛЛФинализуйМенеджерФукнцПроходок(this.раскрой());
		}

        public void AddArgumentPromotionPass()
		{
			ЛЛДобавьПроходкуПродвиженияАргументов(this.раскрой());
		}

        public void AddConstantMergePass()
		{
			ЛЛДобавьПроходкуМёрджКонстант(this.раскрой());
		}

        public void AddDeadArgEliminationPass()
		{
			ЛЛДобавьПроходкуИскорененияНенужныхАргов(this.раскрой());
		}

        public void AddFunctionAttrsPass() 
		{
			ЛЛДобавьПроходкуАтрибутовФункций(this.раскрой());
		}

        public void AddFunctionInliningPass()
		{
			ЛЛДобавьПроходкуИнлайнингаФункций(this.раскрой());
		}

        public void AddAlwaysInlinerPass()
		{
			ЛЛДобавьПроходкуИнлайнВсегда(this.раскрой());
		}

        public void AddGlobalDCEPass()
		{
			ЛЛДобавьПроходкуГлобДЦЕ(this.раскрой());
		}

        public void AddGlobalOptimizerPass() 
		{ 
			ЛЛДобавьПроходкуГлобОптимизатора(this.раскрой());
		}

        public void AddIPConstantPropagationPass() 
		{ 
			ЛЛДобавьПроходкуПропагацииИПКонстант(this.раскрой());
		}

        public void AddPruneEHPass()
		{
			ЛЛДобавьПроходкуПрюнЕХ(this.раскрой());
		}

        public void AddIPSCCPPass()
		{
			ЛЛДобавьПроходкуИПСЦЦ(this.раскрой());
		}

        public void AddInternalizePass(uint allButMain)
		{
			ЛЛДобавьПроходкуИнтернализации(this.раскрой(), allButMain);
         }


        public void AddStripDeadPrototypesPass() 
		{ 
			ЛЛДобавьПроходкуОчисткиНенужныхПрототипов(this.раскрой());
		}

        public void AddStripSymbolsPass()
		{
			ЛЛДобавьПроходкуОчисткиСимволов(this.раскрой());
		}

        public void AddAggressiveDCEPass()
		{
			ЛЛДобавьПроходкуАгрессивДЦЕ(this.раскрой());
		}

        public void AddAlignmentFromAssumptionsPass()
		{ 
			ЛЛДобавьПроходкуРаскладкаИзАссумпций(this.раскрой());
		}

        public void AddCFGSimplificationPass()
		{ 
			ЛЛДобавьПроходкуКФГУпрощения(this.раскрой());
		}

        public void AddDeadStoreEliminationPass() 
		{ 
			ЛЛДобавьПроходкуУдаленияМёртвыхХранилищ(this.раскрой());
		}

        public void AddScalarizerPass()
		{ 
			ЛЛДобавьПроходкуСкаляризатора(this.раскрой());
		}

        public void AddMergedLoadStoreMotionPass() 
		{ 
			LLVM.AddMergedLoadStoreMotionPass(this.раскрой());
		}

        public void AddGVNPass() 
		{ 
			LLVM.AddGVNPass(this.раскрой());
		}

        public void AddIndVarSimplifyPass() 
		{
			LLVM.AddIndVarSimplifyPass(this.раскрой());
		}

        public void AddInstructionCombiningPass()
		{ 
			LLVM.AddInstructionCombiningPass(this.раскрой());
		}

        public void AddJumpThreadingPass()
		{ 
			LLVM.AddJumpThreadingPass(this.раскрой());
		}

        public void AddLICMPass()
		{
			LLVM.AddLICMPass(this.раскрой());
		}

        public void AddLoopDeletionPass() 
		{ 
			LLVM.AddLoopDeletionPass(this.раскрой());
		}

        public void AddLoopIdiomPass()
		{
			LLVM.AddLoopIdiomPass(this.раскрой());
		}

        public void AddLoopRotatePass() 
		{
			LLVM.AddLoopRotatePass(this.раскрой());
		}

        public void AddLoopRerollPass()
		{
			LLVM.AddLoopRerollPass(this.раскрой());
		}

        public void AddLoopUnrollPass()
		{ 
			LLVM.AddLoopUnrollPass(this.раскрой());
		}

        public void AddLoopUnswitchPass()
		{
			LLVM.AddLoopUnswitchPass(this.раскрой());
		}

        public void AddMemCpyOptPass()
		{
			LLVM.AddMemCpyOptPass(this.раскрой());
		}

        public void AddPartiallyInlineLibCallsPass()
		{
			LLVM.AddPartiallyInlineLibCallsPass(this.раскрой());
		}

        public void AddLowerSwitchPass()
		{
			LLVM.AddLowerSwitchPass(this.раскрой());
		}

        public void AddPromoteMemoryToRegisterPass()
		{
			LLVM.AddPromoteMemoryToRegisterPass(this.раскрой());
		}

        public void AddReassociatePass()
		{
			LLVM.AddReassociatePass(this.раскрой());
		}

        public void AddSCCPPass()
		{ 
			LLVM.AddSCCPPass(this.раскрой());
		}

        public void AddScalarReplAggregatesPass() 
		{
			LLVM.AddScalarReplAggregatesPass(this.раскрой());
		}

        public void AddScalarReplAggregatesPassSSA()
		{
			LLVM.AddScalarReplAggregatesPassSSA(this.раскрой());
		}

        public void AddScalarReplAggregatesPassWithThreshold(int threshold)
		{
			LLVM.AddScalarReplAggregatesPassWithThreshold(this.раскрой(), threshold);
		}

        public void AddSimplifyLibCallsPass()
		{ 
			LLVM.AddSimplifyLibCallsPass(this.раскрой());
		}

        public void AddTailCallEliminationPass() 
		{
			LLVM.AddTailCallEliminationPass(this.раскрой());
		}

        public void AddConstantPropagationPass()
		{ 
			LLVM.AddConstantPropagationPass(this.раскрой());
		}

        public void AddDemoteMemoryToRegisterPass() 
		{
			LLVM.AddDemoteMemoryToRegisterPass(this.раскрой());
		}

        public void AddVerifierPass() 
		{
			LLVM.AddVerifierPass(this.раскрой());
		}

        public void AddCorrelatedValuePropagationPass() 
		{
			LLVM.AddCorrelatedValuePropagationPass(this.раскрой());
		}

        public void AddEarlyCSEPass()
		{
			LLVM.AddEarlyCSEPass(this.раскрой());
		}

        public void AddLowerExpectIntrinsicPass()
		{ 
			LLVM.AddLowerExpectIntrinsicPass(this.раскрой());
		}

        public void AddTypeBasedAliasAnalysisPass()
		{
			LLVM.AddTypeBasedAliasAnalysisPass(this.раскрой());
		}

        public void AddScopedNoAliasAAPass()
		{ 
			LLVM.AddScopedNoAliasAAPass(this.раскрой());
		}

        public void AddBasicAliasAnalysisPass()
		{
			LLVM.AddBasicAliasAnalysisPass(this.раскрой());
		}

        public void AddBBVectorizePass() 
		{
			LLVM.AddBBVectorizePass(this.раскрой());
		}

        public void AddLoopVectorizePass()
		{ 
			LLVM.AddLoopVectorizePass(this.раскрой());
		}

        public void AddSLPVectorizePass() 
		{
			LLVM.AddSLPVectorizePass(this.раскрой());
		}
/+
        public override int GetHashCode()
		{
			this.раскрой().GetHashCode();
		}

        public override bool Equals(object obj)
		{
			this.Equals(obj as PassManager);
		}

        public bool Equals(PassManager other) 
		{
			ReferenceEquals(other, null) ? false : this.раскрой() == other.раскрой();
		}

        public static bool operator ==(PassManager op1, PassManager op2)
		{
			ReferenceEquals(op1, null) ? ReferenceEquals(op2, null) : op1.Equals(op2);
		}

        public static bool operator !=(PassManager op1, PassManager op2) 
		{ 
			!(op1 == op2);
		}
		+/
    }