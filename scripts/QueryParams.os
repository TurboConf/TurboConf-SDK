//@script_name SetQueryParameters
//@script_display_name Установить параметры запроса
//@script_description Вставляет в модуль шаблон для установки параметров запроса
//@script_url https://turboconf.ru/Forum/Details/1524#SetQueryParameters
//@script_section Генераторы кода
//@script_author m.bolsun
//@script_developer_url http://turboconf.ru
//@script_version 3

//Скрипт будет вызываться по Control+Shift+Q
//@script_hotkey Control+Shift+Q

//Восстанавливать буфер обмена после завершения скрипта
//@retain_clipboard 1

//Скрипт доступен в режиме Предприятия
//@enterprise_mode 1

//Скрывать манипуляции с конфигуратором
//@hide_actions 1

//Изменен m.bolsun 12.11.18

Процедура ВставитьШаблонУстановкиПараметров()
	
	ТК = Новый ТурбоКонф; 

	Поз = 0;
	ВыделенныйТекст = "";
	
	Текст = ТК.ПолучитьТекстМодуля(ВыделенныйТекст, Поз); 
	
	//Отсекаем текст ниже от курсора
	Текст = Лев(Текст, Поз);
	
	//Ищем начало запроса
	РегВыражение = Новый РегулярноеВыражение("""[\s|]*(?:выбрать|select)");
	
	РегВыражение.ИгнорироватьРегистр = Истина;
	
	Совпадения = РегВыражение.НайтиСовпадения(Текст);
	
	Если Совпадения.Количество() = 0 Тогда
		
		Возврат;	
	
	КонецЕсли;
	
	//Берем последнее совпадение, это начало искомого текста запроса

	ТекстЗапроса = Сред(Текст, Совпадения[Совпадения.Количество()-1].Индекс);

	//Ищем параметры
	
	//Найти все сопадения, которые начинаются с символа & и следующими за ним буквами, цифрами и _
	//Имя параметра поместить в группу
	РегВыражение = Новый РегулярноеВыражение("&([\w\d_]+)");
	
	Совпадения = РегВыражение.НайтиСовпадения(ТекстЗапроса);
	
	Если Совпадения.Количество() = 0 Тогда
		
		Возврат;	
	
	КонецЕсли;
		
	//Заполняем список только уникальными параметрами

	Параметры = Новый СписокЗначений;

	Для каждого Совпадение Из Совпадения Цикл
		
		Параметр = Совпадение.Группы[1].Значение;
		
		Если Параметры.НайтиПоЗначению(Параметр) = Неопределено Тогда
			Параметры.Добавить(Параметр);
		КонецЕсли;
	
	КонецЦикла;

	ИмяЗапроса = "Запрос";
	Отступ = "";
	
	//Ищем имя запроса

	РегВыражение = Новый РегулярноеВыражение("(?<ident>[\t ]*)(?<queryName>[\w\d_]+)\s*=\s*(?:новый|new)\s*(?:запрос|query)");
	
	РегВыражение.ИгнорироватьРегистр = Истина;
	
	Совпадения = РегВыражение.НайтиСовпадения(Текст);

	Если Совпадения.Количество() > 0 Тогда
		
		//Берем последнее совпадение, это искомое имя запроса
	
		Отступ = Совпадения[Совпадения.Количество()-1].Группы[1].Значение;
		ИмяЗапроса = Совпадения[Совпадения.Количество()-1].Группы[2].Значение;		
	
	КонецЕсли;	

	//Формируем текст для вставки

	ТекстШаблона = "";

	//Вариант без переноса строки в конце блока
	Для Счетчик=0 По Параметры.Количество()-1 Цикл
		
		Параметр = Параметры[Счетчик];

		ТекстШаблона = ТекстШаблона + Отступ + ИмяЗапроса + ".УстановитьПараметр(""" + Параметр.Значение + """, "+Параметр.Значение+");";

		Если Счетчик < Параметры.Количество() - 1 Тогда		
			ТекстШаблона = ТекстШаблона + Символы.ПС;
		КонецЕсли;

	КонецЦикла;
	
	// Для каждого Параметр Из Параметры Цикл
		
	// 	ТекстШаблона = ТекстШаблона + Отступ + ИмяЗапроса + ".УстановитьПараметр(""" + Параметр.Значение + """, "+Параметр.Значение+");";
	// 	ТекстШаблона = ТекстШаблона + Символы.ПС;
	
	// КонецЦикла;

	//Устанавливаем отступ первой строки

	РегВыражение = Новый РегулярноеВыражение("\n[ \t]*$");
	РегВыражение.Многострочный = Ложь;

	Если Не РегВыражение.Совпадает(Текст) Тогда
		ТК.Клавиша(Keys.End);
		ТК.Клавиша(Keys.Enter);
	Иначе
		ТК.Клавиша(Keys.Up);
		ТК.Клавиша(Keys.End);
		ТК.Клавиша(Keys.Enter);
	КонецЕсли;

	ТК.ВставитьТекст(СокрЛ(ТекстШаблона));
	ТК.Клавиша(Keys.Enter);

КонецПроцедуры

ВставитьШаблонУстановкиПараметров();
