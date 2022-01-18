//@script_name MoveLines
//@script_display_name  Перемещение строк
//@script_description Скрипт перемещает текущую строку
//@script_url https://turboconf.ru/Forum/Details/1524#MoveLines
//@script_section Редактирование
//@script_author sushakov
//@script_developer_url http://itpath.ru
//@script_hotkey Control+Shift+Up ПереместитьСтрокуВверх
//@script_hotkey Control+Shift+Down ПереместитьСтрокуВниз
//@retain_clipboard 1
//@enterprise_mode 1
//@hide_actions 0

//Изменен m.bolsun 17.09.18

Процедура ПереместитьСтроку(Направление)

	ТурбоКонф = Новый ТурбоКонф;

	//Снимаем выделение
	ТурбоКонф.Key(Keys.Escape);

	//Копируем текущую строку в буфер
	ТурбоКонф.КопироватьТекстВБуфер(); 
	
	ТурбоКонф.Key(Keys.Home);

	// Удаляем текущую строку
	ТурбоКонф.КонтролКлавиша(Keys.L);
	
	// Перемещаем строку
	ТурбоКонф.Key(Направление);
	ТурбоКонф.Key(Keys.Home, 2);

	ТурбоКонф.Ждать(100);

	//Всатвляем текст из буфера
	ТурбоКонф.ВставитьТекстИзБуфера();

	ТурбоКонф.Key(Keys.UP);

КонецПроцедуры

Процедура ПереместитьСтрокуВверх()

	ПереместитьСтроку(Keys.UP);	

КонецПроцедуры

Процедура ПереместитьСтрокуВниз()

	ПереместитьСтроку(Keys.Down);

КонецПроцедуры