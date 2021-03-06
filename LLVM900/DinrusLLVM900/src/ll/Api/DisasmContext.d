module ll.api.DisasmContext;

import ll.c.Disassembler;
import ll.c.Types;
import ll.c.DisassemblerTypes;
/*
    import ЛЛОбрвызОпИнфо = System.Func<System.ук, ulong, ulong, ulong, int, System.ук, int>;
    import ЛЛОбрвызПоискСимвола = System.Func<System.ук, ulong, ulong, System.Tuple<System.ук, ulong, System.ук>>;
*/
    public class КонтекстДизасма 
    {
        /+
        private class SymbolLookupClosure
        {
            private ЛЛОбрвызПоискСимвола _обрвыз;

            public this(ЛЛОбрвызПоискСимвола c)
            {
                this._обрвыз = c;
            }

            public ук Invoke(ук инфоДиз, бдол значСсылки, out бдол типСсылки, бдол ссылПК, out ук имяСсылки)
            {
                auto r = this._обрвыз(инфоДиз, значСсылки, ссылПК);
                типСсылки = r.Item2;
                имяСсылки = r.Item3;
                return r.Item1;
            }
        }
        
        public static КонтекстДизасма создайДизасм(ткст имяТриады, ук дизИнфо, int типТэга, ЛЛОбрвызОпИнфо дайОпИнфо,
                                           ЛЛОбрвызПоискСимвола поискСимвола)
        {
            auto opInfoCallback = new ЛЛОбрвызОпИнфо(дайОпИнфо);
            auto symbolCallback = new ЛЛОбрвызПоискСимвола(new SymbolLookupClosure(поискСимвола).Invoke);
            auto disasmContext =
                ЛЛСоздайДизасм(имяТриады, дизИнфо, типТэга, opInfoCallback, symbolCallback);
            disasmContext._opInfoCallback = opInfoCallback;
            return disasmContext;
        }

        public static КонтекстДизасма создайДизасмЦПБ(ткст триада, ткст цпб, ук дизИнфо, int типТэга, ЛЛОбрвызОпИнфо дайОпИнфо,
                                            ЛЛОбрвызПоискСимвола поискСимвола)
        {
            auto opInfoCallback = new ЛЛОбрвызОпИнфо(дайОпИнфо);
            auto symbolCallback = new ЛЛОбрвызПоискСимвола(new SymbolLookupClosure(поискСимвола).Invoke);
            auto disasmContext = 
                ЛЛСоздайДизасмЦПБ(триада, цпб, дизИнфо, типТэга, opInfoCallback, symbolCallback);
            disasmContext._opInfoCallback = opInfoCallback;
            disasmContext._symbolLookupCallback = symbolCallback;
            return disasmContext;
        }

        public static КонтекстДизасма создайФичиДзасмЦПБ(ткст триада, ткст цпб, ткст features, ук дизИнфо,
                                                     int типТэга, ЛЛОбрвызОпИнфо дайОпИнфо,
                                                     ЛЛОбрвызПоискСимвола поискСимвола)
        {
            auto opInfoCallback = new ЛЛОбрвызОпИнфо(дайОпИнфо);
            auto symbolCallback = new ЛЛОбрвызПоискСимвола(new SymbolLookupClosure(поискСимвола).Invoke);
            auto disasmContext = ЛЛСоздайДизасмЦПБФичи(триада, цпб, features, дизИнфо, типТэга, opInfoCallback, symbolCallback);
            disasmContext._opInfoCallback = opInfoCallback;
            disasmContext._symbolLookupCallback = symbolCallback;
            return disasmContext;
        }
+/
        private ЛЛКонтекстДизасма экземпл;
        private ЛЛОбрвызОпИнфо _opInfoCallback;
        private ЛЛОбрвызПоискСимвола _symbolLookupCallback;

        this(ЛЛКонтекстДизасма экзэмпл)
        {
            this.экземпл = экзэмпл;
        }

        public ЛЛКонтекстДизасма раскрой()
		{
            return this.экземпл;
		}

        ~this()
        {
            ЛЛВыместиДизасм(this.экземпл);
        }

        public цел устОпцииДизасма(бдол опции)
		{
			return ЛЛУстОпцииДизасм(this.раскрой(), опции);
		}
/+
        public Tuple!(ткст, int) инструкцииДизасма(byte[] instructionBytes, ulong programCounter)
        {
            fixed(byte* iptr = &instructionBytes[0])
            {
                auto outputBuffer = new byte[1024];
                fixed(byte* optr = &outputBuffer[0])
                {
                    auto count = ЛЛИнструкцияДмзасм(this.раскрой(), new ук(iptr), cast(ulong)instructionBytes.длина, programCounter, new ук(optr), new size_t(outputBuffer.длина));
                    auto text = new UTF8Encoding().GetString(outputBuffer, 0, outputBuffer.длина);
                    return new Tuple<ткст, int)(text, count.Pointer.ToInt32());
                }
            }
        }
    +/
    }

