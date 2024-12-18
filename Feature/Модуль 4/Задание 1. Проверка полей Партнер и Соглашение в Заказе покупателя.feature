﻿#language: ru

@tree

Функционал: Проверка полей Партнер и Соглашение в Заказе покупателя


Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка полей Партнер и Соглашение в Заказе покупателя

*Проверка заполненности Партнер и Соглашение	
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы покупателей"
	Тогда открылось окно "Заказы покупателей"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно "Заказ покупателя (создание)"
	И я нажимаю кнопку выбора у поля с именем 'Partner'
	Тогда открылось окно "Партнеры"
	И в таблице 'List' я перехожу к строке:
		| 'Наименование'            |
		| 'Клиент 1 (1 соглашение)' |
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно "Заказ покупателя (создание) *"
	И я нажимаю на кнопку с именем 'FormWrite'
	И я запоминаю значение поля 'Номер' как "$Номер$"
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И в таблице "List" я перехожу к строке
		| 'Номер'   |
		| '$Номер$' |
	И в таблице 'List' я выбираю текущую строку
	Тогда элемент формы с именем "Partner" стал равен "Клиент 1 (1 соглашение)"
	Тогда элемент формы с именем "Agreement" стал равен "Соглашение с клиентами (расчет по документам + кредитный лимит)"

*Проверка блокировки поля Контрагент, если не выбран Партнер
	И я нажимаю на гиперссылку с именем 'DecorationGroupTitleCollapsedLabel'
	И я перехожу к следующему реквизиту
	И я нажимаю кнопку очистить у поля с именем 'Partner'
	И элемент формы с именем 'LegalName' присутствует на форме
	И элемент формы с именем 'LegalName' не доступен
	И я закрываю все окна клиентского приложения

			
	
	
		
		
	
	
	
		
