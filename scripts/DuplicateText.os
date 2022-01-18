//@script_name DuplicateText
//@script_display_name Дублирование текста
//@script_description Скрипт дублирует текущую строку или выделенный текст
//@script_author m.bolsun
//@script_developer_url http://turboconf.ru
//@script_url https://turboconf.ru/Forum/Details/1524#DuplicateText
//@script_section Редактирование
//@script_hotkey Alt+D
//@retain_clipboard 1
//@enterprise_mode 1
//@hide_actions 0
//@script_version 2

//Изменено 26.06.2019 m.bolsun включено восстановление буфера обмена retain_clipboard, добавлены задержки при операциях с буфером

ТурбоКонф = Новый ТурбоКонф;

//Копируем выделенный текст или текущую строку в буфер
ТурбоКонф.Копировать();
ТурбоКонф.Ждать(100);

//Снимаем выделение и перемещаемся в начало текста
ТурбоКонф.Key(Keys.Right);
ТурбоКонф.Key(Keys.End);
ТурбоКонф.Key(Keys.Home, 2);

//Всатвляем текст из буфера
ТурбоКонф.Paste();
ТурбоКонф.Ждать(100);