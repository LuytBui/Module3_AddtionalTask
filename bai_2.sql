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


/* 7.	Hiển thị danh sách học viên theo tên giảm dần */
SELECT * FROM students ORDER BY studentName DESC;

/* 8.	Hiển thị danh sách học viên theo tuổi tăng dần */
SELECT * FROM students ORDER BY age ASC;

/* 9.	Hiển thị tổng số lượng học viên của mỗi lớp */
SElECT className, count(students.classID) as `Sy so`
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID;

/* 10.	Hiển thị lớp có số lượng học viên là đông nhất */
SElECT className, count(students.classID) as `Sy so`
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID
ORDER BY `Sy so` DESC
LIMIT 1;

/* 11.	Hiển thị lớp có số lượng học viên là ít nhất */
SElECT className, count(students.classID) as `Sy so`
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID
ORDER BY `Sy so` ASC
LIMIT 1;

/* 12.	Thống kê số lượng học viên theo địa chỉ */
SELECT address, count(address) as "so luong"
FROM students
GROUP BY address;

/* 13.	Hiển thị những lớp có số lượng học viên lớn hơn hoặc bằng 3 */
SELECT className, count(students.classID) as soLuong
FROM classes JOIN students ON students.classID = classes.classID
GROUP BY students.classID
HAVING soLuong >= 3;
    
/* 14.	Hiển thị những thành phố có số lượng học viên lớn hơn hoặc bằng 2 */
SELECT address, COUNT(*) as cnt
FROM students
GROUP BY address
HAVING cnt >= 2;

/* 15.	Hiển thị học viên có tuổi lớn nhất */
SELECT *
FROM students
ORDER BY age DESC
LIMIT 1;

/* 16.	Hiển thị học viên có tuổi bé nhất */
SELECT *
FROM students
ORDER BY age ASC
LIMIT 1;

/* 17.	Xóa tất cả học viên có quê ở Hà Nội */
DELETE FROM students
WHERE address = 'HNN';

/* 18.	Cập nhật thông tin của học viên có quê ở Hà Nội thành giới tính nữ */
UPDATE students
SET gender = 0
WHERE address = "HN";

/* 19.	Hiển thị học viên có số tuổi lớn thứ hai */
SELECT *
FROM (SELECT *
		FROM students
        ORDER BY age DESC
        LIMIT 2
	) as temp
ORDER BY temp.age ASC
LIMIT 1;

/* 20.	Hiển thị học viện có số tuổi nhỏ thứ hai */
SELECT *
FROM (SELECT *
		FROM students
        ORDER BY age ASC
        LIMIT 2
	) as temp
ORDER BY temp.age DESC
LIMIT 1;







