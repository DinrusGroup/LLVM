/*===-- llvm-c/BitReader.h - BitReader Библиотека C Interface ------*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Идентификатор2: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* Этот модуль декларирует Си интерфейс к libLLVMBitReader.a, который         *|
|* реализует ввод в формате биткода LLVM.                                     *|
\*===----------------------------------------------------------------------===*/

module ll.c.BitReader;
import ll.c.Types;

	extern (C) {


	/**
	 * @defgroup LLVMCBitReader Читатель Битов
	 * @ingroup LLVMC
	 *
	 * @{
	 */

	/* Строит модуль из биткода в заданном буфере памяти, возвращая
	   ссылку на модуль через параметр выхМод. При успехе возвращает 0.
	   Дополнительно возвращает читабельное сообшение об ошибке через выхСооб.

	   Депрекирован. Используйте LLVMParseBitcode2. */
	ЛЛБул ЛЛРазбериБиткод(ЛЛБуферПамяти буфПам, ЛЛМодуль* выхМод,
							  ткст0 *выхСооб);

	/* Строит модуль из биткода в заданном буфере памяти, возвращая
	   ссылку на модуль через параметр выхМод. При успехе возвращает 0. */
	ЛЛБул ЛЛРазбериБиткод2(ЛЛБуферПамяти буфПам,
							   ЛЛМодуль *выхМод);

	/* Депрекирован. Используйте LLVMParseBitcodeInContext2. */
	ЛЛБул ЛЛРазбериБиткодВКонтексте(ЛЛКонтекст кткст,
									   ЛЛБуферПамяти буфПам,
									   ЛЛМодуль *выхМод, ткст0* выхСооб);

	ЛЛБул ЛЛРазбериБиткодВКонтексте2(ЛЛКонтекст кткст,
										ЛЛБуферПамяти буфПам,
										ЛЛМодуль *выхМод);

	/** Считывает модуль по указанному пути, возвращая через параметр выхСооб
		модуль-провайдер, который выполняет ленивую десереализацию. При успехе возвращает 0.
		Дополнительно возвращает читабельное сообшение об ошибке через выхСооб.
		Депрекирован. Используйте LLVMGetBitcodeModuleInContext2. */
	ЛЛБул ЛЛДайБиткодМодульВКонтексте(ЛЛКонтекст кткст,
										   ЛЛБуферПамяти буфПам,
										   ЛЛМодуль *выхСооб, ткст0 *выхСооб);

	/** Считывает модуль по указанному пути, возвращая через параметр выхСооб
		модуль-провайдер, который выполняет ленивую десереализацию. При успехе возвращает 0. */
	ЛЛБул ЛЛДайБиткодМодульВКонтексте2(ЛЛКонтекст кткст,
											ЛЛБуферПамяти буфПам,
											ЛЛМодуль *выхСооб);

	/* Депрекирован. Используйте LLVMGetBitcodeModule2. */
	ЛЛБул ЛЛДайБиткодМодуль(ЛЛБуферПамяти буфПам, ЛЛМодуль *выхСооб,
								  ткст0 *выхСооб);

	ЛЛБул ЛЛДайБиткодМодуль2(ЛЛБуферПамяти буфПам, ЛЛМодуль *выхСооб);


	}