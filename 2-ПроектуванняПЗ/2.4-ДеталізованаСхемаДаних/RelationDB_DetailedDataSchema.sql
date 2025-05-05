-- Створення таблиці Користувачі
CREATE TABLE Користувачі (
    user_id NUMBER PRIMARY KEY,
    ім_я VARCHAR(50) NOT NULL,
    email VARCHAR(100) CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')),
    дата_реєстрації DATE DEFAULT SYSDATE
);

-- Створення таблиці Замовлення
CREATE TABLE Замовлення (
    order_id NUMBER PRIMARY KEY,
    user_id NUMBER REFERENCES Користувачі(user_id),
    дата_замовлення DATE DEFAULT SYSDATE,
    статус VARCHAR(20) CHECK (статус IN ('нове', 'в обробці', 'виконане')),
    загальна_сума NUMBER(10,2) CHECK (загальна_сума >= 0)
);
