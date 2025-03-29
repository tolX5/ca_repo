#Область ОбработчикиСобытий

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	Параметры = Новый Структура("ЭтоГруппа");
	Если ПараметрыВыполненияКоманды.Источник.ИмяФормы = "Справочник.УО_РегистрацияСхемы.Форма.ФормаЭлемента" Тогда
		ЗаполнитьЗначенияСвойств(Параметры, ПараметрыВыполненияКоманды.Источник.Объект);
	Иначе
		ЗаполнитьЗначенияСвойств(Параметры, ПараметрыВыполненияКоманды.Источник.Элементы.Список.ТекущиеДанные);
	КонецЕсли;
	
	Если Параметры.ЭтоГруппа Тогда
		Возврат;
	КонецЕсли;
			
	#Если ТолстыйКлиентУправляемоеПриложение Тогда
		Конструктор = Новый КонструкторСхемыКомпоновкиДанных;
		Схема = СхемаКомпоновкиДанных(ПараметрКоманды);
		Если Схема <> Неопределено Тогда
			Конструктор.УстановитьСхему(Схема);
		КонецЕсли;
		Обработчик = ПолучитьФорму("РегистрСведений.УО_ХранилищеСхем.Форма.ОбработчикСохраненияСхемы",
									Новый Структура("РегистрацияСхемы", ПараметрКоманды));
		Конструктор.Редактировать(Обработчик);
	#Иначе
		ПредупреждениеАсинх("Конструктор доступен только в толстом клиенте.
		|Редактор для тонкого и веб клиента в разработке");
	#КонецЕсли

КонецПроцедуры

&НаСервере
Функция СхемаКомпоновкиДанных(Знач РегистрацияСхемы)
	
	Возврат РегистрыСведений.УО_ХранилищеСхем.Схема(РегистрацияСхемы)
	
КонецФункции

#КонецОбласти
