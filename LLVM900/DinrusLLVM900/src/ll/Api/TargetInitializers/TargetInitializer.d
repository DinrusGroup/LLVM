module ll.c.api.TargetInitializers.TargetInitializer;

public{
import ll.c.api.TargetInitializers.IAsmParser;
import ll.c.api.TargetInitializers.ITarget;
import ll.c.api.TargetInitializers.ITargetInfo;
import ll.c.api.TargetInitializers.ITargetMC;
import ll.c.api.TargetInitializers.IAsmPrinter;
import ll.c.api.TargetInitializers.IDisassembler;
}

    public abstract class TargetInitializer
    {
        this(){}

        public void All()
        {
            if (this is ITarget t)
            {
                t.Target();
            }
            if (this is ITargetInfo ti)
            {
                ti.TargetInfo();
            }
            if (this is ITargetMC tmc)
            {
                tmc.TargetMC();
            }
            if (this is IAsmParser apar)
            {
                apar.AsmParser();
            }
            if (this is IAsmPrinter aprnt)
            {
                aprnt.AsmPrinter();
            }
        }
    }

