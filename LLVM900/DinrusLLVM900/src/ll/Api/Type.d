module ll.api.Type;

import ll.c.Types, ll.c.Core;
import ll.api.typs.Composite.SequentialTypes.ArrayType;
import ll.api.typs.Composite.SequentialTypes.PointerType;
import ll.api.typs.Composite.SequentialTypes.VectorType;
import ll.api.typs.Composite.StructType;
import ll.api.typs.HalfType;
import ll.api.typs.DoubleType;
import ll.api.typs.FloatType;
import ll.api.typs.IntegerType;
import ll.api.typs.LabelType;
import ll.api.typs.FunctionType;
import ll.api.typs.X86FP80Type;
import ll.api.typs.X86MMXType;
import ll.api.typs.VoidType;
import ll.api.typs.FPType;
import ll.api.typs.PPCFP128Type;
import ll.api.typs.FP128Type;
import ll.api.Context;

    public abstract class Тип: Контекст
    {     

        package static Тип создай(ЛЛТип t)
        {
            if (t == null)
            {
                return null;
            }

            auto kind = ЛЛДайРодТипа(t);

            switch(kind)
			{
                case ЛЛРодТипа.Массив:
                    return new ТипМассив(t);
                
                case ЛЛРодТипа.Функция:
                    return  new ТипФункция(t);

                case ЛЛРодТипа.Указатель:
                    return new ТипУказатель(t);

                case ЛЛРодТипа.Структ:
                    return new ТипСтрукт(t);

                case ЛЛРодТипа.Вектор:
                    return new ТипВектор(t);

                case ЛЛРодТипа.Проц:
                    return new ТипПроц(t);

                case ЛЛРодТипа.Целое:
                    return new ТипЦелое(t);

                case ЛЛРодТипа.Пол:
                    return new Полутип(t);

                case ЛЛРодТипа.Плав:
                    return new ТипПлав(t);

                case ЛЛРодТипа.Дво:
					return new ТипДво(t);

				case ЛЛРодТипа.Х86_ПЗ80:
					return new ТипХ86ПЗ80(t);

				case ЛЛРодТипа.ПЗ128:
					return new ТипПЗ128(t);

				case ЛЛРодТипа.ППЦ_ПЗ128:
					return new ТипППЦПЗ128(t);

				case ЛЛРодТипа.Х86_ММХ:
					return new ТипХ86ММХ(t);

				case ЛЛРодТипа.Ярлык:
					return new ТипЯрлык(t);

                default:		
               // throw new NotImplementedException();
            }
        }

        public static ТипПроц проц()
		{
			return ГлобКонтекст.типПроц();
		}

        public static ТипЦелое цел1 ()
		{
			return ГлобКонтекст.типЦел1();
		}
        public static ТипЦелое цел8()
		{
			return ГлобКонтекст.типЦел8();
		}
        public static ТипЦелое цел16()
		{ 
			return ГлобКонтекст.типЦел16();
		}
        public static ТипЦелое цел32()
		{
			return ГлобКонтекст.типЦел32();
		}
        public static ТипЦелое цел64()
		{
			return ГлобКонтекст.типЦел64();
		}
        public static ТипЦелое цел(бцел длинаБит)
		{
			return ГлобКонтекст.типЦел(длинаБит);
		}

        public static Полутип пол()
		{
			return ГлобКонтекст.полутип();
		}
        public static ТипПлав плав()
		{ 
			return ГлобКонтекст.типПлав();
		}
        public static ТипДво дво()
		{ 
			return ГлобКонтекст.типДво();
		}
        public static ТипХ86ПЗ80 х86ПЗ80()
		{
			return ГлобКонтекст.типХ86ПЗ80();
		}
        public static ТипПЗ128 пз128 ()
		{
			return ГлобКонтекст.FP128Type;
		}
        public static ТипППЦПЗ128 пПЦПЗ128()
		{
			return ГлобКонтекст.типППЦПЗ128;
		}

        private ЛЛТип экземпл;

        this(ЛЛТип типРеф) { this.экземпл = типРеф;}

		public ЛЛТип раскрой()
		{
			return this.экземпл;
		}
        
        public ткст выведи() 
		{
			return вТкст(ЛЛВыведиТипВСтроку(this.раскрой()));
		}

        public проц дамп()
		{ 
			ЛЛДампТипа(this.раскрой());
		}

        public Контекст контекст()
		{
			return new Контекст(ЛЛДайКонтекстТипа(this.раскрой()));
		}

        public бул пз_ли()
		{ 
			return this is ТипПЗ;
		}

        public бул цел_ли()
		{ 
			return this is ТипЦелое;
		}
		/+
        public бул IsIntegerTypeOfWidth(бцел битШирина)
		{ 
			return this is ТипЦелое t && t.битШирина == битШирина;
		}
+/
        public бул векторИлиТипИз(TType)
		{ 
			return this.типСкаляр is cast(Тип) TType;
		}

        public /*virtual*/ бул пуст_ли()		{ return false;}

        public /*virtual*/ бул типПервКласса_ли()		{ return true;}

        public /*virtual*/ бул типСОднимЗначением_ли()		{ return false;}

      //  public бул агрегат_ли()		{ return this is IAggregateType;}

        public бул сРазмером_ли()
		{ 
			return ЛЛТипСРазмером_ли(this.раскрой());
		}

        public /*virtual*/ бцел примитивнРазмерВБитах()		{return  0;}

        public бцел скалярнРазмВБитах ()
		{
			return  this.типСкаляр.примитивнРазмерВБитах;
		}

        public бул целИлиЦелВектор()
		{
			return  this.типСкаляр is ТипЦелое;
		}
/+
        public бул целИлиЦелВектор(бцел битШирина)
		{
			return (this.типСкаляр is ТипЦелое t && t.битШирина == битШирина);
		}
+/
        public /*virtual*/ Тип типСкаляр()	{return  this;}

        public ТипУказатель типУк()
		{
			return  this.типУкВАдрПрострве(0);
		}

        public ТипУказатель типУкВАдрПрострве(бцел адреснПрострво)
		{
			return  new ТипУказатель(this, адреснПрострво);
		}

        public /*virtual*/ бул можетИметьКонстанты() {return  true;}

        public /*virtual*/ бул можетИметьВекторы() {return  true;}

        public /*virtual*/ bool можетИметьМассивы() {return  true;}

        protected package /*virtual*/ ткст дайСообОБезразмерномТипе()
		{
		//	return  $"The тип {this.имя} does not have a size or alignment.";
		}

        protected package /*virtual*/ ткст дайСообОбОграниченномТипе() { return ткст.init;}

      //  public /*virtual*/ ткст имя() {return  this.дайТип().имя;}
/+
        public override string ToString()
		{
			return  !string.IsNullOrEmpty(this.имя) ? this.имя super.ToString();
		}

        public bool Equals(Type other)
		{
			return  ReferenceEquals(other, null) ? false : this.экземпл == other.экземпл;
		}

        public override bool Equals(object obj) 
		{
			return  this.Equals(obj as Type);
		}

        public static bool operator ==(Type op1, Type op2)
		{
			return  (ReferenceEquals(op1, null) && ReferenceEquals(op2, null)) || op1.Equals(op2);
		}

        public static bool operator !=(Type op1, Type op2)
		{
			return  !(op1 == op2);
		}

        public override int GetHashCode()
		{
			return  this.экземпл.GetHashCode();
		}
		+/
    }

