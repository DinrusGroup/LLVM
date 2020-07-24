module ll.api..Values.Instructions
{
    public class CmpInst : Instruction
    {
        internal CmpInst(LLVMValueRef instance)
            : base(instance)
        {
        }
    }
}