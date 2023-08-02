insert into category (category_id, title)
values (1, 'Смартфоны'),
       (2, 'Аудиотехника'),
       (3, 'Аксессуары');

insert into subcategory (subcategory_id,parent_id, category_id, title)
values (11, null, 1, 'Apple'),
       (12, null, 1, 'Samsung'),
       (13, null, 1, 'Huawei'),
       (21, null, 2, 'Наушники'),
       (22, null, 2, 'Колонки'),
       (211, 21, 2, 'Беспроводные наушники'),
       (212, 21, 2, 'Проводные наушники'),
       (221, 22, 2, 'Портативные колонки'),
       (222, 22, 2, 'Колонки с голосовым помощником'),
       (31, null, 3, 'Чехлы'),
       (32, null, 3, 'Зарядные устройства'),
       (33, null, 3, 'Защитные стекла'),
       (311, 31, 3, 'Чехлы на IPhone'),
       (312, 31, 3, 'Чехлы на Samsung'),
       (313, 31, 3, 'Чехлы на Huawei'),
       (321, 32, 3, 'Зарядные устройства lightning'),
       (322, 32, 3, 'Зарядные устройства Type-C'),
       (323, 32, 3, 'Зарядные устройства micro USB'),
       (331, 33, 3, 'Стекла на IPhone'),
       (332, 33, 3, 'Стекла на Samsung'),
       (333, 33, 3, 'Стекла на Huawei');

insert into product_property (product_property_id)
values  (111),
        (112),
        (113),
        (121),
        (122),
        (123),
        (124),
        (131),
        (132),
        (133),
        (211),
        (212),
        (213),
        (214),
        (215),
        (216),
        (217),
        (218),
        (219),
        (220),
        (221),
        (222),
        (223),
        (224),
        (225),
        (226),
        (311),
        (312),
        (313),
        (314),
        (315),
        (316),
        (317),
        (318),
        (319),
        (320),
        (321),
        (322),
        (323),
        (324),
        (325),
        (326),
        (327),
        (328),
        (329),
        (330),
        (331);



insert into property (property_id, product_property_id, name, value)
values (1, 111, 'Модель', 'Apple IPhone 12'),
       (2, 111, 'Память', '128 Гб'),
       (3, 111, 'Цвет', 'Белый'),
       (4, 111, 'Емкость аккумулятора', '2815 мАч'),
       (5, 111, 'Страна производитель', 'Китай'),
       (6, 112, 'Модель', 'Apple IPhone 13'),
       (7, 112, 'Память', '256 Гб'),
       (8, 112, 'Цвет', 'Белый'),
       (9, 112, 'Емкость аккумулятора', '2815 мАч'),
       (10, 112, 'Страна производитель', 'Китай'),
       (11, 113, 'Модель', 'Apple IPhone 14'),
       (12, 113, 'Память', '128 Гб'),
       (13, 113, 'Цвет', 'Белый'),
       (14, 113, 'Емкость аккумулятора', '3200 мАч'),
       (15, 113, 'Страна производитель', 'Китай'),
       (16, 121, 'Модель', 'Samsung S22'),
       (17, 121, 'Память', '128 Гб'),
       (18, 121, 'Цвет', 'Лавандовый'),
       (19, 121, 'Емкость аккумулятора', '3590 мАч'),
       (20, 121, 'Страна производитель', 'Вьетнам'),
       (21, 122, 'Модель', 'Samsung S22+'),
       (22, 122, 'Память', '256 Гб'),
       (23, 122, 'Цвет', 'Белый'),
       (24, 122, 'Емкость аккумулятора', '4370 мАч'),
       (25, 122, 'Страна производитель', 'Китай'),
       (26, 123, 'Модель', 'Samsung S21'),
       (27, 123, 'Память', '128 Гб'),
       (28, 123, 'Цвет', 'Белый'),
       (29, 123, 'Емкость аккумулятора', '3880 мАч'),
       (30, 123, 'Страна производитель', 'Китай'),
       (31, 124, 'Модель', 'Samsung S21'),
       (32, 124, 'Память', '256 Гб'),
       (33, 124, 'Цвет', 'Лаандовый'),
       (34, 124, 'Емкость аккумулятора', '3880 мАч'),
       (35, 124, 'Страна производитель', 'Вьетнам'),
       (36, 131,'Модель', 'HUAWEI P50 Pocket'),
       (37, 131, 'Память', '512 Гб'),
       (38, 131, 'Цвет', 'Золотой'),
       (39, 131, 'Емкость аккумулятора', '3900 мАч'),
       (40, 131, 'Страна производитель', 'Китай'),
       (41, 132,'Модель', 'HUAWEI P50 Pocket'),
       (42, 132, 'Память', '256 Гб'),
       (43, 132, 'Цвет', 'Золотой'),
       (44, 132, 'Емкость аккумулятора', '3900 мАч'),
       (45, 132, 'Страна производитель', 'Китай'),
       (46, 133,'Модель', 'HUAWEI P50'),
       (47, 133, 'Память', '256 Гб'),
       (48, 133, 'Цвет', 'Черный'),
       (49, 133, 'Емкость аккумулятора', '4100 мАч'),
       (50, 133, 'Страна производитель', 'Китай'),
       (51, 211, 'Модель', 'Samsung Buds 2'),
       (52, 211, 'Bluetooth', '5.2'),
       (53, 211, 'Цвет', 'Черный'),
       (54, 211, 'Емкость аккумулятора', '61 мАч'),
       (55, 211, 'Страна производитель', 'Вьетнам'),
       (56, 212, 'Модель', 'Samsung Buds 2'),
       (57, 212, 'Bluetooth', '5.2'),
       (58, 212, 'Цвет', 'Белый'),
       (59, 212, 'Емкость аккумулятора', '61 мАч'),
       (60, 212, 'Страна производитель', 'Вьетнам'),
       (61, 213, 'Модель', 'Xiaomi Redmi Buds 4 Pro'),
       (62, 213, 'Bluetooth', '5.3'),
       (63, 213, 'Цвет', 'Черный'),
       (64, 213, 'Емкость аккумулятора', '50 мАч'),
       (65, 213, 'Страна производитель', 'Китай'),
       (66, 214, 'Модель', 'Sony WF-1000XM4'),
       (67, 214, 'Bluetooth', '5.2'),
       (68, 214, 'Цвет', 'Черный'),
       (69, 214, 'Емкость аккумулятора', '50 мАч'),
       (70, 214, 'Страна производитель', 'Китай'),
       (71, 215, 'Модель', 'Edifier W820NB'),
       (72, 215, 'Bluetooth', '5.0'),
       (73, 215, 'Цвет', 'Черный'),
       (74, 215, 'Емкость аккумулятора', '400 мАч'),
       (75, 215, 'Страна производитель', 'Китай'),
       (76, 216, 'Модель', 'Razer Barracuda X'),
       (77, 216, 'Цвет', 'Белый'),
       (78, 216, 'Игровые наушники', 'Да'),
       (79, 216, 'Подсветка', 'Нет'),
       (80, 216, 'Страна производитель', 'Германия'),
       (81, 217, 'Модель', 'PlayStation PULSE 3D'),
       (82, 217, 'Цвет', 'Белый'),
       (83, 217, 'Игровые наушники', 'Да'),
       (84, 217, 'Подсветка', 'Нет'),
       (85, 217, 'Страна производитель', 'Япония'),
       (86, 218, 'Модель', 'Apple EarPods (Lightning)'),
       (87, 218, 'Цвет', 'Белый'),
       (88, 218, 'Игровые наушники', 'Нет'),
       (89, 218, 'Подсветка', 'Нет'),
       (90, 218, 'Страна производитель', 'Япония'),
       (91, 219, 'Модель', 'SVEN AP-U980MV'),
       (92, 219, 'Цвет', 'Черный'),
       (93, 219, 'Игровые наушники', 'Да'),
       (94, 219, 'Подсветка', 'Разноцветная'),
       (95, 219, 'Страна производитель', 'Вьетнам'),
       (96, 221, 'Модель', 'JBL GO 3'),
       (97, 221, 'Цвет', 'Черный'),
       (98, 221, 'Мощность', '4.2 Вт'),
       (99, 221, 'Bluetooth', '5.1'),
       (100, 221, 'Емкость аккумулятора', '750мАч'),
       (101, 221, 'Страна производитель', 'Китай'),
       (102, 222, 'Модель', 'DEXP P570'),
       (103, 222, 'Цвет', 'Черный'),
       (104, 222, 'Мощность', '50 Вт'),
       (105, 222, 'Bluetooth', '5.1'),
       (106, 222, 'Емкость аккумулятора', '3600 мАч'),
       (107, 222, 'Страна производитель', 'Китай'),
       (108, 223, 'Модель', 'JBL Xtreme 3'),
       (109, 223, 'Цвет', 'Черный'),
       (110, 223, 'Мощность', '100 Вт'),
       (111, 223, 'Bluetooth', '5.1'),
       (112, 223, 'Емкость аккумулятора', '5000 мА*ч'),
       (113, 223, 'Страна производитель', 'Китай'),
       (114, 224, 'Модель', 'Яндекс Станция Макс'),
       (115, 224, 'Цвет', 'Черный'),
       (116, 224, 'Мощность', '65 Вт'),
       (117, 224, 'Bluetooth', '4.2'),
       (118, 224, 'Питание', 'От сети'),
       (119, 224, 'Страна производитель', 'Китай'),
       (120, 225, 'Модель', 'Новая Яндекс.Станция Мини'),
       (121, 225, 'Цвет', 'Серый'),
       (122, 225, 'Мощность', '10 Вт'),
       (123, 225, 'Bluetooth', '5.0'),
       (124, 225, 'Питание', 'От сети'),
       (125, 225, 'Страна производитель', 'Китай'),
       (126, 226, 'Модель', 'Яндекс Станция Лайт'),
       (127, 226, 'Цвет', 'Бежевый'),
       (128, 226, 'Мощность', '5 Вт'),
       (129, 226, 'Bluetooth', '5.0'),
       (130, 226, 'Питание', 'От сети'),
       (131, 226, 'Страна производитель', 'Китай'),
       (132, 311, 'Модель', 'Apple Silicone Case with MagSafe'),
       (133, 311, 'Материал', 'ТПУ'),
       (134, 311, 'Цвет', 'синий'),
       (135, 312, 'Модель', 'Apple Silicone Case with MagSafe'),
       (136, 312, 'Материал', 'ТПУ'),
       (137, 312, 'Цвет', 'фиолетовый'),
       (138, 313, 'Модель', 'Apple Silicone Case with MagSafe'),
       (139, 313, 'Материал', 'ТПУ'),
       (140, 313, 'Цвет', 'синий'),
       (141, 314, 'Модель', 'Apple Clear Case with MagSafe'),
       (142, 314, 'Материал', 'поликарбонат'),
       (143, 314, 'Цвет', 'прозрачный'),
       (144, 315, 'Модель', 'Apple Leather Case with MagSafe'),
       (145, 315, 'Материал', 'натуральная кожа, поликарбонат'),
       (146, 315, 'Цвет', 'коричневый'),
       (147, 316, 'Модель', 'Apple Leather Case with MagSafe'),
       (148, 316, 'Материал', 'натуральная кожа, поликарбонат'),
       (149, 316, 'Цвет', 'черный'),
       (150, 317, 'Модель', 'Apple Silicone Case with MagSafe'),
       (151, 317, 'Материал', 'ТПУ'),
       (152, 317, 'Цвет', 'желтый'),
       (153, 318, 'Модель', 'Samsung Smart Clear View Cover'),
       (154, 318, 'Материал', 'поликарбонат, полиуретан'),
       (155, 318, 'Цвет', 'черный'),
       (156, 319, 'Модель', 'Samsung Silicone Cover with Strap'),
       (157, 319, 'Материал', 'поликарбонат, ТПУ'),
       (158, 319, 'Цвет', 'синий'),
       (159, 320, 'Модель', 'DF'),
       (160, 320, 'Материал', 'ТПУ'),
       (161, 320, 'Цвет', 'прозрачный'),
       (162, 321, 'Модель', 'DF'),
       (163, 321, 'Материал', 'ТПУ'),
       (164, 321, 'Цвет', 'черный'),
       (165, 322, 'Модель', 'Aceline Strap'),
       (166, 322, 'Материал', 'полиуретан, ТПУ'),
       (167, 322, 'Цвет', 'черный'),
       (168, 323, 'Разъем 1', 'Lightning 8-pin MFI'),
       (169, 323, 'Зазъем 2', 'USB'),
       (170, 323, 'Длина', '1 м'),
       (171, 324, 'Разъем 1', 'Lightning 8-pin MFI'),
       (172, 324, 'Зазъем 2', 'USB Type-C'),
       (173, 324, 'Длина', '1 м'),
       (174, 325, 'Разъем 1', 'Lightning 8-pin'),
       (175, 325, 'Зазъем 2', 'USB Type-C'),
       (176, 325, 'Длина', '1 м'),
       (177, 326, 'Разъем 1', 'USB Type-C'),
       (178, 326, 'Зазъем 2', 'USB Type-C'),
       (179, 326, 'Длина', '1 м'),
       (180, 327, 'Разъем 1', 'USB Type-C'),
       (181, 327, 'Зазъем 2', 'USB'),
       (182, 327, 'Длина', '1 м'),
       (183, 328, 'Разъем 1', 'micro USB'),
       (184, 328, 'Зазъем 2', 'USB'),
       (185, 328, 'Длина', '1 м'),
       (186, 329, 'Модель', 'Apple'),
       (187, 329, 'Совместимые модели', 'Apple iPhone 13 Pro, Apple iPhone 13, Apple iPhone 14'),
       (188, 329, 'Вид стекла', '2.5D'),
       (189, 330, 'Модель', 'Apple'),
       (190, 330, 'Совместимые модели', 'Apple iPhone 12 Pro, Apple iPhone 12'),
       (191, 330, 'Вид стекла', '2.5D'),
       (192, 331, 'Модель', 'Samsung'),
       (193, 331, 'Совместимые модели', 'Samsung Galaxy A22 5G, Samsung Galaxy A22s 5G'),
       (194, 331, 'Вид стекла', '2.5D');




insert into product (product_id, product_property_id, title, description, amount, picture_url, price, discount_price, discount, subcategory_id)
values (1, 111, 'Apple IPhone 12', 'Дисплей представляет собой прямоугольник с закруглёнными углами. Диагональ этого прямоугольника без учёта закруглений составляет 5,42 дюйма (для iPhone 12 mini), 5,85 дюйма (для iPhone 11 Pro, iPhone XS, iPhone X), 6,06 дюйма (для iPhone 12 Pro, iPhone 12, iPhone 11, iPhone XR), 6,46 дюйма (для iPhone 11 Pro Max, iPhone XS Max) или 6,68 дюйма (для iPhone 12 Pro Max). Фактическая область просмотра меньше.',
        3, 'https://cdn.svyaznoy.ru/upload/iblock/7f2/ruru_iphone12_q121_white_pdp-image-1b.jpg/resize/453x480/',
        65000, 63000, true, 11),
        (2, 112, 'Apple IPhone 13', 'Apple iPhone 13 обладает по-настоящему превосходным экраном с высокой яркостью и контрастностью, однако у него есть два недостатка. Во-первых, дисплей имеет стандартную частоту обновления 60 Гц, тогда как конкуренты имеют 120 Гц. Во-вторых, хоть размеры выреза в дисплее уменьшились, он все равно кажется большим. При просмотре HDR-контента яркость вырастает до целых 1200 нит, а в стандартном режиме – 800 нит. Минимальная яркость тоже отличная – дисплей не будет слепить пользователя ночью.',
         5, 'https://cdn.svyaznoy.ru/upload/iblock/2df/iphone_13_q421_midnight_pdp_image_position-1a__ru-ru.jpg/resize/453x480/',
         75000, 70000, true, 11),
       (3, 113, 'Apple IPhone 14', 'Защита экрана Ceramic Shield, прочная как никакое другое стекло. Водонепроницаемость. Алюминий, используемый в аэрокосмической отрасли. Два размера на выбор, 6.1 дюйма и 6.7 дюйма. И самое долгое время работы от батареи в истории iPhone.',
        5, 'https://cdn.svyaznoy.ru/upload/iblock/000/0004936c8766c3d968e4ee3e56daf053.jpg/resize/453x480//',
        89000, 75000, true, 11),
       (4, 121, 'Samsung S22', 'Смартфон Samsung Galaxy S22 с оперативной памятью объемом 8 Гб и встроенной — 128 Гб обладает безрамочным сенсорным экраном диагональю 6,1 дюйма, созданным с использованием технологии Dynamic AMOLED 2X.',
        11, 'https://img.mvideo.ru/Big/30065802bb.jpg',
        58000, 56000, true, 12),
       (5, 122, 'Samsung S22+', 'Смартфон Samsung Galaxy S22+, белый поддерживает работу двух nano-SIM и eSim карт в сетях 2G-5G. Высокую вычислительную способность устройства на операционной системе Android 12 обеспечивают восьмиядерный процессор Samsung Exynos 2200, оперативная (8 Гб) и внутренняя (128 Гб) память.',
        7, 'https://img.mvideo.ru/Big/400018760bb.jpg',
        82000, 80000, true, 12),
       (6, 123, 'Samsung S21', 'Вы больше никогда не пропустите тот идеальный момент для снимка. Встречайте Samsung Galaxy S21 5G и S21+ 5G, созданные произвести революцию в мире видеосъемки и фотографии. С более чем кинематографическим разрешением 8K вы можете делать невероятные фотографии прямо из видео. Это все есть в обеих моделях: 64 МП, самый шустрый чип Samsung и мощный аккумулятор на весь день. Они просто стали легендарными.',
        5, 'https://img.mvideo.ru/Pdb/400088794b.jpg',
        57000, 55000, true, 12),
       (7, 124, 'Samsung S21', 'Вы больше никогда не пропустите тот идеальный момент для снимка. Встречайте Samsung Galaxy S21 5G и S21+ 5G, созданные произвести революцию в мире видеосъемки и фотографии. С более чем кинематографическим разрешением 8K вы можете делать невероятные фотографии прямо из видео. Это все есть в обеих моделях: 64 МП, самый шустрый чип Samsung и мощный аккумулятор на весь день. Они просто стали легендарными.',
        2, 'https://cdn.svyaznoy.ru/upload/iblock/a05/samsung_pd_sm_g991_bzvgser_900x1200_1.jpg',
        67000, 65000, true, 12),
       (8, 131, 'HUAWEI P50 Pocket', 'Необычная раскладная конструкция смартфона Huawei P50 Pocket с объемом встроенной памяти 512 ГБ не оставит равнодушным даже наиболее требовательного пользователя. Ощутить всю глубину просматриваемого контента с детальным отображением мельчайших элементов вам позволит 6.9-дюймовый дисплей, разрешение которого достигает 2790х1188 пикс. ',
        15, 'https://c.dns-shop.ru/thumb/st4/fit/0/0/175ed84ee4e791341efba004b21ced1e/bc75ebec42e14b6dbf1abcdc8edab781cd8a7e07ee56f9d3f6736b982e6b85ae.jpg.webp',
        69000, 67000, true, 13),
       (9, 132, 'HUAWEI P50 Pocket', 'Необычная раскладная конструкция смартфона Huawei P50 Pocket с объемом встроенной памяти 512 ГБ не оставит равнодушным даже наиболее требовательного пользователя. Ощутить всю глубину просматриваемого контента с детальным отображением мельчайших элементов вам позволит 6.9-дюймовый дисплей, разрешение которого достигает 2790х1188 пикс. ',
        10, 'https://c.dns-shop.ru/thumb/st4/fit/0/0/175ed84ee4e791341efba004b21ced1e/bc75ebec42e14b6dbf1abcdc8edab781cd8a7e07ee56f9d3f6736b982e6b85ae.jpg.webp',
        65000, 62000, true, 13),
       (10, 133, 'HUAWEI P50', 'Huawei P50 оснащен 6.5-дюймовым OLED-дисплеем с разрешением 2700x1224 точек и частотой обновления до 90 Гц. Установлен чип Snapdragon 888, искусственно лишенный поддержки 5G. В тыльной части корпуса располагается тройная камера, созданная в партнерстве с Leica: она содержит датчики на 50, 13 и 12 млн пикселей. Батарея емкостью 4100 мА·ч поддерживает 66-ватную подзарядку SuperCharge.',
        4, 'https://c.dns-shop.ru/thumb/st1/fit/0/0/1cc5440fcbbaae8e5697e61f15d0980f/0a5d4dcd76ccf1183e108eab7b641de4b90111291756c7685498824cbf867f17.jpg.webp',
        40000, 38000, true, 13),
       (11, 211, 'Наушники TWS Samsung Buds 2 черный', 'Наушники TWS Samsung Buds 2 с классическим черным цветом корпуса и белым зарядным кейсом созданы для того, чтобы радовать взыскательных меломанов глубоким и насыщенным звуком. Модель с внутриканальной конструкцией комфортно фиксируется в ушах, а полное отсутствие проводов позволит вам в процессе прослушивания музыки свободно заниматься любыми делами. ',
         5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/abb7b3a8c3d6cd6376a7a78b14ff56ee/38352c9891b021812400221dc3fdf35d2695bcb91e349445cdc5547d14af5403.jpg.webp',
         7500, 7000, true, 211),
       (12, 212, 'Наушники TWS Samsung Buds 2 белый', 'Наушники TWS Samsung Buds 2 представляют собой полностью беспроводную гарнитуру, которая порадует самого взыскательного меломана насыщенным и глубоким звуком. Модель стала обладательницей двухполосной акустики, за счет которой любимая музыка будет звучать безупречно во всем диапазоне частот. ',
         5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/f3cb90c2b55ced980d6144986ff93220/800d39bba3cad37f66fa4d80c1acf2eb38a6f403b400619fe1206dd0ce77abbb.jpg.webp',
         7500, 7000, true, 211),
       (13, 213, 'Наушники TWS Xiaomi Redmi Buds 4 Pro черный', 'Наушники TWS Xiaomi Redmi Buds 4 Pro – отличный выбор для поклонников активного образа жизни. Устройство, соответствующее концепции True Wireless Stereo, лишено проводов полностью: амбушюры не связаны между собой физически. Наушники используют для подключения к смартфонам, планшетам и другой технике интерфейс Bluetooth.',
         5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/c577d6a148f78a69a0527c54819ed4df/cf21a8839cbcc4c4775d01979d25371cd900d86f43206b8ab12b47f0fe9dabbc.jpg.webp',
           5500, 5000, true, 211),
       (14, 214, 'Наушники TWS Sony WF-1000XM4 черный', 'Оснащенные амбушюрами из мягкой пены наушники TWS Sony WF-1000XM4 исключительно комфортны. Устройство станет оправданным выбором для любителей музыки, являющихся поклонниками активного образа жизни. Наушники, соответствующие концепции True Wireless Stereo, лишены проводов полностью: амбушюры не связаны между собой физически. Устройство защищено от воздействия дождя.',
         5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/6ddae01848b750b84178b863a36b2bf5/f78a081de793e645d1663d7aac215fff283ad3edc4c2aa0115acefc21d1228c8.jpg.webp',
           18500, 18000, true, 211),
       (15, 215, 'Bluetooth-гарнитура Edifier W820NB черный', 'Bluetooth гарнитура Edifier W820NB благодаря высокой функциональности и качеству звука подарит вам яркие эмоции при использовании. В основе модели используются излучатели динамического типа диаметром 40 мм. ',
         5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/b3813f4ac57adab4e311887d4f681967/091b4e7ae7fd4937bc7c9d4ec805f9a9b94a4914b7451234a2b33fe9d4571c57.jpg.webp',
           5000, 4000, true, 211),
       (16, 216, 'Радиочастотная гарнитура Razer Barracuda X белый', 'Одна гарнитура для всего — Razer Barracuda X это универсальная, легкая беспроводная игровая гарнитура, предназначенная для легко соединяемого использования на ПК, PlayStation, Nintendo Switch и Android.',
         5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/4274cc367927327134bbd08bb9cfa78b/660ad56e0725c7a1be29b6e7f26718599c0610cdf8f22860c9007abfa71bafc5.jpg.webp',
           6000, 5000, true, 212),
       (17, 217, 'Радиочастотная гарнитура PlayStation PULSE 3D белый', 'Наслаждайтесь безупречным качеством беспроводной связи благодаря гарнитуре, оптимизированной для 3D-звука на консолях PS5. Беспроводная гарнитура PULSE 3D имеет усовершенствованный дизайн и оснащена двумя микрофонами с шумоподавлением, зарядкой через USB Type-C и панелью с удобными элементами управления.',
         5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/d528100fe52b09548753dcffa87880b4/3225131e09ce535c6abf6a33c3137371d86c18c696082db2983c1cf927f8c449.jpg.webp',
           11000, 10000, true, 212),
       (18, 218, 'Проводная гарнитура Apple EarPods (Lightning) белый', 'Гарнитура проводная Apple EarPods (Lightning) привлекает соотношением качеств и функциональности. Компактность - основное ее достоинство. Она имеет внушительную широкую совместимость с разнотипными устройствами Apple. Данная гарнитура соответствует формату стерео, обладает дополнительной шумоизоляцией, что положительно сказывается на звуке.',
         5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/540fcd94dc295bdfc7893e703397b80a/42f1c7d01e4399e3655239125b9630ce6c7ff3c900ce5bf02154b62a7e69f963.jpg.webp',
           2500, 2000, true, 212),
       (19, 219, 'Проводная гарнитура SVEN AP-U980MV черный', 'Наушники Sven AP-U980MV – отличное геймерское устройство. При их создании было реализовано объемное звучание в формате 7.1. Удалось повысить качество воспроизведения и получать еще больше удовольствия от использования.
            Основной цвет наушников Sven AP-U980MV – черный, он совмещается с синими элементами. Создана динамическая подсветка, она придает эффектный дизайн. Изящный внешний вид понравится владельцам.',
        5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/dda0ba5909de1859e691c80cf6d1ebf2/6a53177241633ba4ff23d9eb0fa0a1bd9643fe6019b46458f2207c46003efe5b.jpg.webp',
           2500, 2000, true, 212),
       (20, 221, 'Портативная колонка JBL GO 3 черный', 'Портативная колонка JBL GO 3 разработана специально для любителей прослушивания музыки, которые нуждаются в компактном и надежном решении на каждый день. Динамик мощностью 4.2 Вт воспроизводит насыщенный и четкий звук без искажений независимо от уровня громкости. Акустика подключается к устройствам посредством технологии Bluetooth 5.1 и оснащена разъемом USB Type-C.',
           4, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/17982d2fdaa6de726cb4a38e313ba308/5fdbffccf809777cc30197a84a7b647cf73460afac805b9b73fdcd9fc8d91ce1.jpg.webp',
           4000, 3500, true, 221),
       (21, 222, 'Портативная колонка DEXP P570 черный', 'Портативная колонка DEXP P570 благодаря стереодинамикам выходной мощностью 50 Вт обеспечивает воспроизведение четкого и реалистичного звука с насыщенными басами. Акустика способна проигрывать аудиоконтент в востребованных форматах с различных источников. ',
        4, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/2be960f89da54acb0eceebea3ce34427/d0be656c2ff7e01e34495fe15732c1b37634c0f41ac351812d2caab1bb16980a.jpg.webp',
           4000, 3500, true, 221),
       (22, 223, 'Портативная колонка JBL Xtreme 3 черный', 'Портативная колонка JBL Xtreme 3 отличается мощным звуком, который создают 4 динамика общей мощностью 50 Вт, а также два пассивных излучателя, работающие на низких частотах. Благодаря функции «PartyBoost» вы можете синхронизировать работу колонки другими колонками и динамиками для получения удивительного, объемного звучания.',
        4, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/939f1f2f4ad762b5117e938259e8098f/4d64440bb521aecdf3439a6a8aa57235d9a4f9f2298dea756121039ea27e54d6.jpg.webp',
           28000, 26000, true, 221),
       (23, 224, 'Умная колонка Яндекс Станция Макс черный', 'Умная колонка Яндекс.Станция Макс выполнена в компактном корпусе черного цвета. Модель имеет акустическую систему Hi-fi, семь микрофонов и обеспечивает просмотр видео в формате 4К. Устройство оснащено голосовым помощником Алиса. Изделие поддерживает опцию умного дома, поэтому пользователь может включить на расстоянии чайник, свет, любые устройства или задать другие команды.',
        4, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/5a02acfd308befe27d0d9afdd691b466/17375b06990b7205e8345790205729cbef28e859ee27de2e5b287a719b8c1440.png.webp',
           29000, 26000, true, 222),
       (24, 225, 'Умная колонка Новая Яндекс.Станция Мини (с часами) серый', 'Умная колонка Яндекс.Станция Мини выполнена в компактном круглом корпусе с отделкой из ткани в сером цвете и отличается широкими функциональными возможностями. Благодаря голосовому помощнику Алиса колонка умеет быстро отвечать на интересующие вопросы, запускать мультимедийный и развлекательный контент, выполнять поручения и осуществлять поиск необходимой информации. ',
        4, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/fb09feb8b58b5b3767cca2f06886e35f/779f455a030dfd841c4fafcca4ce5caec99b5ac04d3be0f3ec73ae8158850d85.jpg.webp',
           8000, 6500, true, 222),
       (25, 226, 'Умная колонка Яндекс Станция Лайт бежевый', 'Умная колонка Яндекс Станция Лайт с голосовым помощником Алиса и сенсорным управлением предлагает широкие возможности для управления музыкой и различными приложениями, получения необходимой информации по запросу и других задач. Она выполнена в круглом пластиковом корпусе бежевого цвета и оборудована динамиком мощностью 5 Вт, который обеспечивает воспроизведение чистого и насыщенного звука.',
        4, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/305789ba03e793068359c89e33f2c047/dca6cd0fec59041edfd117ed7e347079ff896c920697734a4e7a1ea237df202e.jpg.webp',
           5000, 4500, true, 222),
        (26, 311, 'Накладка Apple Silicone Case with MagSafe для Apple iPhone 13 синий', 'Накладка для Apple iPhone 13 - Apple Silicone Case MM273ZE/A изготовлена с использованием прочного, гибкого и устойчивого к повреждениям силикона, поэтому при установке она практически не увеличивает габариты смартфона и надежно защищает корпус от различных неблагоприятных воздействий. ',
            5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/0de51649819b06bffd6a24a65fee5207/19bdfa997fd0c45ec73645a74834da417747e8403dcfd2a0c71d12bb435cb416.jpg.webp',
            4500, 4000, false, 311),
       (27, 312, 'Накладка Apple Silicone Case with MagSafe для Apple iPhone 14 Pro Max фиолетовый', 'Накладка Apple Silicone Case with MagSafe предназначена для совместного использования со смартфоном Apple iPhone 14 Pro Max, одновременно обеспечивая стильный вид и высокий уровень защищенности от различных неблагоприятных воздействий. ',
           5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/d5269abd15406876954fb50e35b9d060/37ff03cc7a49012e9383c3eb1425c36888b152eb881b7b1c5aa2de6068369862.jpg.webp',
           5500, 5200, true, 311),
       (28, 313, 'Накладка Apple Silicone Case with MagSafe для Apple iPhone 14 Pro синий', 'Накладка Apple Silicone Case with MagSafe ‒ надежный защитный аксессуар для Apple iPhone 14 Pro. Чехол синего цвета с фирменным логотипом на поверхности легко надевается на корпус смартфона, удерживаясь на нем благодаря давлению на рамку. Аксессуар не создает зазоров, поэтому не пропускает внутрь влагу и загрязнения, сохраняя чистоту устройства.',
           5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/2046a60a256944e6fc1e364b7fc76221/bce48568ffa49275ac38345ec7316dbfdd5b7de1d590d1a6fbed8246e7b13b27.jpg.webp',
           5000, 4000, false, 311),
       (29, 314, 'Накладка Apple Clear Case with MagSafe для Apple iPhone 13 прозрачный', 'Накладка для Apple iPhone 13 - Apple Clear Case MM2X3ZE/A выполнена из качественного прозрачного силикона с хорошей гибкостью, поэтому удобно размещается на корпусе смартфона и обеспечивает достаточно высокий уровень защищенности от различных неблагоприятных факторов. ',
         5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/9c060b3cb478ddb0fb6ed8807b7f7066/5e73e844939e1ad8fa591a74bcd742506d9a2b22d428eb546fcfc85679e76e39.jpg.webp',
         3900, 3500, false, 311),
       (30, 315, 'Накладка Apple Leather Case with MagSafe для Apple iPhone 14 Pro Max коричневый', 'Накладка Apple Leather Case with MagSafe обеспечивает надежную защиту корпуса смартфона от различных неблагоприятных воздействий и удобство в пользовании. Она изготовлена из поликарбоната и натуральной кожи в презентабельной расцветке, поэтому способна длительное время сохранять изначальный внешний вид.',
        5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/2e724158853bb074504f804b5c42b32b/d1a8c71f48c5d1dfe4eedfe6b581c3372043551563a0a9d2287d75d663b0da06.jpg.webp',
           6000, 5500, true, 311),
       (31, 316, 'Накладка Apple Leather Case with MagSafe для Apple iPhone 13 Pro черный', 'Накладка для Apple iPhone 13 Pro - Apple Leather Case MM1H3ZE/A с отделкой из натуральной кожи классического черного цвета одновременно является презентабельным и надежным аксессуаром, который поможет уберечь корпус вашего смартфона от повреждений и появления дефектов. Данная накладка легко устанавливается и снимается благодаря хорошей гибкости, а также практически не увеличивает габариты устройства. ',
        5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/a761216202044ebf248678f7cee977ee/ba034df373249e90f21f2bff5d850d429061d01252c74c3c2f8d4986b74bb980.jpg.webp',
           5000, 3000, false, 311),
       (32, 317, 'Накладка Apple Silicone Case with MagSafe для Apple iPhone 14 Pro Max желтый', 'Накладка Apple Silicone Case with MagSafe оформлен в желтом цвете и предназначен для защиты Apple iPhone 14 Pro Max. Специальное покрытие поверхности чехла препятствует скапливанию пыли и следов от пальцев и сохраняет чистоту устройства. Аксессуар сделан из ТПУ, поэтому он прочный, износостойкий и эластичный. Он легко надевается на корпус, удерживается на нем за счет давления на раму.',
        5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/b1043558328af5c2d5793ccb98d3164c/efe4041ad87328c3b3f58cdf855a013ad3c0e60af864adc4133b4263590f3b92.jpg.webp',
           5000, 3000, false, 311),
       (33, 318, 'Чехол-книжка Samsung Smart Clear View Cover для Samsung Galaxy S22 черный', 'Чехол-книжка Samsung Smart Clear View Cover выполнен в черном корпусе и предназначен для защиты Samsung Galaxy S22. Он состоит из основной части, в которую устройство вставляется и крышки, закрывающей экран. Это позволяет защитить углы, боковые стороны смартфона и его экран. ',
        5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/dcb08582b2fdeda59aa4d23e409b5f63/a0714f3e9d576ce8ddb04b35cb4b598293067db2506fd107d8dc25519ed5ca4a.jpg.webp',
           5000, 3500, false, 312),
       (34, 319, 'Накладка Samsung Silicone Cover with Strap для Samsung Galaxy S22 синий/оранжевый', 'Накладка Samsung Silicone with Strap Cover ‒ легкий и прочный аксессуар, разработанный для Samsung Galaxy S22. Чехол выполнен в синем корпусе с покрытием Soft-Touch, что делает его приятным на ощупь. Особенность аксессуара в наличии сменного ремешка, закрепленного на корпусе. За него удобно держать устройство, не допуская случайного падения. ',
        5, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/dd05e039cd9bfb063aec88c0294896f3/a6eec44e5a56acbf14bc32f683422fd40bab7716fb58f2eb30585759f59143ee.jpg.webp',
           2800, 2500, false, 312),
       (35, 320, 'Накладка DF для Samsung Galaxy S22 прозрачный', 'Накладка DF ‒ легкий, тонкий и прочный защитный аксессуар для Samsung Galaxy S22. Он накладывается на заднюю панель, бока смартфона, закрывая его углы от ударов. Благодаря плотному контакту с поверхностью чехол эффективен в защите от влаги, пыли, мелкого мусора. Прозрачный аксессуар сохраняет оформление устройства, его цвет таким, каки задумал дизайнер.',
        5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/d65689d9b4ed81943a1303110d185b82/dabb2767f26297f05c5abf6b70c4737262a3d0cb6aad8f1a0d669eb606e6d7f6.jpg.webp',
           1000, 500, false, 312),
       (36, 321, 'Накладка DF для HUAWEI P50 черный', 'Накладка DF для HUAWEI P50 из термопластичного полиуретана полностью соответствует особенностям данной модели смартфона и помогает предотвратить различные повреждения. Благодаря гибкости материала чехол плотно и удобно фиксируется на корпусе, а также легко снимается при необходимости. ',
        5, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/b3d929159b0eac9b45d065a8cc83efb5/eda9e16907fec04bff19a9f8535c2b67fe0a4debe8d2284c20a237699b5da4c8.jpg.webp',
           1000, 500, false, 313),
        (37, 322, 'Чехол-книжка Aceline Strap для HUAWEI P50 черный', 'Чехол-книжка для HUAWEI P50 - Aceline Strap в черном цветовом исполнении является удобным решением для защиты как корпуса, так и дисплея смартфона от появления царапин, сколов и потертостей. В выполненном из черного термопластичного полиуретана защитном средстве предусмотрена передняя крышка, которую удерживает в закрытом положении магнитная застежка. ',
         4, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/3189eb7d174882ccb369d16f8abf4d9d/5e267e229f49902de8e120a0154c6627a261cda4bb4bc4a30a64ddf33b02d6ea.jpg.webp',
         1000, 500, false, 313),
        (38, 323, 'Кабель круглый Apple Lightning 8-pin MFI - USB белый 1 м', 'Кабель Apple Lightning 8-pin MFI-USB в белом цвете – аксессуар, используемый для подзарядки мобильных устройств. Он подойдет для применения с различной техникой Apple, в которую установлен порт Lightning 8-pin. Перед его покупкой достаточно проверить наличие этого разъема в вашем устройстве.',
         1, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/f1a727bc4161417d2c07a33a103c00a7/b83dd05bb9ededc17ef81e54ab861a98556e22f7f303e8c69d78a7bacb61a16c.jpg.webp',
         2000, 1800, false, 321),
        (39, 324, 'Кабель круглый Apple Lightning 8-pin MFI - USB Type-C белый 1 м', 'Кабель Apple Lightning 8-pin MFI - USB Type-C – фирменный аксессуар, обеспечивающий высокую надежность при совместном использовании с устройствами Apple. Сертификация MFI подчеркивает возможность использования кабеля Apple совместно с зарядными устройствами разной выходной мощностью, в том числе с технологией ускоренной зарядки. ',
         1, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/7450f4e5228f9df19dfde82cac0598d5/a1731e1e30d5006f4e36f4c550daa28a8351bd84b23b1701226f045c8ab8a94b.jpg.webp',
           2500, 2200, false, 321),
        (40, 325, 'Кабель круглый Apple Lightning 8-pin - USB Type-C белый 1 м', 'C помощью этого кабеля вы сможете подключить iPhone, iPad или iPod с разъемом Lightning к устройствам с разъемом USB‑C или Thunderbolt 3 (USB‑C) — например, к iPad для зарядки или к Mac для зарядки и синхронизации. Кроме того, этот кабель можно использовать для зарядки устройств iOS с помощью адаптера питания Apple USB‑C мощностью 18 Вт, 20 Вт, 29 Вт, 30 Вт, 61 Вт, 87 Вт или 96 Вт, а также для быстрой подзарядки некоторых моделей iPhone и iPad.',
        1, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/47376c62dad0fb746fd03a2572822a16/3a5194a3f1aaab943703b4cf59a5fe60f8259ac930f6b0bedb49201971954175.jpg.webp',
           2500, 2300, false, 321),
        (41, 326, 'Кабель круглый WIIIX USB Type-C - USB Type-C черный 1 м', 'Кабель WIIIX USB Type-C - USB Type-C оснащен двумя разъемами с симметричной конструкцией, обеспечивая удобство синхронизации при необходимости передачи файлов или подзарядки устройств. Поддержка протокола быстрого заряда помогает сократить время на восстановление энергоресурса аккумулятора. ',
        1, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/8f33a9f2826149ffd2add8bb8a2e095e/7e1e936f786a164abec5c8eddd9b3f67d1df825e7f86035d2dac9b497cf51353.jpg.webp',
           500, 450, false, 322),
        (42, 327, 'Кабель круглый WIIIX USB Type-C - USB черный 1 м', 'Кабель круглый WIIIX USB Type-C - USB с черным цветовым исполнением рассчитан на подключение мобильных устройств с разъемом USB-C для зарядки аккумулятора или передачи данных между смартфоном/планшетом и ПК, ноутбуком. ',
        1, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/d11bdca3b1c43e14e81b2d0cfceeafac/9870fd64ec00187ef5aa3238caeca75cd86b485d4cc1567fd229cc09b0406d96.jpg.webp',
           1000, 500, false, 322),
        (43, 328, 'Сетевое зарядное устройство DEXP IET002048 черный', 'Сетевое зарядное устройство DEXP IET002048 позволит вам не беспокоиться о низком заряде батареи вашего смартфона, ведь вы сможете пополнить его емкость в любое время при наличии поблизости электророзетки. Зарядный блок выполнен в гармоничном сочетании белого и черного цветов, которое вот уже на протяжении многих десятилетий является одной из самых модных тенденций. ',
        1, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/83f209c6a9f7285e67f9f284a11331b5/b83bdf28175d7bce87976db782dcf4a9f2cb449794a9020ffa6fba44d3ff66cf.jpg.webp',
           600, 450, false, 323),
        (44, 329, '6.1" Защитное стекло Red Line для экрана Apple iPhone 13/ 13 Pro/ 14', 'Защитное стекло RedLine полностью закрывает экран вашего смартфона и надежно защищает его от повреждений. Это самый надежный и технологичный способ сохранить экран вашего устройства в первозданном виде.',
         2, 'https://c.dns-shop.ru/thumb/st1/fit/500/500/22d41e6fd212c46bcfe9631d133bc8af/e0eee2c1c610537254984277b9f2de11857020a4954ced969df050eece3c1fcd.jpg.webp',
          1000, 800, true, 331),
       (45, 329, '6.1" Защитное стекло Red Line для экрана Apple iPhone 12/ 12 Pro', '6.1" Защитное стекло Red Line для смартфона Apple IPhone 12/12 Pro обезопасит экран от царапин, потертостей и последствий удара. 2.5D стекло с черной рамкой имеет олеофобное покрытие, благодаря которому отпечатки пальцев на нем менее заметны и легко удаляются. Клей по всей поверхности стекла обеспечивает отсутствие точек и эффекта масляного пятна на поверхности экрана.',
        2, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/cbfca817457f7cd869700e8bae555c18/2095e86e707d6d7e159e595581b6aa11bb4395ffb31dc4dd21d28db24d8fec00.jpg.webp',
           1000, 800, true, 331),
       (46, 329, '6.6" Защитное стекло DF для экрана Samsung Galaxy A22s 5G/ A22 5G', 'Защитное стекло спроектировано точно и полностью закрывает изогнутый по краям экран смартфона. Цветная рамка подчеркивает контуры экрана. Олеофобное покрытие предотвратит появление следов от пальцев, сохранит чувствительность сенсора на 100%, уменьшит блики на экране. Данный аксессуар максимально защитит экран смартфона от царапин, повреждений, влаги и ударов',
        2, 'https://c.dns-shop.ru/thumb/st4/fit/500/500/fd362a45680c99cbe1e121a2b190a4a2/c9938daf07ef95ba1448ee6668452794aff25b3d000fc85bd63baf35ab251d9f.jpg.webp',
           600, 300, true, 332);

