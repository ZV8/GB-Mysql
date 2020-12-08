--    Практическое задание по теме “Транзакции, переменные, представления”
--
-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
--    Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

SELECT * FROM shop.users;
SELECT * FROM sample.users;

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;


-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products
--    и соответствующее название каталога name из таблицы catalogs.

CREATE OR REPLACE VIEW products_catalogs AS
  SELECT
    p.name AS product,
    c.name AS catalog
  FROM products AS p
  JOIN catalogs AS c
  ON p.catalog_id = c.id;