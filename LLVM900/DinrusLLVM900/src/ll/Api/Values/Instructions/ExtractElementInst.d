module ll.api..Values.Instructions
{
    public sealed class ExtractElementInst : Instruction
    {
        internal ExtractElementInst(LLVMValueRef instance)
            : base(instance)
        {
        }
    }
}