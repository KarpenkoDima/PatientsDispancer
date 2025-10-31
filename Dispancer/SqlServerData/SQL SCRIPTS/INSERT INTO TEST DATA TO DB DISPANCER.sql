USE [Dispancer]
GO

/* =============================================================================
 ЧАСТЬ 1: ЗАПОЛНЕНИЕ СПРАВОЧНИКОВ (ИЗ ТВОИХ 11 ФАЙЛОВ)
============================================================================= */

PRINT N'ЧАСТЬ 1: Заполнение справочников из 11 файлов...';
GO

-- ---
-- Файл: INSERT INTO [Dispancer].[dbo].[AdminDivision].sql
-- ---
PRINT N'Заполнение [AdminDivision]...';
-- Очистка перед вставкой, чтобы избежать ошибок дубликатов
DELETE FROM [Dispancer].[dbo].[AdminDivision];
SET IDENTITY_INSERT Dispancer.dbo.admindivision ON;
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(1,1, N'Область                      ', N'обл       ',101);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(2,1, N'Автономная республика        ', N'АР        ',102);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(3,2, N'Район                        ', N'р-н       ',201);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(4,3, N'Посёлок городского типа      ', N'пгт       ',302);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(5,3, N'Город                        ', N'г         ',301);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(6,3, N'Село                         ', N'с         ',303);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(7,3, N'Посёлок                      ', N'п         ',304);
SET IDENTITY_INSERT Dispancer.dbo.admindivision OFF;
GO

-- ---
-- Файл: INSERT INTO [Dispancer].[dbo].[APPPTPR].sql
-- ---
PRINT N'Заполнение [APPPTPR]...';
-- Очистка перед вставкой
DELETE FROM [Dispancer].[dbo].[APPPTPR];
SET IDENTITY_INSERT Dispancer.dbo.appptpr ON;
INSERT INTO [Dispancer].[dbo].[APPPTPR]([APPPTPR],[Name])
VALUES(1, N'Нет  ');
INSERT INTO [Dispancer].[dbo].[APPPTPR]([APPPTPR],[Name])
VALUES(2, N'АППП ');
INSERT INTO [Dispancer].[dbo].[APPPTPR]([APPPTPR],[Name])
VALUES(3, N'ТПР  ');
SET IDENTITY_INSERT Dispancer.dbo.appptpr OFF;
GO

-- ---
-- Файл: INSERT INTO [Dispancer].[dbo].[BenefitsCategory.sql
-- ---
PRINT N'Заполнение [BenefitsCategory]...';
-- Очистка перед вставкой
DELETE FROM [Dispancer].[dbo].[BenefitsCategory];
SET IDENTITY_INSERT Dispancer.dbo.benefitscategory ON;
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(1, N'Дети войны',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(2, N'Пенсионеры',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(3, N'ЧАЭС',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(4, N'Инвалиды ВОВ',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(5, N'УБД',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(6, N'Инвалиды СА',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(7, N'УВОВ',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(8, N'Другие ивалиды',NULL);
SET IDENTITY_INSERT Dispancer.dbo.benefitscategory OFF;
GO

-- ---
-- Файл: INSERT INTO [Dispancer].[dbo].[ChiperRecept].sql
-- ---
PRINT N'Заполнение [ChiperRecept]...';
-- Очистка перед вставкой
DELETE FROM [Dispancer].[dbo].[ChiperRecept];
SET IDENTITY_INSERT Dispancer.dbo.chiperrecept ON;
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(1, N'01',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(2, N'',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(3, N'48',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(4, N'27',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(5, N'28',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(6, N'02',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(7, N'0',NULL);
SET IDENTITY_INSERT Dispancer.dbo.chiperrecept OFF;
GO

-- ---
-- Файл: INSERT INTO [Dispancer].[dbo].[TypeStreet].sql
-- ---
PRINT N'Заполнение [TypeStreet]...';
-- Очистка перед вставкой
DELETE FROM [Dispancer].[dbo].[TypeStreet];
SET IDENTITY_INSERT Dispancer.dbo.typestreet ON;
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Аал                          ', N'аал       ',532,2);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Абонентский ящик             ', N'а/я       ',572,3);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Аллея                        ', N'аллея     ',501,4);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Арбан                        ', N'арбан     ',560,5);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Аул                          ', N'аул       ',533,6);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Балка                        ', N'балка     ',581,7);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Берег                        ', N'берег     ',573,8);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Бугор                        ', N'бугор     ',576,9);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Бульвар                      ', N'б-р       ',502,10);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Бухта                        ', N'бухта     ',582,11);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Вал                          ', N'вал       ',568,12);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Въезд                        ', N'въезд     ',503,13);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Выселки(ок)                  ', N'высел     ',534,14);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Гаражно-строит-ный кооператив', N'гск       ',563,15);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Горка                        ', N'горка     ',586,16);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Городок                      ', N'городок   ',535,17);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Дачное нек                   ', N'днп       ',587,18);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Деревня                      ', N'д         ',536,19);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Дорога                       ', N'дор       ',504,20);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'ж/д останов. (обгонный) пункт', N'ж/д_оп    ',539,21);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Железнодорожная будка        ', N'ж/д_будка ',537,22);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Железнодорожная казарма      ', N'ж/д_казарм',538,23);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Железнодорожная платформа    ', N'ж/д_платф ',559,24);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Железнодорожная станция      ', N'ж/д_ст    ',542,25);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Железнодорожный пост         ', N'ж/д_пост  ',540,26);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Железнодорожный разъезд      ', N'ж/д_рзд   ',541,27);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Животноводческая точка       ', N'жт        ',505,28);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Заезд                        ', N'заезд     ',506,29);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Зона                         ', N'зона      ',577,30);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Казарма                      ', N'казарма   ',543,31);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Канал                        ', N'канал     ',562,32);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Квартал                      ', N'кв-л      ',507,33);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Километр                     ', N'км        ',508,34);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Кольцо                       ', N'кольцо    ',509,35);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Коса                         ', N'коса      ',567,36);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Леспромхоз                   ', N'лпх       ',565,37);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Линия                        ', N'линия     ',510,38);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Маяк                         ', N'маяк      ',585,39);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Местечко                     ', N'м         ',544,40);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Местность                    ', N'местность ',580,41);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Микрорайон                   ', N'мкр       ',545,42);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Мост                         ', N'мост      ',570,43);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Мыс                          ', N'мыс       ',584,44);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Набережная                   ', N'наб       ',511,45);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Населенный пункт             ', N'нп        ',546,46);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Некоммерче                   ', N'н/п       ',588,47);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Остров                       ', N'остров    ',512,48);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Парк                         ', N'парк      ',513,49);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Переезд                      ', N'переезд   ',515,50);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Переулок                     ', N'пер       ',514,51);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Планировочный район          ', N'п/р       ',550,52);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Платформа                    ', N'платф     ',547,53);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Площадка                     ', N'пл-ка     ',517,54);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Площадь                      ', N'пл        ',516,55);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Полустанок                   ', N'полустанок',552,56);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Поселок                      ', N'п         ',548,57);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Поселок и(при) станция(и)    ', N'п/ст      ',551,58);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Починок                      ', N'починок   ',553,59);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Почтовое отделение           ', N'п/о       ',549,60);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Причал                       ', N'причал    ',583,61);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Проезд                       ', N'проезд    ',518,62);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Просек                       ', N'просек    ',520,63);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Просека                      ', N'просека   ',574,64);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Проселок                     ', N'проселок  ',521,65);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Проспект                     ', N'пр-кт     ',519,66);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Проток                       ', N'проток    ',566,67);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Протока                      ', N'протока   ',575,68);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Проулок                      ', N'проулок   ',522,69);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Разъезд                      ', N'рзд       ',554,70);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Ряды                         ', N'ряды      ',571,71);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Сад                          ', N'сад       ',523,72);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Садов-е неком-е товарищество ', N'снт       ',564,73);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Село                         ', N'с         ',555,74);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Сквер                        ', N'сквер     ',524,75);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Слобода                      ', N'сл        ',556,76);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Спуск                        ', N'спуск     ',561,77);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Станция                      ', N'ст        ',557,78);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Строение                     ', N'стр       ',525,79);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Территория                   ', N'тер       ',526,80);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'тоннель                      ', N'тоннель   ',579,81);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Тракт                        ', N'тракт     ',527,82);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Тупик                        ', N'туп       ',528,83);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Улица                        ', N'ул        ',529,84);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Участок                      ', N'уч-к      ',530,85);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Ферма                        ', N'ферма     ',569,86);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Фермерское                   ', N'ф/х       ',589,87);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Хутор                        ', N'х         ',558,88);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Шоссе                        ', N'ш         ',531,89);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'эстакада                     ', N'эстакада  ',578,90);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Двор                         ', N'двор      ',590,91);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Санаторий', N'Санаторий',591,93);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'Монастырь', N'монастырь',592,95);
SET IDENTITY_INSERT Dispancer.dbo.typestreet OFF;
GO

-- ---
-- Файл: INSERT INTO [Dispancer].[dbo].[WhyDeRegister].sql
-- ---
PRINT N'Заполнение [WhyDeRegister]...';
-- Очистка перед вставкой
DELETE FROM [Dispancer].[dbo].[WhyDeRegister];
SET IDENTITY_INSERT Dispancer.dbo.whyderegister ON;
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(1, N'выздоровление\стойко', N'В архив не входит?');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(2, N'перемена места жител', N'В архи');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(3, N'Смерть', N'В архив');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(4, N'Другие причины', N'В архив не в ходит');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(5, N'по достижению возрас', N'В архив не въодит');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(6, N'Переведен на другой ', N'В архив не входит');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(7, N'Переведен в ДПХ',NULL);
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(8, N'[пусто]', N'ничего');
SET IDENTITY_INSERT Dispancer.dbo.whyderegister OFF;
GO

/* =============================================================================
 ЧАСТЬ 2: НЕДОСТАЮЩИЕ СПРАВОЧНИКИ (ТРЕБУЮТСЯ ДЛЯ МИГРАЦИИ)
============================================================================= */

PRINT N'ЧАСТЬ 2: Заполнение недостающих справочников (Gender, Land, RegisterType, DisabilityGroup)...';
GO

-- Заполнение Пола (Gender) (требуется для Customer.sql)
PRINT N'Заполнение [Gender]...';
-- Очистка перед вставкой
DELETE FROM [dbo].[Gender];
SET IDENTITY_INSERT [dbo].[Gender] ON;
INSERT INTO [dbo].[Gender] ([GenderID], [Name])
VALUES
    (1, N'М'),
    (2, N'Ж');
SET IDENTITY_INSERT [dbo].[Gender] OFF;
GO

-- Заполнение Участков (Land) (требуется для Register.sql)
PRINT N'Заполнение [Land]...';
-- Очистка перед вставкой
DELETE FROM [dbo].[Land];
SET IDENTITY_INSERT [dbo].[Land] ON;
INSERT INTO [dbo].[Land] ([LandID], [NumberLand], [NotaBene])
VALUES
    (1, N'Участок 0', NULL),
    (2, N'Участок 1', NULL),
    (3, N'Участок 2', NULL),
    (4, N'Участок 3', NULL),
    (5, N'Участок 4', NULL),
    (6, N'Участок 5', NULL),
    (7, N'Участок 6', NULL),
    (8, N'Участок 7', NULL),
    (9, N'Участок 8', NULL),
    (10, N'Участок 9', NULL);
SET IDENTITY_INSERT [dbo].[Land] OFF;
GO

-- Заполнение Типов Учета (RegisterType) (требуется для Register.sql)
PRINT N'Заполнение [RegisterType]...';
-- Очистка перед вставкой
DELETE FROM [dbo].[RegisterType];
SET IDENTITY_INSERT [dbo].[RegisterType] ON;
INSERT INTO [dbo].[RegisterType] ([RegisterTypeID], [Name], [NotaBene])
VALUES
    (1, N'диспансерная группа', NULL),
    (2, N'на учете не состоит', NULL),
    (3, N'консультативная группа', NULL),
    (4, N'архив', NULL),
    (5, N'смерть', NULL),
    (6, N'опекун', NULL),
    (7, N'70.0', N'другое'),
    (8, N'ДПХ', NULL),
    (9, N'[неизвестно]', NULL);
SET IDENTITY_INSERT [dbo].[RegisterType] OFF;
GO

-- Заполнение Групп Инвалидности (DisabilityGroup) (требуется для тестовых данных)
PRINT N'Заполнение [DisabilityGroup]...';
-- Очистка перед вставкой
DELETE FROM [dbo].[DisabilityGroup];
SET IDENTITY_INSERT [dbo].[DisabilityGroup] ON;
INSERT INTO [dbo].[DisabilityGroup] ([DisabilityGroupID], [Name], [NotaBene])
VALUES
    (1, N'I группа', NULL),
    (2, N'II группа', NULL),
    (3, N'III группа', NULL),
    (4, N'Ребенок-инвалид', NULL);
SET IDENTITY_INSERT [dbo].[DisabilityGroup] OFF;
GO

/* =============================================================================
 ЧАСТЬ 3: МИГРАЦИЯ ОСНОВНЫХ ДАННЫХ (ИЗ ТВОИХ 11 ФАЙЛОВ)
============================================================================= */

PRINT N'ЧАСТЬ 3: Миграция основных данных (Customer, Address, Register)...';
GO

-- Очистка таблиц перед миграцией
-- Важно: Порядок удаления обратный порядку создания связей
PRINT N'Очистка таблиц перед миграцией...';
DELETE FROM [dbo].[CustomerNotaBene];
DELETE FROM [dbo].[RegisterNotaBene];
DELETE FROM [dbo].[Invalid_BenefitsCategory];
DELETE FROM [dbo].[Invalid];
DELETE FROM [dbo].[Register];
DELETE FROM [dbo].[Address];
DELETE FROM [dbo].[Customer];
GO

-- ---
-- Файл: INSERT INTO [dbo].[Customer].sql
-- ---
PRINT N'Миграция [Customer]...';
ALTER TABLE [dbo].[Customer]
NOCHECK CONSTRAINT [CK_Customer_BirthDay];
SET IDENTITY_INSERT [dbo].[Customer] ON;
INSERT INTO [dbo].[Customer]
           (CustomerID
           	,[MedCard]
           ,[CodeCustomer]
           ,[LastName]
           ,[FirstName]
           ,[MiddleName]
           ,[Birthday]
           ,[Arch]
           ,[CustomerTempID]
           ,[APPPTPRID]
           ,[GenderID]          
          )
   SELECT 
       [CustomerID]    
      ,[Медицинская карточка амбулаторного больного №]
      ,[Код больного(год)]
      ,[Фамилия]
      , ISNULL([Имя],'')
      ,[Отчество]
      -- Используем TRY_CONVERT для безопасности
      , TRY_CONVERT(DATETIME, [Дата рождения]) 
      ,0 -- Arch = 0 по умолчанию для мигрированных
      ,[CustomerID] -- CustomerTempID = старому ID
      ,1 -- APPPTPRID = 1 ('Нет') по умолчанию? Уточни, если нужно другое значение
      ,CASE	[Пол] WHEN 'М' THEN 1 ELSE 2 end
     
  FROM [TestDataDispancer].[dbo].[Customer];
SET IDENTITY_INSERT [dbo].[Customer] OFF;
ALTER TABLE [dbo].[Customer]
CHECK CONSTRAINT [CK_Customer_BirthDay];
GO

-- ---
-- Файл: INSERT INTO [dbo].[Address].sql
-- ---
PRINT N'Миграция [Address]...';
SET IDENTITY_INSERT [dbo].[Address] ON;
INSERT INTO [dbo].[Address]
           ([CustomerID]
           ,addressID
           ,[City]
           ,[AdminDivisionID]
           ,[NameStreet]
           ,[TypeStreetID]           
           ,[NumberHouse]
           ,[NumberApartment])
    SELECT [CustomerID]
      ,[AddressID]
      -- Добавим N' для Unicode строк
      , N'[Адрес1]' AS city 
      , CASE [Адрес] 
         WHEN N'область' THEN 1
      	 WHEN N'Автономная республика' THEN 2 
      	 WHEN N'р-н' THEN 3 
      	 WHEN N'ПГТ' THEN 4
      	 WHEN N'Город' THEN 5
      	 WHEN N'14' THEN 5 -- Нужно уточнить, что значит '14'
      	 WHEN N'смт' THEN 4
      	 WHEN N'Село' THEN 6
      	 WHEN N'Поселок' THEN 7 
      	 ELSE 5 -- По умолчанию Город?
       END AS admindivision
      ,[Название улицы(пер)] AS nameStreet
      ,CASE [Улица(пер)] 
		WHEN N'бульвар' THEN 10
		WHEN N'Бульвар' THEN 10
		WHEN N'б-р' THEN 10
		WHEN N'Въезд' THEN 13
		WHEN N'въезд' THEN 13
		WHEN N'Двор' THEN 91 -- ID 75 был 'Сквер', ID 91 = 'Двор'
		WHEN N'квартал' THEN 33
		WHEN N'кв-л' THEN 33
		WHEN N'Квартал' THEN 33
		WHEN N'мкр' THEN 42
		WHEN N'м-н' THEN 42 
		WHEN N'м-р' THEN 42
		WHEN N'Переулок' THEN 51
		WHEN N'Площадь' THEN 55
		WHEN N'пл.' THEN 55
		WHEN N'Проезд' THEN 62
		WHEN N'Проспект' THEN 66
		WHEN N'пр-т' THEN 66
		WHEN N'село' THEN 74
		WHEN N'ст.' THEN 78  
		WHEN N'ст' THEN  78
		WHEN N'Улица' THEN 84 
		WHEN N'Тупик' THEN 83
		ELSE 84 -- По умолчанию Улица? Или NULL? Поставил 84 (Улица)
	END  AS typeStreet
      ,[Дом]
      ,[Квартира]
  FROM [TestDataDispancer].[dbo].[Address];
SET IDENTITY_INSERT [dbo].[Address] OFF;
GO

-- ---
-- Файл: INSERT INTO [dbo].[Register].sql
-- ---
PRINT N'Миграция [Register]...';
SET IDENTITY_INSERT [dbo].[Register] ON;
INSERT INTO [dbo].[Register]
           ([CustomerID]
           ,RegisterID
           ,[FirstRegister]
           ,[FirstDeregister]
           ,[SecondRegister]
           ,[Diagnosis]
           ,[DataDiagnosis]
           ,[RegisterTypeID]        
           ,[WhyDeRegisterID]
           ,[LandID]
          )
    SELECT 
    [CustomerID]
     ,[RegisterID]      
      ,TRY_CONVERT(DATETIME,[Первый раз взят(а) на учет])
      ,TRY_CONVERT(DATETIME,[Первый раз снят(а) с учета])
      ,TRY_CONVERT(DATETIME,[Второй раз взят(а) на учет])
      ,[Диагноз]
     ,TRY_CONVERT(DATETIME,[Диагноз(дата)],104) -- Формат dd.mm.yyyy
      ,CASE [Учет]
       WHEN N'на учете не состоит ДПХ' THEN 2
      	 WHEN N'на учете не состоит выезд' THEN 2 
      	 WHEN N'на учете не состоит' THEN  2
      	 WHEN N'в архив' THEN 4
      	 WHEN N'архив(опекун)' THEN 4
      	 WHEN N'архив (опекун)' THEN 4
      	 WHEN N'архив( опекун)' THEN 4
      	 WHEN N'архив (опека)' THEN 4
      	 WHEN N'архив(опека)' THEN 4
      	 WHEN N'архив (ДПХ)' THEN 4 
      	 WHEN N'архив' THEN 4 
      	 WHEN N'архиив' THEN 4 
      	 WHEN N'70.0' THEN 7 
      	 WHEN N'066' THEN 7
      	 WHEN N'06.6' THEN 7 
      	 WHEN N'45.8' THEN 7
      	 WHEN N'смерть' THEN 5
      	 WHEN N'смертть' THEN 5
      	 WHEN N'консультативная группа' THEN 3
      	 WHEN N'ДПХ' THEN 8
      	 WHEN N'диспансерная группа' THEN 1 
      	 WHEN N'опекун' THEN 6
      	 ELSE 9 -- [неизвестно]
      	END AS RegisterType
     , CASE [Снят с учета]
		 WHEN N'выздоровление\стойкое улучшение' THEN 1
		 WHEN N'другие причины' THEN 4 
      	 WHEN N'на другой участок' THEN 6 
      	 WHEN N'переведен н а другой участок' THEN 6 
      	 WHEN N'переведен на другой участок' THEN 6
      	 WHEN N'переведена на другой участок' THEN 6 
      	 WHEN N'перемена места жительства' THEN 2
      	 WHEN N'по достижению возраста' THEN 5
      	 WHEN N'смерть' THEN 3
      	 WHEN N' ' THEN 8 -- Пусто
         WHEN N'' THEN 8  -- Пусто
         WHEN NULL THEN 8 -- Пусто
      	 WHEN N'2017 - конс.гр.' THEN 7 -- Переведен в ДПХ? Или Другие причины? Поставил 7
      	 WHEN N'в ПНИ' THEN 4 -- Другие причины? Или создать новый? Поставил 4
		 ELSE 8 -- По умолчанию [пусто]
      END AS WhyDeRegister
     ,CASE TRY_CAST([Участок] AS INT) -- Безопасное преобразование в число
		   WHEN 0 THEN 1
		   WHEN 1 THEN 2
		   WHEN 2 THEN 3
		   WHEN 3 THEN 4
		   WHEN 4 THEN 5
		   WHEN 5 THEN 6
		   WHEN 6 THEN 7
		   WHEN 7 THEN 8
		   WHEN 8 THEN 9
		   WHEN 9 THEN 10    
		   ELSE 1 -- По умолчанию Участок 0?
	   END AS LandID
  FROM [TestDataDispancer].[dbo].[Register];
SET IDENTITY_INSERT [dbo].[Register] OFF;
GO

/* =============================================================================
 ЧАСТЬ 4: МИГРАЦИЯ АРХИВНЫХ ПРИМЕЧАНИЙ (ИЗ ТВОИХ 11 ФАЙЛОВ)
============================================================================= */

PRINT N'ЧАСТЬ 4: Миграция архивных примечаний (CustomerNotabene, RegisterNotabene)...';
GO

-- ---
-- Файл: INSERT INTO [dbo].[CustomerNotabene].sql
-- ---
PRINT N'Миграция [CustomerNotabene]...';
INSERT INTO [dbo].[CustomerNotaBene]
           ([CustomerID]
           ,[NotaBene])
   SELECT distinct c.[CustomerID]
      -- Используем ISNULL с N'' для Unicode
      ,N'[Инвалидность]= ' + ISNULL([Инвалидность], N' ' ) + N'; '+
      N'[Признан инвал(впервые)]= ' + isnull(CONVERT(NVARCHAR(15),[Признан инвал(впервые)]), N' ' ) + N'; '+
      N'[Срок инвал] = ' +isnull(CONVERT(NVARCHAR(15),[Срок инвал]), N' ') + N'; '+
      N'[Динамика]= '+ isnull([Динамика], N' ' ) + N' '+
      N'[Котегория льгот]= ' +isnull([Котегория льгот], N' ' ) + N'; '+
      CASE [НЕ дееспособен]	
		WHEN 0 THEN  N'[НЕ дееспособен] = НЕТ; '
		WHEN 1 THEN N'[НЕ дееспособен]= ДА; '
		ELSE  N'[НЕ дееспособен]=  ;' 
		END
      	  + N' '+
      N'[Признан не дееспособным] = ' + isnull(CONVERT(NVARCHAR(15),[Признан не дееспособным]), N' ' ) + N'; '+
      N'[Сведения об опекуне] =' +isnull([Сведения об опекуне], N' ' )
        		   
  FROM [TestDataDispancer].[dbo].[InvalidArch]
  INNER JOIN Dispancer.dbo.Customer AS c
  ON c.CustomerTempID = [TestDataDispancer].[dbo].[InvalidArch].CustomerID 
  --WHERE c.Arch =1 -- Условие Arch=1 не нужно, CustomerID уже уникален
GO

-- ---
-- Файл: INSERT INTO [dbo].[RegisterNotabene].sql
-- ---
PRINT N'Миграция [RegisterNotabene]...';
INSERT INTO [dbo].[RegisterNotaBene]
           ([RegisterID]
           ,[NotaBene])
   SELECT r.[RegisterID] -- Используем RegisterID из целевой таблицы
      -- Используем ISNULL с N'' для Unicode
      ,N'[Первый раз взят(а) на учет] =' +isnull(CONVERT(NVARCHAR(50), ra.[Первый раз взят(а) на учет],103), N' ') + N'; ' +
     N'[Первый раз снят(а) с учета] =' +isnull(CONVERT(nvarchar(50), ra.[Первый раз снят(а) с учета],103), N' ') + N'; ' +
     N'[Второй раз взят(а) на учет] =' +isnull(CONVERT(nvarchar(50), ra.[Второй раз взят(а) на учет],103), N' ') + N'; ' +
     N'[Диагноз] =' +ISNULL(ra.[Диагноз], N' ' ) + N'; '+ -- Уточнил имя поля
     N'[Динамика Д/З] =' +ISNULL(ra.[Динамика Д/З], N' ' )+ N'; '+
     N'[Учет] =' +ISNULL(ra.[Учет], N' ') + N'; '+
     N'[Снят с учета] =' +ISNULL(ra.[Снят с учета], N' ' )+ N'; '+
     N'[Диагноз(дата)] =' +ISNULL(ra.[Диагноз(дата)], N' ' ) + N'; ' +
     N'[Участок] =' +ISNULL(CONVERT(NVARCHAR(3), ra.[Участок]), N' ' )
  FROM [TestDataDispancer].[dbo].[RegisterArch] AS ra
   -- Присоединяемся через Customer, чтобы получить CustomerID новой базы
   INNER JOIN Dispancer.dbo.Customer AS c ON c.CustomerTempID = ra.CustomerID 
   -- Присоединяемся к Register, чтобы получить RegisterID новой базы
   INNER JOIN Dispancer.dbo.Register AS r ON r.CustomerID = c.CustomerID 
   -- WHERE c.Arch =1 -- Не нужно, если мигрируем все
GO


/* =============================================================================
 ЧАСТЬ 5: ДОБАВЛЕНИЕ 10 ТЕСТОВЫХ ПАЦИЕНТОВ (МОЙ СКРИПТ)
============================================================================= */

PRINT N'ЧАСТЬ 5: Добавление 10 тестовых пациентов...';
GO

BEGIN TRANSACTION;
BEGIN TRY

    -- Пациент 1: Иванов Иван (Активный, диспансерная группа)
    DECLARE @CustID_1 INT, @AddrID_1 INT, @RegID_1 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_1 OUT, @MedCard = 1001, @CodeCustomer = 2025,
        @LastName = N'Иванов', @FirstName = N'Иван', @MiddleName = N'Иванович',
        @Birthday = '1980-05-10', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = N'Первичный осмотр пациента.';
    
    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_1 OUT, @CustomerID = @CustID_1, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'Центральная',
        @NumberHouse = N'10', @NumberApartment = N'5';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_1 OUT, @FirstRegister = '2023-01-15', @Diagnosis = N'F20.0',
        @RegisterTypeID = 1, @CustomerID = @CustID_1, @LandID = 2,
        @NotaBene = N'На диспансерном учете. Является регулярно.';
    PRINT N'Добавлен Пациент 1: Иванов';

    -- Пациент 2: Петрова Анна (Архив, II группа, Пенсионер)
    DECLARE @CustID_2 INT, @AddrID_2 INT, @RegID_2 INT, @InvID_2 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_2 OUT, @MedCard = 1002, @CodeCustomer = 2025,
        @LastName = N'Петрова', @FirstName = N'Анна', @MiddleName = N'Сергеевна',
        @Birthday = '1955-02-20', @APPPTPRID = 2, @GenderID = 2, @Arch = 1,
        @NotaBene = N'Переведена в архив по возрасту.';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_2 OUT, @CustomerID = @CustID_2, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 51, @NameStreet = N'Мирный',
        @NumberHouse = N'22', @NumberApartment = N'1';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_2 OUT, @FirstRegister = '2010-06-01', @FirstDeregister = '2020-01-01',
        @Diagnosis = N'F01.1', @RegisterTypeID = 4, @CustomerID = @CustID_2,
        @WhyDeRegisterID = 8, @LandID = 3, @NotaBene = N'Архивная запись'; -- ИЗМЕНЕНО WhyDeRegister на WhyDeRegisterID

    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_2 OUT, @DisabilityGroupID = 2, @DataInvalidity = '2015-03-01',
        @PeriodInvalidity = '2025-03-01', @ChiperReceptID = 1, @Incapable = 0, -- OK, < 2025-10-18
        @CustomerID = @CustID_2;

    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_2, @BenefitsCategoryID = 2; -- ID 2 = 'Пенсионеры'
    PRINT N'Добавлен Пациент 2: Петрова';

    -- Пациент 3: Сидоров Олег (Активный, консультативная группа)
    DECLARE @CustID_3 INT, @AddrID_3 INT, @RegID_3 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_3 OUT, @MedCard = 1003, @CodeCustomer = 2025,
        @LastName = N'Сидоров', @FirstName = N'Олег', @MiddleName = N'Петрович',
        @Birthday = '1992-11-30', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = N'Направлен терапевтом.';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_3 OUT, @CustomerID = @CustID_3, @City = N'Николаевка',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'Школьная',
        @NumberHouse = N'1', @NumberApartment = NULL;

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_3 OUT, @FirstRegister = '2024-02-10', @Diagnosis = N'F41.1',
        @RegisterTypeID = 3, @CustomerID = @CustID_3, @LandID = 5,
        @NotaBene = N'Консультативная группа. Рекомендовано наблюдение.';
    PRINT N'Добавлен Пациент 3: Сидоров';

    -- Пациент 4: Коваленко Мария (Активная, III группа, ЧАЭС)
    DECLARE @CustID_4 INT, @AddrID_4 INT, @RegID_4 INT, @InvID_4 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_4 OUT, @MedCard = 1004, @CodeCustomer = 2025,
        @LastName = N'Коваленко', @FirstName = N'Мария', @MiddleName = N'Игоревна',
        @Birthday = '1986-04-15', @APPPTPRID = 1, @GenderID = 2, @Arch = 0,
        @NotaBene = N'Льготная категория: ЧАЭС';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_4 OUT, @CustomerID = @CustID_4, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 10, @NameStreet = N'Шевченко',
        @NumberHouse = N'150', @NumberApartment = N'42';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_4 OUT, @FirstRegister = '2019-01-20', @Diagnosis = N'F32.2',
        @RegisterTypeID = 1, @CustomerID = @CustID_4, @LandID = 2,
        @NotaBene = N'Регулярное наблюдение.';

    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_4 OUT, @DisabilityGroupID = 3, @DataInvalidity = '2019-02-01',
        @PeriodInvalidity = '2025-01-01', @ChiperReceptID = 7, @Incapable = 0, -- ИЗМЕНЕНО НА ПРОШЛУЮ ДАТУ
        @CustomerID = @CustID_4;

    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_4, @BenefitsCategoryID = 3; -- ID 3 = 'ЧАЭС'
    PRINT N'Добавлен Пациент 4: Коваленко';

    -- Пациент 5: Бойко Андрей (Активный, без инвалидности)
    DECLARE @CustID_5 INT, @AddrID_5 INT, @RegID_5 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_5 OUT, @MedCard = 1005, @CodeCustomer = 2025,
        @LastName = N'Бойко', @FirstName = N'Андрей', @MiddleName = N'Витальевич',
        @Birthday = '1975-08-01', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = NULL;

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_5 OUT, @CustomerID = @CustID_5, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'Ярослава Мудрого',
        @NumberHouse = N'30', @NumberApartment = N'11';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_5 OUT, @FirstRegister = '2022-11-05', @Diagnosis = N'F33.1',
        @RegisterTypeID = 1, @CustomerID = @CustID_5, @LandID = 4,
        @NotaBene = N'Диспансерный учет.';
    PRINT N'Добавлен Пациент 5: Бойко';

    -- Пациент 6: Ткаченко Елена (Архив, Смерть)
    DECLARE @CustID_6 INT, @AddrID_6 INT, @RegID_6 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_6 OUT, @MedCard = 1006, @CodeCustomer = 2024,
        @LastName = N'Ткаченко', @FirstName = N'Елена', @MiddleName = N'Васильевна',
        @Birthday = '1940-01-15', @APPPTPRID = 1, @GenderID = 2, @Arch = 1,
        @NotaBene = N'Архив (смерть)';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_6 OUT, @CustomerID = @CustID_6, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'Мира',
        @NumberHouse = N'5', @NumberApartment = N'102';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_6 OUT, @FirstRegister = '2005-03-12', @FirstDeregister = '2024-01-20',
        @Diagnosis = N'F00.1', @RegisterTypeID = 5, @CustomerID = @CustID_6,
        @WhyDeRegisterID = 3, @LandID = 1, @NotaBene = N'Снята с учета по причине смерти.'; -- ИЗМЕНЕНО WhyDeRegister на WhyDeRegisterID
    PRINT N'Добавлен Пациент 6: Ткаченко';

    -- Пациент 7: Шевченко Сергей (Активный, ДПХ)
    DECLARE @CustID_7 INT, @AddrID_7 INT, @RegID_7 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_7 OUT, @MedCard = 1007, @CodeCustomer = 2025,
        @LastName = N'Шевченко', @FirstName = N'Сергей', @MiddleName = N'Леонидович',
        @Birthday = '1963-07-22', @APPPTPRID = 3, @GenderID = 1, @Arch = 0,
        @NotaBene = N'ТПР';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_7 OUT, @CustomerID = @CustID_7, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'Васильевская',
        @NumberHouse = N'44', @NumberApartment = N'2';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_7 OUT, @FirstRegister = '2021-05-30', @Diagnosis = N'F10.2',
        @RegisterTypeID = 8, @CustomerID = @CustID_7, @LandID = 7,
        @NotaBene = N'Группа ДПХ.';
    PRINT N'Добавлен Пациент 7: Шевченко';

    -- Пациент 8: Мельник Ольга (Активная, I группа, Инвалид ВОВ)
    DECLARE @CustID_8 INT, @AddrID_8 INT, @RegID_8 INT, @InvID_8 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_8 OUT, @MedCard = 1008, @CodeCustomer = 2025,
        @LastName = N'Мельник', @FirstName = N'Ольга', @MiddleName = N'Николаевна',
        @Birthday = '1948-12-07', @APPPTPRID = 1, @GenderID = 2, @Arch = 0,
        @NotaBene = N'Инвалид ВОВ';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_8 OUT, @CustomerID = @CustID_8, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 10, @NameStreet = N'Шевченко',
        @NumberHouse = N'12', @NumberApartment = N'9';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_8 OUT, @FirstRegister = '2015-02-11', @Diagnosis = N'F03',
        @RegisterTypeID = 1, @CustomerID = @CustID_8, @LandID = 3,
        @NotaBene = N'Диспансерный учет.';

    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_8 OUT, @DisabilityGroupID = 1, @DataInvalidity = '2010-01-01',
        @PeriodInvalidity = '2025-01-01', @ChiperReceptID = 1, @Incapable = 1, -- ИЗМЕНЕНО НА ПРОШЛУЮ ДАТУ
        @DateIncapable = '2012-05-20', @CustomerID = @CustID_8;

    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_8, @BenefitsCategoryID = 4; -- ID 4 = 'Инвалиды ВОВ'
    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_8, @BenefitsCategoryID = 2; -- ID 2 = 'Пенсионеры'
    PRINT N'Добавлен Пациент 8: Мельник';

    -- Пациент 9: Лысенко Виталий (Активный, конс. группа)
    DECLARE @CustID_9 INT, @AddrID_9 INT, @RegID_9 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_9 OUT, @MedCard = 1009, @CodeCustomer = 2025,
        @LastName = N'Лысенко', @FirstName = N'Виталий', @MiddleName = N'Юрьевич',
        @Birthday = '2001-03-18', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = N'Студент';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_9 OUT, @CustomerID = @CustID_9, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'Бацюка',
        @NumberHouse = N'19', @NumberApartment = N'55';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_9 OUT, @FirstRegister = '2024-03-01', @Diagnosis = N'F43.2',
        @RegisterTypeID = 3, @CustomerID = @CustID_9, @LandID = 6,
        @NotaBene = N'Консультация.';
    PRINT N'Добавлен Пациент 9: Лысенко';

    -- Пациент 10: Бондаренко Cветлана (Активная, УБД)
    DECLARE @CustID_10 INT, @AddrID_10 INT, @RegID_10 INT, @InvID_10 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_10 OUT, @MedCard = 1010, @CodeCustomer = 2025,
        @LastName = N'Бондаренко', @FirstName = N'Cветлана', @MiddleName = N'Александровна',
        @Birthday = '1990-10-25', @APPPTPRID = 1, @GenderID = 2, @Arch = 0,
        @NotaBene = N'УБД';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_10 OUT, @CustomerID = @CustID_10, @City = N'Славянск',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'Свободы',
        @NumberHouse = N'7', @NumberApartment = N'23';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_10 OUT, @FirstRegister = '2023-08-14', @Diagnosis = N'F43.1',
        @RegisterTypeID = 1, @CustomerID = @CustID_10, @LandID = 8,
        @NotaBene = N'ПТСР. Диспансерный учет.';
        
    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_10 OUT, @DisabilityGroupID = 3, @DataInvalidity = '2023-09-01',
        @PeriodInvalidity = '2025-09-01', @ChiperReceptID = 7, @Incapable = 0, -- OK, < 2025-10-18
        @CustomerID = @CustID_10;
        
    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_10, @BenefitsCategoryID = 5; -- ID 5 = 'УБД'
    PRINT N'Добавлен Пациент 10: Бондаренко';


    COMMIT TRANSACTION;
    PRINT N'Все 10 пациентов успешно добавлены.';

END TRY
BEGIN CATCH
    -- Если ошибка произошла в тестовых данных, откатываем только их
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    PRINT N'Произошла ошибка при добавлении тестовых данных! Изменения тестовых данных отменены.';
    -- Вывод информации об ошибке
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO

PRINT N'===== СКРИПТ ЗАВЕРШЕН =====';
GO