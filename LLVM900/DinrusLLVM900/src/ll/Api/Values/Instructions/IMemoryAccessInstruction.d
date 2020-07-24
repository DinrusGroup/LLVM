module ll.api..Values.Instructions
{
    public interface IMemoryAccessInstruction
    {
        bool IsVolatile { get; set; }
    }
}
