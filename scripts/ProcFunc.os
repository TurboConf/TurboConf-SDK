//@script_name ProcFunc
//@script_display_name Процедура <-> Функция
//@script_description Преобразует процедуру в функцию и обратно
//@script_author m.bolsun
//@script_developer_url turboconf.ru
//@script_url https://turboconf.ru/Forum/Details/1528#ProcFunc
//@script_section Рефакторинг
//@script_hotkey Alt+S ИзменитьМетод Процедура <-> Функция
//@turbomenu 1
//@turbobutton 1
//@retain_clipboard 1
//@enterprise_mode 0
//@hide_actions 1
//@script_version 5

//Улучшенная версия скрипта @nytlenc "Из процедуры в функцию и обратно"

//Изменено m.bolsun 22.11.18 Скрипт теперь работает, если курсор находится в любом месте метода, а не только в самом начале или конце.
//Изменено m.bolsun 20.06.19 Добавлена всплывающая подсказка после замены

Процедура ИзменитьМетод()

	ТК = Новый ТурбоКонф; 

	Поз = 0;
	ВыделенныйТекст = "";

	ТК.Key(Keys.Home);

	ТК.ControlAltKey(Keys.P);
	
	Окно = ТК.ЖдатьОкно("Процедуры и функции", 2000, Истина, Ложь);

	ТК.Key(Keys.Enter);

	ТК.ЖдатьЗакрытияОкна(Окно, "Процедуры и функции", 1000);

	ТК.ControlShiftKey(Keys.OemCloseBrackets);
	
	Текст = ТК.ПолучитьТекстМодуля(ВыделенныйТекст, Поз); 

	РегВыражениеНачало = Новый РегулярноеВыражение("^(процедура|procedure|функция|function)\b");
	РегВыражениеНачало.ИгнорироватьРегистр = Истина;
	
	Совпадения = РегВыражениеНачало.НайтиСовпадения(ВыделенныйТекст);
	
	Если Совпадения.Количество() = 0 Тогда
		
		Возврат;	
	
	КонецЕсли;

	НачалоМетода = НРег(Совпадения[0].Группы[1].Значение);

	СтрокаЗаменыНачало = "";
	СтрокаЗаменыКонец = "";

	Если НачалоМетода = "функция" Тогда
		СтрокаЗаменыНачало = "Процедура";
		СтрокаЗаменыКонец = "КонецПроцедуры";
	ИначеЕсли НачалоМетода = "function"	Тогда	
		СтрокаЗаменыНачало = "Procedure";
		СтрокаЗаменыКонец = "EndProcedure";
	ИначеЕсли НачалоМетода = "процедура" Тогда		
		СтрокаЗаменыНачало = "Функция";
		СтрокаЗаменыКонец = "КонецФункции";
	ИначеЕсли НачалоМетода = "procedure" Тогда		
		СтрокаЗаменыНачало = "Function";
		СтрокаЗаменыКонец = "EndFunction";				
	КонецЕсли;

	ТекстПослеЗамены = РегВыражениеНачало.Заменить(ВыделенныйТекст, СтрокаЗаменыНачало);

	РегВыражениеКонец = Новый РегулярноеВыражение("\b(конецпроцедуры|endprocedure|конецфункции|endfunction)");
	РегВыражениеНачало.ИгнорироватьРегистр = Истина;

	ТекстПослеЗамены = РегВыражениеКонец.Заменить(ТекстПослеЗамены, СтрокаЗаменыКонец);
	
	ТК.ВставитьТекст(ТекстПослеЗамены);

	ТК.ПоказатьПодсказку("Выполнено преобразование " + Совпадения[0].Группы[1].Значение + "->" + СтрокаЗаменыНачало);

КонецПроцедуры