//@script_name SaveRestoreWindows
//@script_display_name Сохранение и восстановление открытых окон по хоткеям
//@script_description Сохраняет и восстанавливает состояние открытых окон между сеансами работы
//@script_author m.bolsun
//@script_developer_url http://turboconf.ru
//@script_url https://turboconf.ru/Forum/Details/1525#JumpToWindow
//@script_section Навигация
//@script_hotkey Control+Shift+D5 СохранитьСостояниеОкон
//@script_hotkey Control+Shift+D6 ВосстановитьСостояниеОкон
//@retain_clipboard 0
//@enterprise_mode 0

Перем ТурбоКонф;

Процедура СохранитьСостояниеОкон()

	ТурбоКонф.SaveWindowsState();
	
КонецПроцедуры

Процедура ВосстановитьСостояниеОкон()

	ТурбоКонф.RestoreWindowsState();
	
КонецПроцедуры

ТурбоКонф = Новый ТурбоКонф;


