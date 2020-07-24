module ll.api..Values.Instructions
{
    public sealed class ShuffleVectorInst : Instruction
    {
        internal ShuffleVectorInst(LLVMValueRef instance)
            : base(instance)
        {
        }
    }
}