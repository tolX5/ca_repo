#Область ОбработчикиСобытий

&НаКлиенте
Асинх Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды) 
	// Асинх т.к. в параметрах команды нет стандартного поведения системы или Отказа можно использовать Асинх
	
	// Если схема есть, спросим нужно ли перезаписать
	Если СхемаУжеЗагружена(ПараметрКоманды) Тогда
		Если Ждать ВопросАсинх("Схема есть в базе, перезаписать?", 
						РежимДиалогаВопрос.ДаНет, , 
						КодВозвратаДиалога.Нет, "Подтверждение") = КодВозвратаДиалога.Нет Тогда
			Возврат;
		КонецЕсли;
	КонецЕсли;
	
	// Уменьшаем нагрузку на переменную
	Параметры = Новый Структура("ЭтоГруппа, ТипИсточника, ПутьКИсточнику");
	
	Если ПараметрыВыполненияКоманды.Источник.имяФормы = "Справочник.УО_РегистрацияСхемы.Форма.ФормаЭлемента" Тогда
		// У объекта много св-в, читаем только нужные
		ЗаполнитьЗначенияСвойств(Параметры, ПараметрыВыполненияКоманды.Источник.Объект);
	Иначе	
		ЗаполнитьЗначенияСвойств(Параметры, ПараметрыВыполненияКоманды.Источник.Элементы.Список.ТекущиеДанные);
	КонецЕсли;
	
	Если Параметры.ЭтоГруппа Тогда
		Возврат;
	КонецЕсли;

	Если Параметры.ТипИсточника.Пустая() Тогда
		Возврат;
	КонецЕсли;

	Если ПустаяСтрока(Параметры.ПутьКИсточнику) Тогда
		Возврат;
	КонецЕсли;

	// Что бы избежать перехода на сервер
	ТипИсточникаСтр = "" + Параметры.ТипИсточника;

	Если ТипИсточникаСтр = "Файл" Тогда
		ЗагрузитьСхемуИзФайла(ПараметрКоманды, Параметры.ПутьКИсточнику);
	ИначеЕсли ТипИсточникаСтр = "Макет" Тогда
		СохранитьСхемуВБазе(ПараметрКоманды);
	КонецЕсли;
	
	Оповестить("ЗагруженаСхема", ПараметрКоманды);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
АСИНХ Процедура ЗагрузитьСхемуИзФайла(ПараметрКоманды, ПутьКИсточнику)

	Попытка
		Ответ = Ждать ПоместитьФайлНаСерверАсинх(,,,ПутьКИсточнику);
		СохранитьСхемуВБазе(ПараметрКоманды, Ответ.Адрес);
	Исключение
	 	ПредупреждениеАсинх("Файл не обнаружен");
	КонецПопытки;
	
КонецПроцедуры

&НаСервере
Процедура СохранитьСхемуВБазе(Знач Регистрация, Знач Адрес = Неопределено)
	
	РегистрыСведений.УО_ХранилищеСхем.ДобавитьСхему(Регистрация, Адрес);
	
КонецПроцедуры

//&НаСервере - если директива не указана --> то по умолчанию НаСервере
&НаСервере
Функция СхемаУжеЗагружена(Знач Регистрация) //Знач т.к. значение Параметра не нужно возвращать в вызывающую процедуру

	Возврат РегистрыСведений.УО_ХранилищеСхем.СхемаСуществует(Регистрация);
	
КонецФункции

#КонецОбласти
