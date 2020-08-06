module ll.common;

public import io.Stdout;
public import text.convert.Layout, text.convert.Format;
public import stdrus: вТкст, вТкст0;
alias Стдвыв выдай;
alias Стдвыв.форматнс выдайфнс;
alias Формат фм;

проц ошибнс(ткст ткт){Стдош(ткт).нс;}
проц скажи(ткст ткт){выдай(ткт);}
проц скажи(цел ч){выдай.форматируй("{}", ч);}
проц скажинс(ткст ткт){выдай(ткт).нс;}
проц нс(){выдай("").нс;}
проц таб(){выдай("\t");}

