-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 03 2024 г., 09:05
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `food_delivery`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`) VALUES
(1, 2, 'Улица Мога'),
(2, 1, 'Улица шора'),
(18, 2, 'Улица Гога'),
(19, 1, 'вым');

-- --------------------------------------------------------

--
-- Структура таблицы `desserts`
--

CREATE TABLE `desserts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `desserts`
--

INSERT INTO `desserts` (`id`, `name`, `description`, `image`, `restaurant_id`, `price`) VALUES
(1, 'Шоколадный пончик', ' Вкусное и аппетитное лакомство, перед которым невозможно устоять. Он имеет привлекательную округлую форму с отверстием в середине, а его поверхность покрыта гладким слоем темного шоколада.', 'https://images-ext-1.discordapp.net/external/pYFOKNoh-NzXr8zf2KRP1wywWOUIv0giK3gZkn3x4UQ/https/main-cdn.sbermegamarket.ru/big1/hlr-system/450/433/692/716/152/5/100028919280b0.png?format=webp&quality=lossless&width=720&height=480', 5, 50.00);

-- --------------------------------------------------------

--
-- Структура таблицы `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `description`, `image`, `restaurant_id`, `price`) VALUES
(2, 'Пирог с клубникой', 'Идеальное сочетание свежей сладкой клубники и нежного теста', 'https://xn----ctbefbrcbm2bgdhhijn.xn--p1ai/upload/iblock/bfe/Пирог%20с%20клубникой.png', 5, 180.00);

-- --------------------------------------------------------

--
-- Структура таблицы `drinks`
--

CREATE TABLE `drinks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `drinks`
--

INSERT INTO `drinks` (`id`, `name`, `description`, `image`, `restaurant_id`, `price`) VALUES
(1, 'Мохито', 'Освежающий и ароматный коктейль', 'https://images-ext-1.discordapp.net/external/Ppd7A_0jKPG6a5MZJiph6sYmpC4nrkMiV33IofjAcmU/https/cdn.amwine.ru/upload/resize_cache/iblock/e01/400_620_140cd750bba9870f18aada2478b24840a/e011e24994f4ba3508b6b70d297b6bd2.png?format=webp&quality=lossless', 5, 120.00);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `total`, `order_date`) VALUES
(1, 1, 2, 450.00, '2024-06-02 11:38:13'),
(2, 1, 2, 600.00, '2024-06-02 12:57:49'),
(3, 1, 2, 300.00, '2024-06-02 13:02:14'),
(4, 1, 2, 450.00, '2024-06-02 13:04:52'),
(5, 2, 1, 150.00, '2024-06-02 13:05:55'),
(6, 2, 1, 750.00, '2024-06-02 13:07:11'),
(7, 2, 1, 600.00, '2024-06-02 13:10:04'),
(8, 1, 2, 300.00, '2024-06-02 13:13:06'),
(9, 2, 1, 900.00, '2024-06-02 15:57:33'),
(10, 2, 17, 50.00, '2024-06-02 18:33:53'),
(11, 2, 1, 180.00, '2024-06-02 18:45:24'),
(12, 2, 1, 50.00, '2024-06-02 18:51:56'),
(13, 2, 1, 200.00, '2024-06-03 04:27:33'),
(14, 1, 2, 540.00, '2024-06-03 05:14:39');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `item_type`, `quantity`, `price`) VALUES
(10, 10, 1, 'dessert', 1, 50.00),
(11, 11, 2, 'dish', 1, 180.00),
(12, 12, 1, 'dessert', 1, 50.00),
(13, 13, 1, 'dessert', 4, 50.00),
(14, 14, 2, 'dish', 1, 180.00),
(15, 14, 1, 'drink', 3, 120.00);

-- --------------------------------------------------------

--
-- Структура таблицы `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `description`, `logo`) VALUES
(3, 'Coffee shop', 'Мы предлагаем широкий выбор свежесваренного кофе, который покорит сердца настоящих гурманов.', 'https://i.pinimg.com/originals/ab/13/6b/ab136b1a54b9197bb6554f8a3c080a1f.png'),
(4, 'Москва', 'Наш шеф-повар приготовит для вас изысканные блюда из свежих и качественных ингредиентов. Мы предлагаем разнообразие меню, чтобы удовлетворить вкусы каждого гостя.', 'https://moskva-rest.ru/wp-content/uploads/2017/03/logoblack500.png'),
(5, 'Boulangerle', 'У нас вы найдете широкий выбор свежих хлебобулочных изделий, пирогов и тортов, приготовленных с любовью и профессионализмом. Наши талантливые пекари используют только лучшие ингредиенты, чтобы достичь идеального сочетания вкуса и текстуры.', 'https://w1.pngwing.com/pngs/555/712/png-transparent-green-tea-irvingia-gabonensis-bakery-logo-commodity-capsule-extract-text.png');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `phone`, `role`) VALUES
(1, 'seer.stud@gmail.com', '111', 'Дмитрий Владимирович Глушков', '111', 'admin'),
(2, '111@111', '111', '111', '111', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `desserts`
--
ALTER TABLE `desserts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_desserts_restaurant` (`restaurant_id`);

--
-- Индексы таблицы `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dishes_restaurant` (`restaurant_id`);

--
-- Индексы таблицы `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_drinks_restaurant` (`restaurant_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `desserts`
--
ALTER TABLE `desserts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `drinks`
--
ALTER TABLE `drinks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `desserts`
--
ALTER TABLE `desserts`
  ADD CONSTRAINT `desserts_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `fk_desserts_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `fk_dishes_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `drinks`
--
ALTER TABLE `drinks`
  ADD CONSTRAINT `drinks_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_drinks_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
