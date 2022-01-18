--  Create authors table:

 CREATE TABLE authors (id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50));
 Create books table:

 CREATE TABLE books (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(100), released_year YEAR(4), author_id INT, FOREIGN KEY (author_id) REFERENCES authors(id));

--  Create users table:

 CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(30), taken_book_id INT, FOREIGN KEY (taken_book_id) REFERENCES books(id));

 ----- Insert data -----

--  Insert into authors

 INSERT INTO authors (first_name, last_name) VALUES ('Bonas', 'Kandonas'), ('Zenius', 'Stopke'), ('Timas', 'Lydas');

--  Insert into books

  INSERT INTO books (title, released_year, author_id) VALUES ('Archer', 2009, 1),
     ('Arrested Development', 2003, 3),
     ("Bob's Burgers", 2011, 1),
     ('Bojack Horseman', 2014, 1),
     ("Breaking Bad", 2008, 2),
     ('Curb Your Enthusiasm', 2000, 3),
     ("Fargo", 2014, 2),
     ('Freaks and Geeks', 1999, 3),
     ('General Hospital', 1963, 2),
     ('Halt and Catch Fire', 2014, 2),
     ('Malcolm In The Middle', 2000, 3),
     ('Pushing Daisies', 2007, 3),
     ('Seinfeld', 1989, 3),
     ('Stranger Things', 2016, 2);

-- Insert into users

 INSERT INTO users (first_name, last_name, email, taken_book_id) VALUES 
     ('Thomas', 'Stoneman', 'tommy@hotmail.com', 7),
     ('Wyatt', 'Skaggs', 'wyatt52@gmail.com', 2),
     ('Kimbra', 'Masters', 'kimbraaa@hotmail.com', 5),
     ('Domingo', 'Cortes', 'DomAndGo@yahoo.com', 14),
     ('Bolt', 'McLong', 'longBolt@yahoo.com', 12),
    ('Pinkie', 'Petit', 'pinky@gmail.com', 1),
     ('Marlon', 'Crafford', 'craffMarlon@gmail.com', 6);
