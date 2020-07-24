module ll.api.Attribute;


    public  class Attribute : IWrapper!(LLVMAttributeRef)
    {
       // LLVMAttributeRef IWrapper!(LLVMAttributeRef).ToHandleType { this._instance;

        private  LLVMAttributeRef _instance;

        this(LLVMAttributeRef attributeRef)
        {
            this._instance = attributeRef;
        }
    }

