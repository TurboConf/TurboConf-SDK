﻿
// Обязательный аттрибут. Имя скрипта, без пробелов. Должно быть уникально в папке со скриптами. Может содержать буквы, цифры и знак _
//@script_name HelloWorld

// Представление имени скрипта
//@script_display_name Hello, World!

// Краткое описание скрипта
//@script_description Скрипт демонстрирует основы работы с TurboConf

// Автор скрипта
//@script_author m.bolsun

// Сайт разработчика
//@script_developer_url http://turboconf.ru

// Сочетание клавиш для вызова скрипта. Может быть переопределено пользователем в программе.
// Формат {Модификатор1}+{Модификатор2}+{Модификатор3}+Клавиша
// Значения клавиш содержатся в перечислении Клавиши (Keys)
// Примеры сочетаний: Control+Alt+Shift+A, Control+Alt+D1, Control+Shift+OemTilda, Alt+F
//@script_hotkey Control+None
                       
//Восстанавливать буфер обмена после выполнения скрипта.
//Если в процессе выполнения скрипта был использован буфер обмена, может быть полезно восстановить пользовательское значение после завершения работы
//@retain_clipboard 1

// Скрипт будет доступен в режиме Предприятия
//@enterprise_mode 1

// Во время выполнения скрипта, скрывать от пользователя все служебные действия с Конфигуратором
//@hide_actions 1

//@script_section Прочие

// Сообщение будет выведено в консоль отладки TurboConf (Ctrl+Alt+Shift+L)
Сообщить("Работает!");

ТК = Новый ТурбоКонф;

//Отправляем текст в конфигуратор, путем вставки из буфера обмена
ТК.ВставитьТекст("Привет из TurboConf!");

//Выполняем нажатие клавиши Enter 2 раза
ТК.Клавиша(Клавиши.Enter, 2);

//Отправляем текст в конфигуратор, путем вставки из буфера обмена
ТК.ВставитьТекст(ТекущаяДата());

ТК.Клавиша(Клавиши.Enter);

//Открываем окно поиска
ТК.КонтролКлавиша(Клавиши.F);

//Ждем окно 1 секунду, если не появится выдавать исключение
ТК.ЖдатьОкно("Поиск", 1000, true);

//Ищем "Привет"
ТК.ВставитьТекст("Привет");

//Выполняем нажатие клавиши Enter
ТК.Клавиша(Клавиши.Enter);

