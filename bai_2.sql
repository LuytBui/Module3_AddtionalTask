DROP DATABASE student_management;
CREATE DATABASE student_management;
USE student_management;
CREATE TABLE students(
studentID INT AUTO_INCREMENT PRIMARY KEY,
studentName VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
gender INT NOT NULL DEFAULT 1,
age INT NOT NULL CHECK(age >= 18 AND age <= 25),
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
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Luyt", "HT", 1, 22, "abc@gmail.com", "0123456789", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Bach", "HN", 1, 20, "d@gmail.com", "0123456788", 2);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Huy", "TB", 1, 21, "abce@gmail.com", "0123456788", 3);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Hoa", "BG", 0, 22, "abch@gmail.com", "0123456778", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Quynh", "DN", 0, 18, "abq@gmail.com", "0123451478", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Lich", "NA", 0, 23, "abqsdf@gmail.com", "0123481478", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Viet", "LC", 0, 18, "abve@gmail.com", "0123452468", 2);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Hong", "HCM", 0, 18, "df3fw@gmail.com", "0123452338", 2);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("GaCon", "TN", 0, 19, "df3dgrfw@gmail.com", "0123452938", 4);

SELECT * FROM students ORDER BY studentName DESC;
SELECT * FROM students ORDER BY age ASC;
SELECT COUNT(classID) FROM students;
SELECT classID, count(*) AS soLuongHS FROM students GROUP BY classID ORDER BY soLuongHS DESC LIMIT 1;





