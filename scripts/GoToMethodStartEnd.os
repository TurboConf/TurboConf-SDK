//@script_name GoToMethodStartEnd
//@script_display_name Перейти к началу/концу текущего метода
//@script_description Скрипт выполняет переход к началу/концу текущей процедуры/функции
//@script_author m.bolsun
//@script_developer_url http://turboconf.ru
//@script_section Навигация
//@script_hotkey Control+Alt+OemOpenBrackets ПерейтиКНачалуМетода
//@script_hotkey Control+Alt+OemCloseBrackets ПерейтиККонцуМетода
//@retain_clipboard 0
//@enterprise_mode 0
//@hide_actions 0

Процедура ПерейтиКНачалуМетода()

	Перейти(Истина);
	
КонецПроцедуры

Процедура ПерейтиККонцуМетода()
	
	Перейти(Ложь);
	
КонецПроцедуры

Процедура Перейти(КНачалуМетода)
	
	ТК = Новый ТурбоКонф; 
	
	ТК.Key(Keys.Home);
	
	ТК.ControlAltKey(Keys.P);
	
	Окно = ТК.ЖдатьОкно("Процедуры и функции", 2000, Истина, Ложь);
	
	ТК.Key(Keys.Enter);

	Если КНачалуМетода Тогда
	
		Возврат;
		
	КонецЕсли;

	ТК.ЖдатьЗакрытияОкна(Окно, "Процедуры и функции", 1000);

	ТК.ControlKey(Keys.OemCloseBrackets);

КонецПроцедуры


