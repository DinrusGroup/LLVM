module ll.c.Tools.all;

import ll.common, ll.c.Target;
import stdrus: вТкст0, объедини;

extern (C)
{
	цел ЛЛВхоФункцЛЛКомпилятора(inout ткст0* argv);
	цел ЛЛВхоФункцЛЛАр(in ткст0* argv);
	цел ЛЛВхоФункцЛЛАс(inout ткст0* argv);
	цел ЛЛВхоФункцЛЛКат(inout ткст0* argv);
	цел ЛЛВхоФункцЛЛРанлиб(ткст0* арги);
	ткст[] дайАргиКС();

}

/// = llc.exe
цел ЛЛКомпилятор(ткст[] арги)
{
	auto арги_ = дайАргиКС();
	if(арги_)
	{
		
		if(арги_.length == 2)
		{
			арги_ ~= "--help";
		}
		auto ксарги = cast(сим**) арги_;
		return ЛЛВхоФункцЛЛКомпилятора(ксарги);
	}
	else 
	{
		auto стр = cast(ткст0*) вТкст0(объедини(арги, " "));
		return ЛЛВхоФункцЛЛКомпилятора(стр);
	}
}


/// = llvm-ar.exe
цел ЛЛАрхиватор(ткст[] арги) 
{
	ткст0 марги;
	ткст[] арги_ = дайАргиКС();
	if(арги_)
	{
		const ткст ПомАр = "
			ОБЗОР: Архиватор LLVM (llvm-ar)

			ИСПОЛЬЗОВАНИЕ: llvm-ar [опции] [-]<операция>[модификаторы] [релпоз] [счёт] <архив> [файлы]
			llvm-ar -M [<mri-script]

			ОПЦИИ:
			--format              - Формат создаваемого архива
			=default            -   дефолт
			=gnu                -   gnu
			=darwin             -   darwin
			=bsd                -   bsd
			--plugin=<ткст>     - Игнорируется для совместимости
			--help                - Показать доступные опции
			--version             - Показать версию этой программы
			@<файл>               - Прочесть опции из <файла>

			ОПЕРАЦИИ:
			d - удалить [файлы] из архива
			m - переместить [файлы] в архив
			п - вывести [файлы], найденные в архиве
			q - быстро добавить [файлы] к архиву
			r - заменить или вставить [файлы] в архив
			s - действовать как ranlib
			т - показать содержимое архива
			x - извлечь [файлы] из архива

			МОДИФИКАТОРЫ:
			[a] - поместить [файлы] после [релпоз]
			[b] - поместить [файлы] перед [релпоз] (то же, что и [i])
			[c] - не предупреждать, если нужно создать архив
			[Д] - использовать ноль для штампов времени и uids/gids (дефолт)
			[i] - поместить [файлы] перед [релпоз] (то же, что и [b])
			[l] - игнорируется для совместимости
			[L] - добавить содержимое архива
			[N] - использовать [счёт] экземпляров имени
			[o] - сохранять оригинальные даты
			[P] - при сверке использовать полные имена (implied for thin archives)
			[s] - создать индексный указатель архива (cf. ranlib)
			[И] - не строить таблицу символов
			[Т] - создать тонкий архив
			[u] - обновить только [файлы] более новые, чем в архиве
			[U] - использовать актуальный штамп времени и uids/gids
			[v] - подробно излагать о предпринятых действиях
			";

		ЛЛНициализуйВсеИнфОЦели();
		ЛЛНициализуйВсеЦелевыеМК();
		ЛЛНициализуйВсеАсмПарсеры();
		
		марги =  cast(ткст0) арги[0..$];
		//выдай("Вызывается ЛЛВМ-АР").нс;
		if(арги.length < 2)
		{
			выдай(ПомАр).нс;
			return ЛЛВхоФункцЛЛАр(&марги);
		}
		else if(арги.length >= 3) return ЛЛВхоФункцЛЛАр(&марги);
	}
	else return ЛЛВхоФункцЛЛАр(&марги);

}

/// = llvm-as.exe
цел ЛЛАс(ткст[] арги)
{
	auto арги_ =cast(ткст0*) дайАргиКС();
	return ЛЛВхоФункцЛЛАс(арги_);
}

/// = llvm-cat.exe

цел ЛЛКат(ткст[] арги)
{
	auto арги_ =cast(ткст0*) дайАргиКС();
	if(арги_)	return ЛЛВхоФункцЛЛКат(арги_);
}


/// =  llvm-ranlib.exe
цел ЛЛРанлиб(ткст[] арги_) 
{
	const ткст ПомРанлиб ="
		ОБЗОР: LLVM Ranlib (llvm-ranlib)

		Эта программа генерирует индекс для ускорения доступа к архивам

		ИСПОЛЬЗОВАНИЕ: llvm-ranlib <файл-архива>

		ОПЦИИ:
		-help                             - Показать доступные опции
		-version                          - Показать версию этой программы
		";

	ЛЛНициализуйВсеИнфОЦели();
	ЛЛНициализуйВсеЦелевыеМК();
	ЛЛНициализуйВсеАсмПарсеры();

	ткст[] арги = дайАргиКС();
	ткст0 марги =  cast(ткст0) арги[0..$];
	//выдай("Вызывается ЛЛВМ-РАНЛИБ").нс;
	if(арги.length < 2 || арги[1] == "--help")
	{
		выдай(ПомРанлиб).нс;
		return ЛЛВхоФункцЛЛРанлиб(&марги);
	}
	else if(арги.length >= 2) return ЛЛВхоФункцЛЛРанлиб(&марги);
}

