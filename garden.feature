# language: ru

Функция: Пользовательские сценарии работы с профилем и данными профиля

  Сценарий: Регистрация нового пользователя
    Если Я как пользователь зайду на страницу регистрации
    И Введу логин для регистрации в поле ввода
      | User |
    И Введу пароль в поле ввода
      | password |
    И Нажму на кнопку "Зарегистрироваться"
    Тогда Код ответа 200
    И В БД появится запись
      | user     | password | status |
      | password | password | active  |

  Сценарий: Удаление пользователя
    Если Я как администратор в панель администратора
    И Удалю пользователя по "логину"
      | user |
    Тогда Код ответа 200
    И В БД нет записи

  Сценарий: Блокирова профиля
    Если Я как администратор в панель администратора
    И Удалю профиль по "логину"
      | user |
    Тогда Код ответа 200
    И В БД меняется запись
      | user | status |
      | user | block  |

  Сценарий: Создание профиля пользователя
    Если Я как пользователь зайду на страницу создания профиля
    И Введу телефон в поле ввода
      | 89002003040 |
    И Введу ссылку в поле ввода
      | vk.com |
    И Введу Имя в поле ввода
      | Иван |
    И Введу фамилию в поле ввода
      | Иванов |
    Тогда Код ответа 200
    И В БД появится запись
      | Name | Second Name | Phone       | Social |
      | Иван | Иванов      | 89002003040 | vk.com |

  Сценарий: Редактирование профиля пользователя
    Если Я как пользователь зайду на страницу редактирования профиля
    И Введу телефон в поле ввода
      | 89002003111 |
    И Введу ссылку в поле ввода
      | vk.com |
    И Введу Имя в поле ввода
      | Иван |
    И Введу фамилию в поле ввода
      | Иванов |
    Тогда Код ответа 200
    И В БД меняется запись
      | Name | Second Name | Phone       | Social |
      | Иван | Иванов      | 89002003111 | vk.com |

  Сценарий: Поиск детского садика
    Предыстория: Садик есть в БД
    Если Я как пользователь зайду на страницу поиска садиков
    И Введу адресс садика в поле ввода
      | Ленина 5а |
    Тогда Код ответа 200
    И В БД появится зпись
      | Adress    | Name     |
      | Ленина 5а | Солнышко |
