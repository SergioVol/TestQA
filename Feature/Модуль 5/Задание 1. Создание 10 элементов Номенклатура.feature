﻿#language: ru

@tree

Функционал: Создание элементов справочника Номенклатура



Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание 10 элементов справочник Номенклатура
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Товар" + $Шаг$' в переменную "Товар"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                               | 'Description_en' | 'Description_ru' |
			| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '$Товар$'        | ''               |


	