module ll.api..Values.Instructions
{
    public class UnaryInstruction : Instruction
    {
        internal UnaryInstruction(LLVMValueRef instance)
            : base(instance)
        {
        }
    }
}