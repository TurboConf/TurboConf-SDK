//@script_name AddToDo
//@script_display_name Добавить ToDo 
//@script_description Добавляет в модуль //ToDo: с возможностью поиска и перехода
//@script_author m.bolsun
//@script_developer_url http://turboconf.ru
//@script_url https://turboconf.ru/Forum/Details/1525#ToDoNavigator
//@script_section Навигация
//@script_hotkey Control+Shift+D2
//@retain_clipboard 1
//@enterprise_mode 0
//@hide_actions 0

ТурбоКонф = Новый ТурбоКонф;

ТурбоКонф.ВставитьТекст("//ToDo: ");

//Хак для обхода ошибки в UIAutomation на платформах >= 8.3.12
//Если окно модуля развернуто, то можно получить название объекта модуля.
//Необходимо для правильной работы ToDo Навигатора.
ТурбоКонф.MaximizeWindowIfNeeded();