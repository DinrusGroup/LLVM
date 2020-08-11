module ll.api.Metadata;

import ll.c.Types, ll.c.Core;
import ll.api.Value;
import ll.api.Context;
import ll.common;

alias ll.api.Value.Значение МДУзел;

public static МДУзел дайМДУзел(Значение[] значения)
{ 
	ЛЛЗначение[] знач;
	foreach(зн; значения)
	{
		знач ~= зн.раскрой();
	}
	return new МДУзел(ЛЛМДУзел(cast(ЛЛЗначение*)&знач, знач.length));
}

public class МДТкст:Значение
{
	private ЛЛЗначение экземпл;

	this(ЛЛЗначение зн)
	{
		super(зн);
		this.экземпл = зн;
	}

	public ЛЛЗначение раскрой()
	{
		return this.экземпл;
	}

	public this(ткст т)
	{
		this(ЛЛМДТкст(вТкст0(т), т.length));
	}

	public this(Контекст контекст, ткст str)
	{ 
		this(ЛЛМДТкстВКонтексте(контекст.раскрой(), вТкст0(str), cast(бцел)str.length));
	}
/+
	public override ткст вТкст()
	{

		бцел* длинa;		
		return ll.common.вТкст(ЛЛДайМДТкст(this.раскрой(), длина));

	}
+/
}