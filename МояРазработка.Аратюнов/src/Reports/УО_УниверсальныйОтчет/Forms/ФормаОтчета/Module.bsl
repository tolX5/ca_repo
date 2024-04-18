#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// Вставить содержимое обработчика.
КонецПроцедуры

#КонецОбласти 

&НаКлиенте
Процедура ВыбратьСхему(Команда)

	ОбработчикВыбора = Новый ОписаниеОповещения("ПослеВыбораСхемы", ЭтотОбъект);
	ОткрытьФорму("Справочник.УО_РегистрацияСхемы.ФормаВыбора",,ЭтотОбъект,,,,ОбработчикВыбора);

КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораСхемы(РегистрацияСхемы, ДопПараметры) Экспорт
	
	// Блок проверки возможности исполнения алгоритма действия
	Если РегистрацияСхемы = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ИдентификаторСхемы = Строка(РегистрацияСхемы.УникальныйИдентификатор());
	Если ИдентификаторСхемы = КлючНазначенияИспользования Тогда
		Возврат;
	КонецЕсли;

	// Блок алгоритма действия
	Закрыть();
    // Открытие нового экземпляра этой же формы
	ОткрытьФорму("Отчет.УО_УниверсальныйОтчет.Форма", 
		Новый Структура("КлючНазначенияИспользования", ИдентификаторСхемы));
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Элементы.ФормаВыбратьСхему.Видимость = НЕ Параметры.КонтекстныйРежим;
КонецПроцедуры


