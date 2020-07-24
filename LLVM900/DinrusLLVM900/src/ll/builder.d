
module ll.builder;

import stringz: вТкст0;
import ll.c.Core, ll.c.Types;

	class Построитель
	{
		public:

		this()
		{	
		this.постр = ЛЛСоздайПостроитель();
		}

		this(ЛЛКонтекст кт)
		{
			this.кт = кт;
				постр = ЛЛСоздайПостроительВКонтексте(this.кт);
		}

		~this(){ЛЛВыместиПостроитель(постр);}

		ЛЛБазовыйБлок дайБлокВставки()
		{
			return ЛДайБлокВставки(постр);
		}

		проц вставьСущБлокПосле(ЛЛБазовыйБлок бб)
		{
			ЛЛВставьСущБазБлокПослеБлокаВставки(постр, бб);
		}

		проц позиция(ЛЛБазовыйБлок блок, ЛЛЗначение инстр)
		{
			ЛЛПостроительПозиции(постр, блок, инстр);
		}

		проц позицияПеред(ЛЛЗначение инстр)
		{
			ЛЛПостроительПозицииПеред(постр, инстр);

		}

		проц позицияВКонце(ЛЛБазовыйБлок блок)
		{
			ЛЛПостроительПозицииВКонце(постр, блок);

		}

		проц очистьПозВставки()
		{
			ЛЛОчистиПозициюВставки(постр);
		}

		проц вставь(ЛЛЗначение инстр)
		{
			ЛЛВставьВПостроитель(постр, инстр);
		}

		проц вставьСИменем(ЛЛЗначение инстр, ткст имя)
		{
			ЛЛВставьВПостроительСИменем(постр, инстр, вТкст0(имя));
		}

		ЛЛМетаданные дайТекЛокОтладки()
		{
		 return ЛЛДайТекЛокОтладки2(постр);
		}

		проц устТекЛокОтладки(ЛЛМетаданные лок)
		{

		  ЛЛУстТекЛокОтладки2(постр, лок);
		}

		проц устТекЛокОтладки(ЛЛЗначение л)
		{
		 ЛЛУстТекЛокОтладки2(постр, л);
		}

		проц устТекЛокОтладкиИнстр(ЛЛЗначение инстр)
		{

		  ЛЛУстТекЛокОтладкиИнстр(постр, инстр);
		}

		ЛЛМетаданные дайДефПЗМатТэг()
		{
		 return ЛЛПостроитель_ДайДефПЗМатТег( постр);
		}

		проц устДефПЗМатТэг(ЛЛМетаданные тэгПЗМат )
		{
		 ЛЛПостроитель_УстДефПЗМатТег(постр, тэгПЗМат);
		}

		ЛЛЗначение стройВозврПроц()
		{
		 return ЛЛСтройВозврПроц(постр);
		}

		ЛЛЗначение стройВозвр(ЛЛЗначение зн)
		{
		 return ЛЛСтройВозвр(постр, зн);
		}

		ЛЛЗначение стройАгрегатВозвр(ЛЛЗначение *вЗн, бцел чло)
		{
		 return ЛЛСтройАгрегатВозвр(постр, вЗн,	чло);
		}

		ЛЛЗначение стройБр(ЛЛБазовыйБлок приёмник)
		{
		 return ЛЛСтройБр(постр, приёмник);
	    }

		ЛЛЗначение стройУсловнБр(ЛЛЗначение если, ЛЛБазовыйБлок то, ЛЛБазовыйБлок иначе)
		{
		 return ЛЛСтройУсловнБр(постр, если, то,  иначе);
		}

		ЛЛЗначение стройЩит(зн, ЛЛБазовыйБлок иначе, бцел члоСлуч)
		{
		return ЛЛСтройЩит(постр, З, иначе,  члоСлуч);
	    }

		ЛЛЗначение стройНепрямБр(ЛЛЗначение адр, бцел члоЦел)
		{
		 return ЛЛСтройНепрямБр(постр, адр, члоЦел);
		}


ЛЛЗначение стройИнвок(ЛЛТип тип, ЛЛЗначение фн,
                              ЛЛЗначение *арги, бцел члоАргов,
                              ЛЛБазовыйБлок то, ЛЛБазовыйБлок уловитель,
                              ткст имя)
{
	return ЛЛСтройИнвок2(постр, тип, фн, арги,  члоАргов, то,  уловитель,
                              вТкст0 (имя));
}

ЛЛЗначение стройНедоступн()
{
	return ЛЛСтройНедоступный(постр);
}

/* Обработка Исключений */

ЛЛЗначение стройВозобнови(ЛЛЗначение зн)
{
	return ЛЛСтройВозобнови( постр,  зн);
}

ЛЛЗначение стройЛПад(ЛЛТип тип,ЛЛЗначение персФн, бцел члоКлоз, ткст имя)
{
return ЛЛСтойЛэндингПад(постр,  тип, персФн,  члоКлоз, вТкст0 (имя));
}

ЛЛЗначение стройОчистиВозвр(ЛЛЗначение кэчПад, ЛЛБазовыйБлок бб)
{
 return ЛЛСтройОчистиВозвр(постр, кэчПад, бб);
}

ЛЛЗначение стройКэчВозвр(ЛЛЗначение кэчПад, ЛЛБазовыйБлок бб)
{
 return ЛЛСтройКэчВозвр(постр, кэчПад, бб);
}

ЛЛЗначение стройКэчПад(ЛЛЗначение родитПад, ЛЛЗначение *арги, бцел члоАргов,
                               ткст имя)
{
 return ЛЛСтройКэчПад(постр, родитПад, арги, члоАргов, вТкст0(имя));
}

ЛЛЗначение стройОчистиПад(ЛЛЗначение родитПад,ЛЛЗначение *арги, бцел члоАргов,
                                 ткст имя)
{
 return ЛЛСтройОчистиПад(постр, родитПад, арги, члоАргов, вТкст0 (имя));
}

ЛЛЗначение стройКэчЩит(ЛЛЗначение родитПад, ЛЛБазовыйБлок отмотББ,
                                  бцел члоОбров, ткст имя)
{
return ЛЛСтройКэчЩит(постр, родитПад,отмотББ, члоОбров, вТкст0(имя));
}


/* Арифметика */
ЛЛЗначение стройСложи(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
 return ЛЛСтройСложи( постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройНСВСложи(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildNSWAdd( постр, LHS, RHS, вТкст0(имя));
                             }
ЛЛЗначение стройНУВСложи(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildNUWAdd( постр, LHS, RHS, вТкст0(имя));
                             }

ЛЛЗначение стройПСложи(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
 return ЛЛСтройПСложи(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение  стройОтними(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройОтними(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение  стройНСВОтними(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildNSWSub(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройНУВОтними(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildNUWSub(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройПОтними(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройПОтними(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройУмножь(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройУмножь(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройНСВУмножь(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
	return LLBuildNSWMul(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройНУВУмножь(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
	return LLBuildNUWMul(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройПУмножь(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройПУмножь(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройБДели(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
	return ЛЛСтройБДели(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройТочноБДели(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройТочноБДели(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройЗДели(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройЗДели(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройТочноЗДели(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройТочноЗДели(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройПДели(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройПДели(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройУРем(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildURem(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройСРем(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildSRem(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройФРем(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildFRem(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройЛСдвиг(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildShl(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройЛПСдвиг(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildLShr(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройАПСдвиг(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return LLBuildAShr(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройИ(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройИ(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройИли(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройИли(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройИИли(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройИИли(постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройБинОп(ЛЛОпкод оп, ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
return ЛЛСтройБинОп(постр, оп, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройОтриц(ЛЛЗначение зн, ткст имя)
{
	return ЛЛСтройОтриц( постр, зн, вТкст0(имя));
}

ЛЛЗначение стройНСВОтриц(ЛЛЗначение зн, ткст имя)
{
	return LLBuildNSWNeg( постр, зн, вТкст0(имя));
}

ЛЛЗначение стройНУВОтриц(ЛЛЗначение зн, ткст имя)
{
	return LLBuildNUWNeg( постр, зн, вТкст0(имя));
}

ЛЛЗначение стройПОтриц(ЛЛЗначение зн, ткст имя)
{
	return ЛЛСтройПОтриц(постр, зн, вТкст0(имя));
}

ЛЛЗначение стройНе(ЛЛЗначение зн, ткст имя)
{
	return ЛЛСтройНе(постр, зн, вТкст0(имя));
}

/* Память */
ЛЛЗначение стройРазместпам(ЛЛТип зн, ткст имя)
{
	return ЛЛСтройРазместПам(постр, тип, вТкст0(имя));
}

ЛЛЗначение стройРазместпамМасс(ЛЛТип тип, ЛЛЗначение знач, ткст имя)
{
	return ЛЛСтройРазместПамМасс(постр, тип, знач, вТкст0(имя));
}

ЛЛЗначение стройУстпам(ЛЛЗначение укз, ЛЛЗначение знач, ЛЛЗначение длин,
                             бцел расклад)
{
	return ЛЛСтройУстПам(постр, укз, знач, длин, расклад);
}

ЛЛЗначение стройКопирпам(ЛЛЗначение приёмник, бцел расклЦели,
                             ЛЛЗначение исток, бцел раскладИсх,
                             ЛЛЗначение разм)
{
	return ЛЛСтройКопирПам(постр, приёмник,  расклЦели,исток, раскладИсх, разм);
}

ЛЛЗначение стройПереместпам(ЛЛЗначение приёмник, бцел расклЦели,
                              ЛЛЗначение исток, бцел раскладИсх,
                              ЛЛЗначение разм)
{
	return ЛЛСтройПреместПам(постр,  приёмник, расклЦели, исток, раскладИсх, разм);
}

ЛЛЗначение стройАллока(ЛЛТип тип, ткст имя)
{
	return ЛЛСтройАллока( постр,  тип, вТкст0(имя));
}

ЛЛЗначение стройАллокаМасс(ЛЛТип тип, ЛЛЗначение знач, ткст имя)
{
	return ЛЛСтройАллокаМасс(постр, тип, знач, вТкст0(имя));
}

ЛЛЗначение стройОсвободи(ЛЛЗначение значУкз)
{
	return ЛЛСтройОсвободи(постр, значУкз);
}

ЛЛЗначение стройЗагрузи(ЛЛЗначение значУкз, ткст имя)
{
	return ЛЛСтройЗагрузи(постр, значУкз, вТкст0(имя));
}

ЛЛЗначение стройЗагрузи(ЛЛТип тип, ЛЛЗначение значУкз, ткст имя)
{
	return ЛЛСтройЗагрузи2(постр, тип, значУкз, вТкст0(имя));
}

ЛЛЗначение стройСохрани(ЛЛЗначение знач, ЛЛЗначение укз)
{
	return ЛЛСтройСохрани(постр, знач, укз);
}


ЛЛЗначение стройУкНаЭлт(ЛЛЗначение указатель, ЛЛЗначение *индексы, бцел члоИндексов,
                          ткст имя)
{
	return ЛЛСтройУкНаЭлт(постр, указатель, индексы, члоИндексов, вТкст0(имя));
}

ЛЛЗначение стройУкНаЭлт(ЛЛТип тип, ЛЛЗначение указатель, ЛЛЗначение *индексы,
                           бцел члоИндексов, ткст имя)
{
	return  ЛЛСтройУкНаЭлт2(постр, тип, казатель, индексы, члоИндексов, вТкст0(имя));
}

ЛЛЗначение стройУкНаЭлтВПределах(ЛЛЗначение указатель,
                                  ЛЛЗначение *индексы, бцел члоИндексов,
                                  ткст имя)
{
	return ЛЛСтройУкНаЭлтВПределах(постр, указатель, индексы, члоИндексов,
                                   вТкст0(имя));
}

ЛЛЗначение стройУкНаЭлтВПределах(ЛЛТип тип,
                                   ЛЛЗначение указатель, ЛЛЗначение *индексы,
                                   бцел члоИндексов, ткст имя)
{
	return  ЛЛСтройУкНаЭлтВПределах2( постр,  тип, указатель, индексы,
                                    члоИндексов,  вТкст0(имя));
}

ЛЛЗначение стройУкНаЭлтСтрукт(ЛЛЗначение указатель, бцел инд, ткст имя)
{
	return ЛЛСтройУкНаЭлтСтрукт(постр, указатель, инд, вТкст0(имя));
}


ЛЛЗначение стройУкНаЭлтСтрукт(ЛЛТип тип, ЛЛЗначение указатель, бцел инд, ткст имя)
{
	return  ЛЛСтройУкНаЭлтСтрукт2(постр, тип, указатель, инд, вТкст0(имя));
}

ЛЛЗначение стройГлобТкст(ткст текст, ткст имя)
{
	return  ЛЛСтройГлобТкст(постр, вТкст0(текст), вТкст0(имя));
}

ЛЛЗначение стройГлобТкстУкз(ткст текст, ткст имя)
{
	return  ЛЛСтройГлобТкстУкз(постр, вТкст0(текст), вТкст0(имя));
}

// Приведение к типу (касты)

ЛЛЗначение стройОбрежь(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройОбрежь(постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройНРасш(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройНРасш(постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройЗРасш(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройЗРасш(постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройПлавВБцел(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройПЗвБЦ(постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройПлавВЦел(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройПЗвЗЦ( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройБцелВПлав(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройБЦвПЗ( постр,  знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройЦелВПлав(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройЗЦвПЗ(постр,  знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройПЗОбрежь(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройПЗОбрежь( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройПЗРасш(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройПЗРасш( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройУкВЦел(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройУкзВЦел(постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройЦелВУк(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройЦелВУкз( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройБитКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройБитКаст( постр,  знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройАдрПрострКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройАдрПрострКаст( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройНРасшИлиБитКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройНРасшИлиБитКаст( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройЗРасшИлиБитКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройЗРасшИлиБитКаст( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройОбрежьИлиБитКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройОбрежьИлиБитКаст( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройКаст(ЛЛОпкод оп, ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройКаст( постр, оп, знач, приёмнТип,  вТкст0(имя));
}

ЛЛЗначение стройУкКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройУказательКаст( постр, знач, приёмнТип, вТкст0(имя));
}

ЛЛЗначение стройЦелКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ЛЛБул соЗнаком_ли, ткст имя)
{
	return  ЛЛСтройЦелКаст2( постр,  знач, приёмнТип, соЗнаком_ли, вТкст0(имя));
}

ЛЛЗначение стройПлавКаст(ЛЛЗначение знач, ЛЛТип приёмнТип, ткст имя)
{
	return  ЛЛСтройПЗКаст( постр, знач, приёмнТип, вТкст0(имя));
}

/* Сравнения */
ЛЛЗначение стройЦелСравн(ЛЛЦелПредикат оп,
                           ЛЛЗначение LHS, ЛЛЗначение RHS,
                           ткст имя)
{
	return  ЛЛСтройЦСравн( постр, оп, LHS,  RHS, вТкст0(имя));
}

ЛЛЗначение стройПлавСравн(ЛЛПредикатРеала оп,
                           ЛЛЗначение LHS, ЛЛЗначение RHS,
                           ткст имя)
{
	return  ЛЛСтройПСравн(постр, оп, LHS,  RHS, вТкст0(имя));
}

/* Различные Инструкции */

ЛЛЗначение стройПхи(ЛЛТип тип, ткст имя)
{
	return  LLBuildPhi( постр, тип, вТкст0(имя));
}
// LLBuildCall is Депрекировано in favor of LLBuildCall2, in preparation for
// opaque pointer типы.
ЛЛЗначение стройВызов(ЛЛЗначение фн, ЛЛЗначение *арги, бцел члоАргов,
                           ткст имя)
{
	return  ЛЛСтройВызов( постр, фн, рги, члоАргов, вТкст0(имя));
}

ЛЛЗначение стройВызов(ЛЛТип тип, ЛЛЗначение фн, ЛЛЗначение *арги, бцел члоАргов,
                            ткст имя)
{
	return  ЛЛСтройВызов2( постр, тип, фн, арги, члоАргов, вТкст0(имя));
}

ЛЛЗначение стройВыбери(ЛЛЗначение если, ЛЛЗначение то, ЛЛЗначение иначе,
                             ткст имя)
{
	return  ЛЛСтройВыбери( постр, если, то, иначе, вТкст0(имя));
}

ЛЛЗначение стройВААрг(ЛЛЗначение список, ЛЛТип тип, ткст имя)
{
	return  ЛЛСтройВААрг( постр, список, тип, вТкст0(имя));
}

ЛЛЗначение стройИзвлекиЭлт(ЛЛЗначение векторнЗнач,ЛЛЗначение индекс, ткст имя)
{
	return  ЛЛСтройИзвлекиЭлт( постр, векторнЗнач, индекс, вТкст0(имя));
}

ЛЛЗначение стройВставьЭлт(ЛЛЗначение векторнЗнач,ЛЛЗначение значЭлта, ЛЛЗначение индекс,
                                    ткст имя)
{
	return  ЛЛСтройВставьЭлт( постр, векторнЗнач, значЭлта, индекс, вТкст0(имя));
}

ЛЛЗначение стройВекторЛСдвига(ЛЛЗначение зн1, ЛЛЗначение зн2, ЛЛЗначение маска,
                                    ткст имя)
{
	return  ЛЛСтройШафлВектор( постр, зн1, зн2, маска, вТкст0(имя));
}

ЛЛЗначение стройИзвлекиЗнач(ЛЛЗначение AggVal, бцел индекс, ткст имя)
{
	return  ЛЛСтройИзвлекиЗначение( постр, AggVal, индекс, вТкст0(имя));
}

ЛЛЗначение стройВставьЗнач(ЛЛЗначение AggVal, ЛЛЗначение значЭлта, бцел индекс,
                                  ткст имя)
{
	return  ЛЛСтройВставьЗначение( постр, AggVal, значЭлта, индекс, вТкст0(имя));
}

ЛЛЗначение стройПусто(ЛЛЗначение знач, ткст имя)
{
	return  ЛЛСтройПусто( постр, знач, вТкст0(имя));
}

ЛЛЗначение стройНеПусто(ЛЛЗначение знач, ткст имя)
{
	return  ЛЛСтройНеПусто( постр, знач, вТкст0(имя));
}

ЛЛЗначение СтройДельтаук(ЛЛЗначение LHS, ЛЛЗначение RHS, ткст имя)
{
	return  ЛСтройУкзДифф( постр, LHS, RHS, вТкст0(имя));
}

ЛЛЗначение стройЗабор(ЛЛАтомныйПорядок порядок, ЛЛБул однопоточен_ли, ткст имя)
{
	return  ЛЛСтройЗабор( постр, порядок, однопоточен_ли, вТкст0(имя));
}

ЛЛЗначение стройАтомРМВ(LLVMAtomicRMWBinOp оп,
                                ЛЛЗначение PTR, ЛЛЗначение знач,
                                ЛЛАтомныйПорядок порядок,
                                ЛЛБул однопоточен_ли)
{
	return  LLBuildAtomicRMW( постр, оп, PTR, знач, порядок, однопоточен_ли);
}

ЛЛЗначение стройАтомОбменСравни(ЛЛЗначение укз,
                                    ЛЛЗначение Cmp, ЛЛЗначение нов,
                                    ЛЛАтомныйПорядок порядокУспех,
                                    ЛЛАтомныйПорядок порядокСбой,
                                    ЛЛБул однопоточен_ли)
{
	return  LLBuildAtomicCmpXchg( постр, укз,Cmp, нов, порядокУспех,
                                     порядокСбой, однопоточен_ли);
}

private
{
	ЛЛПостроитель постр;
	ЛЛКонтекст кт;
}

}





