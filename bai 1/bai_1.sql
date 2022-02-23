CREATE DATABASE student_management;
USE student_management;
CREATE TABLE students(
studentID INT AUTO_INCREMENT PRIMARY KEY,
studentName VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
gender INT NOT NULL DEFAULT 1,
age INT NOT NULL CHECK(age BETWEEN 18 AND 25),
email VARCHAR(50) NOT NULL UNIQUE,
phone VARCHAR(10) NOT NULL
);
CREATE TABLE classes(
classID INT AUTO_INCREMENT PRIMARY KEY,
className VARCHAR(50) NOT NULL
);
ALTER TABLE students ADD classID INT;
ALTER TABLE students ADD FOREIGN KEY(classID) REFERENCES classes(classID);
INSERT INTO classes (className) values ("C1121G1");
INSERT INTO classes (className) values ("C1221I1");
INSERT INTO classes (className) values ("C0122H1");
INSERT INTO classes (className) values ("C0222G1");
INSERT INTO classes (className) values ("C0222I1");
INSERT INTO students (studentName, address, gender, age, email, phone) values ("Luyt", "HT", 1, 22, "abc@gmail.com", "0123456789");
INSERT INTO students (studentName, address, gender, age, email, phone) values ("Bach", "HN", 1, 20, "d@gmail.com", "0123456788");
INSERT INTO students (studentName, address, gender, age, email, phone) values ("Huy", "TB", 1, 21, "abce@gmail.com", "0123456788");
INSERT INTO students (studentName, address, gender, age, email, phone) values ("Hoa", "BG", 0, 22, "abch@gmail.com", "0123456778");
INSERT INTO students (studentName, address, gender, age, email, phone) values ("Quynh", "DN", 0, 18, "abq@gmail.com", "0123451478");
INSERT INTO students (studentName, address, gender, age, email, phone) values ("Viet", "LC", 0, 18, "abve@gmail.com", "0123452468");
INSERT INTO students (studentName, address, gender, age, email, phone) values ("Viet", "LC", 0, 17, "absve@gmail.com", "0123452468");
UPDATE students SET classID = 1;
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Hong", "HCM", 0, 18, "df3fw@gmail.com", "0123452338", 2);
SELECT * FROM students;
SELECT * FROM students WHERE gender = 1;
SELECT * FROM students WHERE (age < 20);
SELECT * FROM students WHERE (address IN ("HN", "DN", "HCM"));
SELECT * FROM students WHERE (NOT address = "HN");
SELECT * FROM students WHERE (studentName LIKE "H%");
SELECT * FROM students WHERE (studentName LIKE "Viet%");
SELECT * FROM students WHERE (studentName = "Anh");
SELECT * FROM students WHERE (classID = 1);



SELECT * FROM students WHERE (address = "HN");
SELECT * FROM students WHERE (address IN ("HN","HP", "DN", "HCM"));
