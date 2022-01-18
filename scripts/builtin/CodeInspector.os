//@script_name CodeInspector
//@script_display_name Инспектор кода
//@script_description Проверка кода на скрытые ошибки
//@script_author m.bolsun
//@script_developer_url http://turboconf.ru
//@script_url https://turboconf.ru/Forum/Details/1526#CodeInspector
//@script_section CodeInspector
//@script_hotkey Control+I
//@retain_clipboard 0
//@enterprise_mode 1
//@hide_actions 0
//@text_documents_only 1

//09.07.20 @mbolsun Добавлена поддержка Bsl-Language-Server

ТурбоКонф = Новый ТурбоКонф;

Если ТурбоКонф.BslAnalyzeEnabled Тогда
	
	СкриптПроверкиПоУмолчанию = "settings/BslServer/BslServerDefault.os";
	ПользовательскийСкриптПроверки = "settings/BslServer/BslServer.os";
	
	Файл = Новый Файл(ПользовательскийСкриптПроверки);
	
	Если Файл.Существует() Тогда
		BslServer = ЗагрузитьСценарий(ПользовательскийСкриптПроверки);
	Иначе
		BslServer = ЗагрузитьСценарий(СкриптПроверкиПоУмолчанию);
	КонецЕсли;
	
	BslServer.ВыполнитьПроверку();
	
Иначе
	
	ТурбоКонф.CodeInspector(Неопределено);
	
КонецЕсли;

