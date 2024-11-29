﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Изменение количества во всех сроках таблицы
	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
		И в таблице "ItemList" в поле "Количество" я ввожу текст "10,000"
		

Сценарий: Удаление строк
	И пока в таблице "ItemList" количество строк ">" 0 Тогда
		И в таблице "ItemList" я удаляю строку
		
Сценарий: Изменение вида цен по условиям
	И для каждой строки таблицы "ItemList" я выполняю
		Если таблица "ItemList" содержит строки Тогда:
			| 'Номенклатура'             | 'Характеристика'          | 'Вид цены'          |
			| 'Товар с характеристиками' | 'S/Красный'               | 'Цена поставщика 2' |
			И в таблице "ItemList" я перехожу к строке
				| 'Номенклатура'             | 'Характеристика'          | 'Вид цены'          |
				| 'Товар с характеристиками' | 'S/Красный'               | 'Цена поставщика 2' |		
			И в таблице 'ItemList' я выбираю текущую строку
			И в таблице 'ItemList' я нажимаю кнопку выбора у реквизита с именем 'ItemListPriceType'
			Тогда открылось окно "Виды цен"
			И в таблице 'List' я перехожу к строке:
				| "Валюта" | "Код" | "Наименование" | "Ссылка" |
				| "USD"    | "2"   | "Опт"          | "Опт"    |
			И в таблице "List" я выбираю текущую строку
	Если таблица "ItemList" содержит строки Тогда:
			| 'Номенклатура'             | 'Характеристика'          | 'Вид цены'          |
			| 'Товар с характеристиками' | 'S/Красный'               | 'Цена поставщика 2' |

	Сценарий: Перебор элементов справочника Номенклатура
		И в таблице "List" я перехожу к первой строке
		И для каждой строки таблицы "List" я выполняю
			И в таблице "List" я выбираю текущую строку
			Тогда не появилось окно предупреждения системы
			И я закрываю текущее окно
			
	Сценарий: Создание большого объема данных 
		И я запоминаю значение выражения '1' в переменную "Шаг"
		И я делаю 10 раз
			И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
			И Я запоминаю значение выражения '"Ед. изм." + $Шаг$' в переменную "ЕдиницаИзмерения"
			И я проверяю или создаю для справочника "Units" объекты:
		| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |       | ''     | 1          | ''          | ''    | '$ЕдиницаИзмерения$'             | ''                 | ''               | ''               |          |          |          |          |         |


		 					
		
			



