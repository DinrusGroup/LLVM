module ll.api.vals.consts.ConstantExpr;
{
    import ll.c.Core, ll.c.Types;
    import ll.api.Type;
	import ll.api.vals.Constant;

    public class КонстВыр : Константа
    {
        this(ЛЛЗначение экзэмпл)
		{
            super(экзэмпл);        
        }

        public ЛЛОпкод констОпкод()
		{ 
		return ЛЛДайКонстОпкод(this.раскрой());
		}
    }
}

public static КонстВыр дайРаскладУ(Тип тип)
{ 
	if(тип.сРазмером_ли())	return new КонстВыр( ЛЛРаскладУ(тип.раскрой()));
		else return null;
}

public static КонстВыр дайРазмерУ(Тип тип)
{ 
	if(тип.сРазмером_ли())	return new КонстВыр(ЛЛРазмерУ(тип.раскрой()));
	else return null;
}

public static КонстВыр дайНулл(Тип тип) 
{ 
	if(тип.можетИметьКонстанты())	return new КонстВыр(ЛЛКонстПусто(тип.раскрой()));
	else return null;
}

public static КонстВыр дайВсеЕдиницы(Тип тип)
{
	if(тип.можетИметьКонстанты()) return new КонстВыр(ЛЛКонстВсеЕд(тип.раскрой()));
	else return null;
}

public static КонстВыр дайОтриц(Константа значение)
{
	return new КонстВыр(ЛЛКонстОтр(значение.раскрой()));
}

public static КонстВыр дайОтрицНСВ(Константа значение)
{
	return new КонстВыр(ЛЛКонстОтрНСВ(значение.раскрой()));
}

public static КонстВыр дайОтрицНУВ(Константа значение)
{ 
	return new КонстВыр(LLConstNUWNeg(значение.раскрой()));
}

public static КонстВыр дайПОтриц(Константа значение) 
{
	return new КонстВыр(ЛЛКонстПОтриц(значение.раскрой()));
}

public static КонстВыр дайНе(Константа значение)
{
	return new КонстВыр(ЛЛКонстНе(значение.раскрой()));
}

public static КонстВыр дайДобавь(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстДобавь(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайДобавьНСВ(Константа lhs, Константа rhs)
{
	return new КонстВыр(LLConstNSWAdd(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайДобавьНУВ(Константа lhs, Константа rhs)
{
	return new КонстВыр(LLConstNUWAdd(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайПДобавь(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(ЛЛКонстПСложи(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайОтними(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстОтними(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайОтнимиНСВ(Константа lhs, Константа rhs) 
{ 
	return new КонстВыр(LLConstNSWSub(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайОтнимиНУВ(Константа lhs, Константа rhs)
{
	return new КонстВыр(LLConstNUWSub(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайПОтними(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстПОтними(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайУмножь(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстУмножь(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайУмножьНСВ(Константа lhs, Константа rhs)
{
	return new КонстВыр(LLConstNSWMul(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайУмножьНУВ(Константа lhs, Константа rhs)
{
	return new КонстВыр(LLConstNUWMul(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайПУмножь(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(ЛЛКонстПУмножь(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайБДели(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстБДели(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр дайЗДели(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(ЛЛКонстЗДели(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetExactSDiv(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстТочноЗДели(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetFDiv(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстПДели(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetURem(Константа lhs, Константа rhs)
{
	return new КонстВыр(LLConstURem(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetSRem(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(LLConstSRem(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetFRem(Константа lhs, Константа rhs)
{
	return new КонстВыр(LLConstFRem(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetAnd(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(ЛЛКонстИ(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetOr(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстИли(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetXor(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(ЛЛКонстИИли(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetICmp(ЛЛЦелПредикат predicate, Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстЦСравн(predicate, lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetFCmp(ЛЛПредикатРеала predicate, Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстПСравн(predicate, lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetShl(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(ЛЛКонстСдвл(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetLShr(Константа lhs, Константа rhs)
{
	return new КонстВыр(ЛЛКонстСдвп(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetAShr(Константа lhs, Константа rhs)
{ 
	return new КонстВыр(LLConstAShr(lhs.раскрой(), rhs.раскрой()));
}

public static КонстВыр GetGEP(Константа констЗнач, Константа[] constantIndices) 
{
	return new КонстВыр(ЛЛКонстУкНаЭлт(констЗнач.раскрой(), constantIndices.раскрой()));
}

public static КонстВыр GetInBoundsGEP(Константа констЗнач, Константа[] constantIndices)
{ 
	return new КонстВыр(LLConstInBoundsGEP(констЗнач.раскрой(), constantIndices.раскрой()));
}

public static КонстВыр GetTrunc(Константа констЗнач, Тип вТип)
{
	return new КонстВыр(ЛЛКонстОбрежь(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

public static КонстВыр GetSExt(Константа констЗнач, Тип вТип)
{
	return new КонстВыр(ЛЛКонстЗРасш(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

/+
public static КонстВыр GetZExt(Константа констЗнач, Тип вТип) 
{
	return new КонстВыр(LLVMConstZExt(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

public static КонстВыр GetFPTrunc(Константа констЗнач, Тип вТип) 
{ 
	return new КонстВыр(LLVMConstFPTrunc(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

public static КонстВыр GetFPExt(Константа констЗнач, Тип вТип)
{
	return new КонстВыр(LLVMConstFPExt(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

public static КонстВыр GetUIToFP(Константа констЗнач, Тип вТип)
{ 
	return new КонстВыр(LLVMConstUIToFP(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

public static КонстВыр GetSIToFP(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstSIToFP(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

public static КонстВыр GetFPToUI(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstFPToUI(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
}

public static КонстВыр GetFPToSI(Константа констЗнач, Тип вТип) 
{  
	return new КонстВыр(LLVMConstFPToSI(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()));
} 

public static КонстВыр GetPtrToInt(Константа констЗнач, Тип вТип) 
{  
	return new КонстВыр(LLVMConstPtrToInt(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой())); 
}

public static КонстВыр GetIntToPtr(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstIntToPtr(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой())); 
}

public static КонстВыр GetBitCast(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstBitCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой())); 
}

public static КонстВыр GetAddrSpaceCast(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstAddrSpaceCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой())); 
}

public static КонстВыр GetZExtOrBitCast(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstZExtOrBitCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()); 
}

public static КонстВыр GetSExtOrBitCast(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstSExtOrBitCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой())); 
}

public static КонстВыр GetTruncOrBitCast(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstTruncOrBitCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой())); 
}

public static КонстВыр GetPointerCast(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstPointerCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой())); 
}

public static КонстВыр GetIntCast(Константа констЗнач, Тип вТип, bool isSigned) 
{  
	return new КонстВыр(LLVMConstIntCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой(), isSigned)); 
}

public static КонстВыр GetFPCast(Константа констЗнач, Тип вТип)
{  
	return new КонстВыр(LLVMConstFPCast(констЗнач.раскрой(), вТип.MustHaveConstants().раскрой()); 
}

public static КонстВыр GetSelect(Константа constantCondition, Константа constantIfTrue, Константа constantIfFalse)
{  
	return new КонстВыр(LLVMConstSelect(constantCondition.раскрой(), constantIfTrue.раскрой(), constantIfFalse.раскрой())); 
}

public static КонстВыр GetExtractElement(Константа vectorConstant, Константа indexConstant)
{  
	return new КонстВыр(LLVMConstExtractElement(vectorConstant.раскрой(), indexConstant.раскрой())); 
}

public static КонстВыр GetInsertElement(Константа vectorConstant, Константа elementValueConstant, Константа indexConstant)
{  
	return new КонстВыр(LLVMConstInsertElement(vectorConstant.раскрой(), elementValueConstant.раскрой(), indexConstant.раскрой())); 
}

public static КонстВыр GetShuffleVector(Константа vectorAConstant, Константа vectorBConstant, Константа maskConstant)
{  
	return new КонстВыр(LLVMConstShuffleVector(vectorAConstant.раскрой(), vectorBConstant.раскрой(), maskConstant.раскрой())); 
}

public static КонстВыр GetExtractValue(Константа aggConstant, out uint idxList, uint numIdx)
{  
	return new КонстВыр(LLVMConstExtractValue(aggConstant.раскрой(), idxList, numIdx)); 
}

public static КонстВыр GetInsertValue(Константа aggConstant, Константа elementValueConstant, out uint idxList, uint numIdx)
{  
	return new КонстВыр(LLVMConstInsertValue(aggConstant.раскрой(), elementValueConstant.раскрой(), idxList, numIdx)); 
}

public static КонстВыр GetInlineAsm(Тип ty, string asmString, string constraints, bool hasSideEffects, bool isAlignStack)
{  
	return new КонстВыр(LLVMConstInlineAsm(ty.MustHaveConstants().раскрой(), asmString, constraints, hasSideEffects, isAlignStack)); 
}
+/