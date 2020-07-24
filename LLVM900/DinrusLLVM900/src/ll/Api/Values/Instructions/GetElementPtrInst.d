module ll.api..Values.Instructions
{
    public sealed class GetElementPtrInst : Instruction
    {
        internal GetElementPtrInst(LLVMValueRef instance)
            : base(instance)
        {
        }
    }
}