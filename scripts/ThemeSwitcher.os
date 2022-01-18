﻿//@script_name ThemeSwitcher
//@script_display_name Переключатель тем
//@script_description Переключает цветовые схемы конфигуратора.
//@script_author m.bolsun
//@script_developer_url https://turboconf.ru
//@script_url https://turboconf.ru/Forum/Details/3744#CommitComment
//@script_section Прочие
//@script_hotkey Control+D8 ПриОткрытии Переключатель тем
//@turbomenu 1
//@turbobutton 0
//@retain_clipboard 0
//@enterprise_mode 0
//@hide_actions 1
//@script_version 1

//Порт обработки "Цветовые схемы для конфигуратора 1С" Дмитрия Чернова https://infostart.ru/public/202980/

Перем Темы;

//События
Процедура ПриОткрытии()
	
	Форма = Новый ПроизвольнаяФорма();
	Форма.Сгенерировать("settings\ThemeSwitcher\Forms\ThemeSwitcherForm", "ThemeSwitcher.ThemeSwitcherForm");
	
	Форма.Заголовок = "Выберите тему";
	Форма.УстановитьДанные("listBoxThemes", "Items", Темы);
	Форма.УстановитьДействие(ЭтотОбъект,  "buttonOK_Click");

	Форма.Показать();
	
КонецПроцедуры

Процедура buttonOK_Click(Значение, Отказ) Экспорт
	Если Не Отказ Тогда 
		Путь_к_Файлу = Получить_Путь_к_Файлу();
		Путь_к_Файлу_8_3 = Получить_Путь_к_Файлу_8_3();
		
		Запись_в_файл_настроек(Значение, Путь_к_Файлу);
		Запись_в_файл_настроек(Значение, Путь_к_Файлу_8_3);	
	КонецЕсли;
КонецПроцедуры

Процедура Запись_в_файл_настроек(ИмяТемы, Путь_к_Файлу)
	
	Файл = Новый Файл(Путь_к_Файлу);

    Если НЕ Файл.Существует()  Тогда
        Возврат;
	КонецЕсли;
		
	тз = новый ТаблицаЗначений();
	тз.Колонки.Добавить("Содержание");
	
	Чтение = Новый ЧтениеТекста(Путь_к_Файлу);
	Строки = Чтение.ПрочитатьСтроку();
	сч = 0;
	
	Пока Строки <> Неопределено Цикл  //Посчитаем количество строк (да простят меня програмеры)
		сч = сч + 1;		
		Новая_Запись = тз.Добавить();
		Новая_Запись.Содержание = Строки;		
		Строки = Чтение.ПрочитатьСтроку();		
	КонецЦикла;
	Чтение.Закрыть();
	
	Запись = Новый ЗаписьТекста(Путь_к_Файлу);
	сч_Записи = 0;
	для Каждого строка из тз цикл
		сч_Записи = сч_Записи + 1;
		Если сч_Записи <= (сч - 3) Тогда
			Запись.ЗаписатьСтроку(строка.Содержание);
		КонецЕсли;
	КонецЦикла;
	
	ДиректорияТем = "settings/ThemeSwitcher/Themes/";
	
	Чтение = Новый ЧтениеТекста(ДиректорияТем + ИмяТемы + ".txt");
	
	//Добавим запись с настройками конфигуратора
	Тема = Чтение.Прочитать();
	Чтение.Закрыть();
	
	Запись.ЗаписатьСтроку(Тема);
	
	Запись.Закрыть();
	
	Предупреждение = Новый ПредупреждениеПользователю();
	Предупреждение.Текст = "Тема успешно установлена. Перезагрузите конфигуратор для применения изменений.";
	Предупреждение.Заголовок = "TurboConf - ThemeSwitcher";
	Предупреждение.Показать();
	
КонецПроцедуры

Функция Получить_Путь_к_Файлу()	
	Возврат ПеременныеСреды()["USERPROFILE"] + "\AppData\Roaming\1C\1Cv82\" +  "1Cv8.pfl";
КонецФункции

Функция Получить_Путь_к_Файлу_8_3()
	Возврат ПеременныеСреды()["USERPROFILE"] + "\AppData\Roaming\1C\1Cv8\" +  "1Cv8.pfl";
КонецФункции

ФайлНастроекПоУмолчанию = "settings/ThemeSwitcher/DefaultSettings.os";
ФайлНастроекПользователя = "settings/ThemeSwitcher/Settings.os";

Файл = Новый Файл(ФайлНастроекПользователя);

Если Файл.Существует() Тогда
	Темы = ЗагрузитьСценарий(ФайлНастроекПользователя).Темы;	
Иначе
	Темы = ЗагрузитьСценарий(ФайлНастроекПоУмолчанию).Темы;	
КонецЕсли;