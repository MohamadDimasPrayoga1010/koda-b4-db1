
CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(100),
    description VARCHAR(100)
);
INSERT INTO category (category_name, description) VALUES
('Fiction', 'Books that contain fictional stories'),
('Non-Fiction', 'Books based on real events and facts'),
('Science', 'Books about scientific topics'),
('History', 'Books about historical events'),
('Technology', 'Books about technology and IT'),
('Art', 'Books about painting, sculpture, and design'),
('Biography', 'Books about people''s lives'),
('Self-Help', 'Books to improve personal skills'),
('Children', 'Books for children'),
('Travel', 'Books about traveling and places');


CREATE TABLE bookshelf (
    id SERIAL PRIMARY KEY,
    shelf_code VARCHAR(20),
    book_location VARCHAR(50)
);

INSERT INTO bookshelf (shelf_code, book_location) VALUES
('A01', 'First Floor - Section A'),
('A02', 'First Floor - Section A'),
('B01', 'Second Floor - Section B'),
('B02', 'Second Floor - Section B'),
('C01', 'Third Floor - Section C'),
('C02', 'Third Floor - Section C'),
('D01', 'Fourth Floor - Section D'),
('D02', 'Fourth Floor - Section D'),
('E01', 'Fifth Floor - Section E'),
('E02', 'Fifth Floor - Section E');


CREATE TABLE officer (
    id SERIAL PRIMARY KEY,
    officer_name VARCHAR(50)
);

INSERT INTO officer (officer_name) VALUES
('Fiki'),
('Itsna'),
('Ari'),
('Anggi'),
('Federus'),
('Sidiq'),
('Yoga'),
('Dimas'),
('Putri'),
('Putra');


CREATE TABLE borrower (
    id SERIAL PRIMARY KEY,
    borrowers_name VARCHAR(50),
    borrowers_address VARCHAR(100),
    officer_id INT,  
    FOREIGN KEY (officer_id) REFERENCES officer(id)
);

INSERT INTO borrower (borrowers_name, borrowers_address, officer_id) VALUES
('Fiki', 'Depok street', 1),
('Itsna', 'natural housing', 2),
('Anggi', 'Margonda housing complex no. 14', 3),
('Sidik', 'Margonda housing complex no. 32', 4),
('Federus', 'Depok housing complex no. 114', 5),
('Kevin', 'Pancoran Complex No. 19', 6),
('Dimas', 'Pancoran Complex No. 91', 7),
('Yoga', 'global elite housing No. 17', 8),
('Aceng', 'Cherry Street', 9),
('Madun', 'global elite housing no. 90', 10);



CREATE TABLE book (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    publisher VARCHAR(100),
    published_year INT,
    category_id INT,  
    bookshelf_id INT,
    officer_id INT,   
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (bookshelf_id) REFERENCES bookshelf(id),
    FOREIGN KEY (officer_id) REFERENCES officer(id)
);

INSERT INTO book (title, author, publisher, published_year, category_id, bookshelf_id, officer_id) VALUES
('Learning PHP', 'Fiki', 'Abdulloh', 2015, 1, 1, 1),
('A Brief History of Time', 'Anggi', 'Bantam', 2019, 3, 2, 2),
('Learning JS', 'Ari', 'Madun', 2017, 4, 3, 3),
('Clean Code', 'Dimas', 'Hanz', 2018, 5, 4, 4),
('Learning Go', 'Yoga', 'Martin', 2021, 1, 5, 5),
('Learning C++', 'Putri', 'Putra', 2011, 7, 6, 6),
('Learning Phyton', 'Paulo', 'Ijah', 2019, 1, 7, 7),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Bloomsbury', 1997, 9, 8, 8),
('The Power of Habit', 'Charles Duhigg', 'Random House', 2012, 8, 9, 9),
('Lonely Planet: Japan', 'Lonely Planet', 'Lonely Planet', 2019, 10, 10, 10);


CREATE TABLE borrowing (
    id SERIAL PRIMARY KEY,
    borrower_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (borrower_id) REFERENCES borrower(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);


INSERT INTO borrowing (borrower_id, book_id, borrow_date, return_date) VALUES
(1, 3, '2024-01-15', '2024-01-25'),
(2, 5, '2024-02-10', '2024-02-20'),
(3, 2, '2024-03-01', '2024-03-10'),
(4, 8, '2024-04-05', '2024-04-15'),
(5, 1, '2024-05-07', '2024-05-17'),
(6, 4, '2024-06-10', '2024-06-20'),
(7, 7, '2024-07-01', '2024-07-11'),
(8, 9, '2024-08-02', '2024-08-12'),
(9, 10, '2024-09-03', '2024-09-13'),
(10, 6, '2024-10-04', '2024-10-14');
