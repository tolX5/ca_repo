
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)

	//TODO: Вставить содержимое обработчика.
	ПараметрыФормы = Новый Структура("", );
	ОткрытьФорму("Отчет.УО_УниверсальныйОтчет.Форма.ФормаОтчета",
		ПараметрыФормы,
		ПараметрыВыполненияКоманды.Источник,
		ПараметрыВыполненияКоманды.Уникальность,
		ПараметрыВыполненияКоманды.Окно,
		ПараметрыВыполненияКоманды.НавигационнаяСсылка);

КонецПроцедуры