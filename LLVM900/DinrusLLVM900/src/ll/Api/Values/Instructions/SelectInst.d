module ll.api..Values.Instructions
{
    public sealed class SelectInst : Instruction
    {
        internal SelectInst(LLVMValueRef instance)
            : base(instance)
        {
        }
    }
}