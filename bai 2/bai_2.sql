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
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Luyt", "HT", 1, 24, "abc@gmail.com", "0123456789", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Bach", "HN", 1, 22, "d@gmail.com", "0123456788", 2);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Huy", "TB", 1, 22, "abce@gmail.com", "0123456788", 3);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Hoa", "BG", 0, 24, "abch@gmail.com", "0123456778", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Quynh", "DN", 0, 22, "abq@gmail.com", "0123451478", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Lich", "NA", 0, 25, "abqsdf@gmail.com", "0123481478", 1);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Viet", "LC", 0, 18, "abve@gmail.com", "0123452468", 2);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Hong", "HCM", 0, 22, "df3fw@gmail.com", "0123452338", 2);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("GaCon", "TN", 0, 19, "df3dgrfw@gmail.com", "0123452938", 4);
INSERT INTO students (studentName, address, gender, age, email, phone, classID) values ("Meo", "HN", 1, 22, "dfda3dgrfw@gmail.com", "0143452938", 1);


/* 7.	Hi???n th??? danh s??ch h???c vi??n theo t??n gi???m d???n */
SELECT * FROM students ORDER BY studentName DESC;

/* 8.	Hi???n th??? danh s??ch h???c vi??n theo tu???i t??ng d???n */
SELECT * FROM students ORDER BY age ASC;

/* 9.	Hi???n th??? t???ng s??? l?????ng h???c vi??n c???a m???i l???p */
SElECT className, count(students.classID) as `Sy so`
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID;

/* 10.	Hi???n th??? l???p c?? s??? l?????ng h???c vi??n l?? ????ng nh???t */
SElECT className, count(students.classID) as `Sy so`
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID
ORDER BY `Sy so` DESC
LIMIT 1;

/* 11.	Hi???n th??? l???p c?? s??? l?????ng h???c vi??n l?? ??t nh???t */
SElECT className, count(students.classID) as `Sy so`
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID
ORDER BY `Sy so` ASC
LIMIT 1;

/* 12.	Th???ng k?? s??? l?????ng h???c vi??n theo ?????a ch??? */
SELECT address, count(address) as "so luong"
FROM students
GROUP BY address;

/* 13.	Hi???n th??? nh???ng l???p c?? s??? l?????ng h???c vi??n l???n h??n ho???c b???ng 3 */
SELECT className, count(students.classID) as soLuong
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID
HAVING soLuong >= 3;
    
/* 14.	Hi???n th??? nh???ng th??nh ph??? c?? s??? l?????ng h???c vi??n l???n h??n ho???c b???ng 2 */
SELECT address, COUNT(*) as cnt
FROM students
GROUP BY address
HAVING cnt >= 2;

/* 15.	Hi???n th??? h???c vi??n c?? tu???i l???n nh???t */
SELECT *
FROM students
ORDER BY age DESC
LIMIT 1;

/* 16.	Hi???n th??? h???c vi??n c?? tu???i b?? nh???t */
SELECT *
FROM students
ORDER BY age ASC
LIMIT 1;

/* 17.	X??a t???t c??? h???c vi??n c?? qu?? ??? H?? N???i */
DELETE FROM students
WHERE address = 'HNN';

/* 18.	C???p nh???t th??ng tin c???a h???c vi??n c?? qu?? ??? H?? N???i th??nh gi???i t??nh n??? */
UPDATE students
SET gender = 0
WHERE address = "HN";

/* 19.	Hi???n th??? h???c vi??n c?? s??? tu???i l???n th??? hai */
SELECT *
FROM students
WHERE age = ( SELECT max(age) FROM students
				WHERE age < (SELECT max(age) FROM students))
;

/* 20.	Hi???n th??? h???c vi???n c?? s??? tu???i nh??? th??? hai */
SELECT *
FROM students
WHERE age = ( SELECT min(age) FROM students
				WHERE age > (SELECT min(age) FROM students))
;


DELIMITER //
CREATE PROCEDURE insert_student
	(IN inputID int, IN inputName varchar(50), IN inputAddress varchar(50), IN inputClassID int)
BEGIN
	INSERT INTO student(studentID, studentName, address, classID) values (inputID, inputName, inputAddress, inputClassID);
END
// DELIMITER ;

drop procedure insert_student;
call insert_student(8,"skdjflsdjf", "HT", 1);


