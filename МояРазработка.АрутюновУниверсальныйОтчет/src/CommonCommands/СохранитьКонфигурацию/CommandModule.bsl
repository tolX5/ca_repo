#Область ОбработчикиСобытий

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	//TODO: Вставить содержимое обработчика.
	//ПараметрыФормы = Новый Структура("", );
	//ОткрытьФорму("ОбщаяФорма.", ПараметрыФормы, ПараметрыВыполненияКоманды.Источник, ПараметрыВыполненияКоманды.Уникальность, ПараметрыВыполненияКоманды.Окно, ПараметрыВыполненияКоманды.НавигационнаяСсылка);

  	Перем КодВозврата;
	//ЗапуститьПриложение(  для запуска стороннего приложения
	//КомандаСистемы(    аналогично
	
	#Если ТонкийКлиент ИЛИ ТолстыйКлиентОбычноеПриложение ИЛИ ТолстыйКлиентУправляемоеПриложение Тогда
		ЗапуститьСистему("DESIGNER /DumpCfg ""D:\мояИБ.cf""", Истина, КодВозврата);	
	#КонецЕсли

КонецПроцедуры

#КонецОбласти
