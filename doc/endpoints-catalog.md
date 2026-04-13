# Каталог HTTP-эндпоинтов приложения

Ниже перечислены маршруты из `routes/api.php`, `routes/apiV2.php` и `routes/web.php`. Для публичного API v4 используется префикс **`/api`** (см. `RouteServiceProvider`). Маршруты v2/v3 подключены без префикса `api`, то есть пути совпадают с объявленными в `apiV2.php` от корня сайта. Для вызова API обычно требуются query-параметры `v` и `key` (см. `APIController`).

Часть веб-маршрутов обёрнута в группу с префиксом локали (`LaravelLocalization::setLocale()`), например `/en/login` — в таблице указан путь **относительно префикса локали**, если маршрут внутри этой группы.

---

## API v4 (`/api/...`, файл `routes/api.php`)

| Метод | Путь | Назначение |
|--------|------|------------|
| GET | `/api/countries` | Список стран |
| GET | `/api/countries/{country_id}` | Одна страна |
| GET | `/api/countries/search/{search_text}` | Поиск стран |
| GET | `/api/languages` | Список языков |
| GET | `/api/languages/{language_id}` | Один язык |
| GET | `/api/languages/search/{search_text}` | Поиск языков |
| GET | `/api/alphabets` | Список алфавитов |
| GET | `/api/alphabets/{alphabet_id}` | Один алфавит |
| GET | `/api/numbers/` | Список числительных |
| GET | `/api/numbers/range` | Числительные для пользовательского диапазона |
| GET | `/api/numbers/{number_id}` | Одно число/запись |
| GET | `/api/search` | Поиск по тексту/контенту |
| GET | `/api/bibles/defaults/types` | Типы файлсетов по умолчанию |
| GET | `/api/bibles/{bible_id}/book` | Книги для перевода |
| GET | `/api/bibles/search` | Поиск по конкретной версии Библии |
| GET | `/api/bibles/{bible_id}` | Метаданные одного перевода |
| GET | `/api/bibles/search/{search_text}` | Поиск переводов |
| GET | `/api/bibles` | Список переводов |
| GET | `/api/bibles/{bible_id}/copyright` | Авторские права перевода |
| GET | `/api/bibles/{bible_id}/chapter` | Текст главы (внутренний, токен + контроль доступа) |
| GET | `/api/bibles/{bible_id}/chapter/annotations` | Аннотации к главе |
| GET | `/api/bibles/filesets/media/types` | Типы медиа для файлсетов |
| POST | `/api/bibles/filesets/check/types` | Проверка типов файлсетов |
| GET | `/api/bibles/filesets/{fileset_id}/copyright` | Копирайт файлсета (устар.) |
| GET | `/api/bibles/filesets/{fileset_id?}` | Данные файлсета (устар.) |
| GET | `/api/bibles/filesets/{fileset_id}/books` | Книги для файлсета (устар.) |
| GET | `/api/bibles/filesets/bulk/{fileset_id}/{book?}` | Массовая выдача по файлсету |
| GET | `/api/bibles/filesets/{fileset_id}/{book}/{chapter}` | Контент файлсета по главе |
| GET | `/api/bibles/verses/{language_code}/{book_id}/{chapter_id}/{verse_number?}` | Стих по языку |
| GET | `/api/bible/{bible_id}/verses/{book_id}/{chapter_id}/{verse_number?}` | Стих по переводу |
| GET | `/api/download/list` | Список файлсетов, доступных для скачивания по ключу |
| GET | `/api/download/{fileset_id}/{book?}/{chapter_id?}` | Метаданные/ссылки для скачивания контента файлсета |
| GET | `/api/bibles/{bible_id}/{book}/{chapter?}` | Текст стихов (verse info) |
| GET | `/api/timestamps` | Доступные метки времени аудио |
| GET | `/api/timestamps/search` | Метки по тегу |
| GET | `/api/timestamps/{id}/{book}/{chapter}` | Метки по ссылке |
| GET | `/api/bible/filesets/{fileset_id}/{file_id}/playlist.m3u8` | HLS master-плейлист |
| GET | `/api/bible/filesets/{fileset_id}/{file_id}/{file_name}` | Сегмент потока (TS и т.д.) |
| GET | `/api/bible/filesets/{fileset_id}/{book_id}-{chapter}-{verse_start?}-{verse_end?}/playlist.m3u8` | HLS с диапазоном стихов |
| GET | `/api/bible/filesets/{fileset_id}/{book_id}-{chapter}-{verse_start}-{verse_end}/{file_name}` | Сегменты для диапазона стихов |
| GET | `/api/arclight/jesus-film/languages` | Языки Jesus Film |
| GET | `/api/arclight/jesus-film/chapters` | Главы Jesus Film |
| GET | `/api/arclight/jesus-film` | Файл/данные Jesus Film |
| GET | `/api/jesus-film/{language_iso}/{book}/{chapter}` | Глава Jesus Film по языку и книге |
| GET | `/api/refresh-dev-cache` | Сброс dev-кэша |
| GET | `/api/search/library` | Поиск по библиотеке (планы/плейлисты/заметки), токен |
| GET | `/api/users` | Список пользователей |
| POST | `/api/users` | Создание пользователя |
| GET | `/api/users/{user_id}` | Пользователь |
| PUT | `/api/users/{user_id}` | Обновление пользователя |
| DELETE | `/api/users` | Удаление пользователя |
| POST | `/api/login` | Вход |
| GET | `/api/login/{driver}` | OAuth-редирект |
| GET | `/api/login/{driver}/callback` | OAuth callback |
| POST | `/api/users/password/reset/{token?}` | Сброс пароля (валидация) |
| POST | `/api/users/password/email` | Запрос письма для сброса пароля |
| POST | `/api/logout` | Выход |
| POST | `/api/token/validate` | Проверка API-токена |
| GET | `/api/playlists` | Список плейлистов |
| POST | `/api/playlists` | Создание плейлиста |
| GET | `/api/playlists/{playlist_id}` | Плейлист |
| GET | `/api/playlists/{playlist_id}/text` | Текст элементов плейлиста |
| PUT | `/api/playlists/{playlist_id}` | Обновление плейлиста |
| DELETE | `/api/playlists/{playlist_id}` | Удаление плейлиста |
| POST | `/api/playlists/{playlist_id}/follow` | Подписка на плейлист |
| POST | `/api/playlists/{playlist_id}/item` | Добавление элемента |
| POST | `/api/playlists/item/{item_id}/complete` | Отметка элемента выполненным |
| GET | `/api/playlists/{playlist_id}/translate` | Перевод плейлиста |
| GET | `/api/playlists/{playlist_id}/hls` | HLS плейлист плейлиста |
| GET | `/api/playlists/{fileset_id}-{book_id}-{chapter}-{verse_start}-{verse_end}/item-hls` | HLS для составного ключа элемента |
| GET | `/api/playlists/{playlist_item_id}/item-hls` | HLS для элемента по id |
| POST | `/api/playlists/{playlist_id}/draft` | Черновик плейлиста |
| GET | `/api/playlists/item/metadata` | Метаданные элемента |
| GET | `/api/playlists/{playlist_id}/{book_id}/notes` | Заметки по книге в контексте плейлиста |
| GET | `/api/playlists/{playlist_id}/{book_id}/highlights` | Подсветки |
| GET | `/api/playlists/{playlist_id}/{book_id}/bookmarks` | Закладки |
| GET | `/api/plans` | Список планов чтения |
| POST | `/api/plans` | Создание плана |
| GET | `/api/plans/{plan_id}` | План |
| PUT | `/api/plans/{plan_id}` | Обновление плана |
| DELETE | `/api/plans/{plan_id}` | Удаление плана |
| POST | `/api/plans/{plan_id}/start` | Запуск плана |
| POST | `/api/plans/{plan_id}/reset` | Сброс плана |
| DELETE | `/api/plans/{plan_id}/stop` | Остановка плана |
| GET | `/api/plans/{plan_id}/translate` | Перевод плана |
| POST | `/api/plans/{plan_id}/day` | Добавление дня плана |
| POST | `/api/plans/day/{day_id}/complete` | Завершение дня |
| POST | `/api/plans/{plan_id}/draft` | Черновик плана |
| DELETE | `/api/plans/{plan_id}/day` | Удаление дней плана |
| GET | `/api/accounts` | Аккаунты пользователя |
| POST | `/api/accounts` | Создание аккаунта |
| PUT | `/api/accounts` | Обновление аккаунта |
| DELETE | `/api/accounts` | Удаление аккаунта |
| GET | `/api/users/{user_id}/notes` | Заметки пользователя |
| GET | `/api/users/{user_id}/notes/{id}` | Одна заметка |
| POST | `/api/users/{user_id}/notes` | Создание заметки |
| PUT | `/api/users/{user_id}/notes/{id}` | Обновление заметки |
| DELETE | `/api/users/{user_id}/notes/{id}` | Удаление заметки |
| GET | `/api/users/{user_id}/bookmarks` | Закладки |
| POST | `/api/users/{user_id}/bookmarks` | Создание закладки |
| PUT | `/api/users/{user_id}/bookmarks/{id}` | Обновление закладки |
| DELETE | `/api/users/{user_id}/bookmarks/{id}` | Удаление закладки |
| GET | `/api/users/{user_id}/highlights` | Подсветки |
| POST | `/api/users/{user_id}/highlights` | Создание подсветки |
| PUT | `/api/users/{user_id}/highlights/{id}` | Обновление подсветки |
| DELETE | `/api/users/{user_id}/highlights/{id}` | Удаление подсветки |
| GET | `/api/users/{user_id}/annotations/{bible_id}/{book?}/{chapter?}` | Выгрузка аннотаций пользователя по переводу (JSON) |
| GET | `/api/users/highlights/colors` | Доступные цвета подсветок |
| GET | `/api/lexicons` | Лексиконы (attic) |
| GET | `/api/countries/joshua-project/` | Данные Joshua Project |
| GET | `/api/push_notifications` | Push-токены |
| POST | `/api/push_notifications` | Регистрация push-токена |
| DELETE | `/api/push_notifications/{token}` | Удаление push-токена |
| GET | `/api/bibles/links` | Ссылки на переводы |
| GET | `/api/status` | Статус API |

---

## API v2 и v3 (без префикса `/api`, файл `routes/apiV2.php`)

Маршруты v2 требуют `v=2` в запросе; группа `v3` — префикс пути `/v3`.

| Метод | Путь | Назначение |
|--------|------|------------|
| GET | `/pass-through/{path1?}/{path2?}` | Прокси pass-through к метаданным |
| GET | `/library/asset` | Ресурсы библиотеки |
| GET | `/api/apiversion` | Последняя версия API |
| GET | `/api/reply` | Типы ответов API |
| GET | `/library/book` | Книга (справочник) |
| GET | `/library/bookorder` | Порядок книг |
| GET | `/library/bookname` | Имена книг |
| GET | `/library/chapter` | Главы |
| GET | `/library/language` | Языки томов |
| GET | `/library/volumelanguage` | Язык тома |
| GET | `/library/volumelanguagefamily` | Языковые семьи |
| GET | `/country/countrylang` | Языки по стране |
| GET | `/library/version` | Версии/тома |
| GET | `/library/metadata` | Метаданные библиотеки |
| GET | `/library/volume` | Том |
| GET | `/library/verse` | Текст стихов |
| GET | `/library/verseinfo` | Информация о стихах |
| GET | `/library/numbers` | Числа (диапазон) |
| GET | `/library/organization` | Организации |
| GET | `/library/volumehistory` | История тома |
| GET | `/library/volumeorganization` | Организации томов |
| GET | `/text/font` | Шрифты |
| GET | `/text/verse` | Текст (text) |
| GET | `/text/verseinfo` | Инфо о стихах |
| GET | `/text/search` | Поиск |
| GET | `/text/searchgroup` | Групповой поиск |
| GET | `/text/volume` | Том как в v4 show |
| GET | `/audio/location` | Расположение аудио |
| GET | `/audio/path` | Пути к аудио |
| GET | `/audio/versestart` | Временные метки по стихам |
| GET | `/video/videolocation` | Расположение видео |
| GET | `/video/videopath` | Пути к видео |
| GET | `/library/jesusfilm` | Список Jesus Film |
| GET | `/video/jesusfilm` | Индекс Jesus Film (Arclight) |
| GET | `/video/jesusfilm/{id}.m3u8` | HLS глава Jesus Film |
| GET | `/banners/banner` | Баннер |
| GET, POST, OPTIONS | `/users/user` | Профиль/пользователь v2 |
| POST | `/users/profile` | Обновление профиля |
| PUT, POST, OPTIONS | `/users/login` | Логин v2 |
| GET | `/annotations/list` | Список аннотаций |
| GET | `/annotations/bookmark` | Закладки |
| POST | `/annotations/bookmark` | Изменение закладок |
| DELETE | `/annotations/bookmark` | Удаление закладок |
| GET | `/annotations/note` | Заметки |
| POST | `/annotations/note` | Изменение заметок |
| DELETE | `/annotations/note` | Удаление заметок |
| GET | `/annotations/highlight` | Подсветки |
| POST | `/annotations/highlight` | Изменение подсветок |
| DELETE | `/annotations/highlight` | Удаление подсветок |
| GET | `/v3/search` | Поиск совместимости v3 |
| GET | `/v3/books` | Книги v3 |

---

## Веб (`routes/web.php`)

### С префиксом локали (`{locale}/...`)

| Метод | Путь | Назначение |
|--------|------|------------|
| GET | `{locale}/` | Приветственная страница |
| GET, POST | `{locale}/login` | Вход в веб-интерфейс |
| POST | `{locale}/logout` | Выход |
| GET | `{locale}/register` | Форма регистрации |
| POST | `{locale}/register` | Регистрация |
| GET | `{locale}/password/reset` | Запрос сброса пароля |
| GET | `{locale}/password/reset/{reset_token}` | Форма нового пароля |
| POST | `{locale}/password/email` | Отправка письма сброса |
| POST | `{locale}/password/reset/attempt` | Попытка сброса |
| GET | `{locale}/password/reset/attempt` | Страница результата сброса |
| GET, POST | `{locale}/admin/login` | Вход админа ключей API |
| GET | `{locale}/api_key/logout` | Выход из кабинета ключей |
| GET | `{locale}/api_key/dashboard` | Дашборд ключей |
| GET, POST | `{locale}/api_key/request` | Запрос ключа |
| GET | `{locale}/api_key/requested` | Подтверждение запроса |
| POST | `{locale}/api_key/send_email` | Отправка email по ключу |
| POST | `{locale}/api_key/save_note` | Сохранение заметки |
| POST | `{locale}/api_key/approve_api_key` | Одобрение ключа |
| POST | `{locale}/api_key/delete_api_key` | Удаление ключа |
| POST | `{locale}/api_key/change_api_key_state` | Смена состояния ключа |
| GET | `{locale}/home` | Домашняя (auth) |
| GET | `{locale}/dashboard` | Дашборд (auth), дубликат home |

### Без локали (корень приложения)

| Метод | Путь | Назначение |
|--------|------|------------|
| GET | `/status` | Статус приложения |
| GET | `/status/cache` | Статус кэша |
| GET | `/open-api-{version}.json` | Генерация OpenAPI JSON |
| GET | `/organizations` | Список организаций |
| GET | `/reader` | Языки для веб-ридера |
| GET | `/reader/languages/{language_id}` | Переводы для языка |
| GET | `/reader/bibles/{id}/` | Книги перевода |
| GET | `/reader/bibles/{id}/{book}/{chapter}` | Глава в ридере |
| GET | `/wiki` | Вики — главная |
| GET | `/wiki/bibles/{id}` | Вики — один перевод |
| GET | `/wiki/bibles` | Вики — список переводов |
| GET | `/docs` | Документация |
| GET | `/guides/getting-started` | Гайд Getting Started |
| GET | `/docs/language/update` | Доки по языкам |
| GET | `/docs/countries` | Доки по странам |
| GET | `/docs/alphabets` | Доки по алфавитам |
| GET | `/connect/{token}` | Подключение к проекту по токену |
| GET | `/login/redirect/{provider}` | Socialite редирект |
| GET | `/login/{provider}/callback` | Socialite callback |
| GET | `/dashboard/bibles` | Управление переводами (auth) |
| GET | `/dashboard/bibles/create` | Создание перевода |
| POST | `/dashboard/bibles` | Сохранение нового перевода |
| GET | `/dashboard/bibles/{bible_id}` | Редактирование перевода |
| PUT | `/dashboard/bibles/{bible_id}` | Обновление перевода |
| GET | `/api/projects` | Список проектов (дашборд) |
| GET | `/api/projects/create` | Форма проекта |
| POST | `/api/projects` | Создание проекта |
| GET | `/api/projects/{project_id}/members` | Участники проекта |
| GET | `/api/projects/{project_id}/edit` | Редактирование проекта |
| PUT | `/api/projects/{project_id}/` | Обновление проекта |
| GET | `/profile` | Профиль пользователя |
| PUT | `/profile/{user_id}` | Обновление профиля |
| * | `/api/keys` | REST resource: CRUD ключей разработчика (index/create/store/show/edit/update/destroy по соглашениям Laravel) |
| GET | `/api/keys/create` | Форма создания ключа |
| POST | `/api/keys` | Создание ключа |
| POST | `/api/keys/{id}/clone` | Клонирование ключа |
| GET | `/api/keys/{id}/edit` | Редактирование ключа |
| PUT | `/api/keys/{id}` | Обновление ключа |
| GET | `/api/keys/{id}/accessGroups` | Группы доступа ключа |
| GET | `/api/keys/{id}/delete` | Подтверждение удаления |
| POST | `/api/keys/{id}/delete` | Удаление ключа |
| POST | `/keys/email` | Отправка ключа на email |
| GET | `/keys/generate/{email_token}` | Генерация ключа по токену из письма |

---

*Файл сгенерирован по состоянию репозитория; при добавлении маршрутов обновите этот каталог.*
