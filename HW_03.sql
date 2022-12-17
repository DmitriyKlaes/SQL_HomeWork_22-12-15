CREATE DATABASE homework_3;

USE homework_3;

CREATE TABLE `workers`
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45),
    `surname` VARCHAR(45),
    `speciality` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);

INSERT `workers`(`name`, `surname`, `speciality`, `seniority`, `salary`, `age`)
VALUES 	
	("Вася", "Васькин", "начальник", 40, 100000, 60),
    ("Петя", "Петькин", "начальник", 8, 70000, 30),
    ("Катя", "Каткина", "инженер", 2, 70000, 25),
    ("Саша", "Сашкин", "инженер", 12, 50000, 35),
    ("Иван", "Иванов", "рабочий", 40, 30000, 59),
    ("Петр", "Петров", "рабочий", 20, 25000, 40),
    ("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "рабочий", 8, 19000, 28),
    ("Юра", "Юркин", "рабочий", 5, 15000, 25),
    ("Максим", "Воронин", "рабочий", 2, 11000, 22),
    ("Юра", "Галкин", "рабочий", 3, 12000, 24),
    ("Люся", "Люськина", "уборщик", 10, 10000, 49);
	
SELECT * FROM `workers`;

-- 1. Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
SELECT `salary` 
FROM `workers` 
ORDER BY `salary`; -- по возрастанию

SELECT `salary` 
FROM `workers` 
ORDER BY `salary` DESC; -- по убыванию    

-- 2. Выведите 5 максимальных зарплат (salary)
SELECT `salary` 
FROM `workers` 
ORDER BY `salary` DESC 
LIMIT 5;

-- 3. Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)
SELECT `speciality`, SUM(`salary`) AS average_salary 
FROM `workers` 
GROUP BY `speciality`;

-- 4. Найти количество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет.
SELECT `speciality`, COUNT(*) AS count 
FROM `workers` 
WHERE `speciality` = "рабочий" AND `age` BETWEEN 24 AND 42 
GROUP BY `speciality`;

-- 5. Найти количество специальностей
SELECT COUNT(DISTINCT `speciality`) as count_spec
FROM `workers`;

-- 6. Вывести специальности, у которых средний возраст сотрудника меньше 44 лет
SELECT `speciality`, FLOOR(AVG(`age`)) as av_age
FROM `workers`
GROUP BY `speciality`
HAVING AVG(`age`) < 44;
