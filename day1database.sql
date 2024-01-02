-- Tạo bảng courses
CREATE TABLE courses (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	price FLOAT,
	description TEXT,
	detail TEXT,
	teacher_id INT NOT NULL,
	active INT,
	created_at TIMESTAMP DEFAULT NOW(),
	updated_at TIMESTAMP DEFAULT NOW()
)

-- Đổi tên trường detail thành content và ràng buộc chuyển thành NOT NULL
ALTER TABLE courses 
RENAME COLUMN detail TO content;

-- Chuyển đổi rằng buộc của cột content thành NOT NULL
ALTER TABLE courses
ALTER COLUMN content SET NOT NULL;

-- Tạo bảng teacher
CREATE TABLE teacher (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	bio TEXT,
	created_at TIMESTAMP DEFAULT NOW(),
	updated_at TIMESTAMP DEFAULT NOW()
)

-- Thêm 3 giảng viên vào bảng teacher
INSERT INTO teacher (name,bio,created_at, updated_at)
VALUES ('Teacher 1', 'Bio 1', NOW(), NOW()),
('Teacher 2', 'Bio 2', NOW(), NOW()),
('Teacher 3', 'Bio 3', NOW(), NOW());

-- Mỗi giảng viên thêm 3 khoá học
INSERT INTO courses (name, price, description, content, teacher_id, active, created_at, updated_at)
VALUES 
	('HTML CSS PRO', 2500000, 'description1', 'content1', 1, 1, NOW(), NOW()),
	('HTML CSS FREE', 10000, 'description2', 'content2', 1, 1, NOW(), NOW()),
	('SASS PRO', 250000, 'description3', 'content3', 1, 1, NOW(), NOW()),
	('JAVARSCRIPT PRO', 250000, 'description4', 'content4', 2, 1, NOW(), NOW()),
	('JAVARSCRIPT FREE', 30000, 'descrioption5','content5', 2, 1, NOW(), NOW()),
	('NODEJS PRO', 32000, 'description6', 'content6', 2, 1, NOW(), NOW()),
	('NodeJS PRO', 45000, 'description7', 'content7', 3, 1, NOW(), NOW()),
	('NodeJS FREE', 12000, 'descriotion8', 'content8', 3, 1, NOW(), NOW()),
	('NEXT FREE', 50000, 'description9', 'content9', 3, 1, NOW(), NOW());

-- Sửa tên và giá từng khóa học thành tên mới và giá mới (Tên khóa học, giá khóa học các khóa học không được giống nhau)
UPDATE courses 
SET 
	name = 'HTML Advanced', price= 150000, updated_at = NOW()
WHERE 
	id = 1;
	
-- Sửa lại bio của từng giảng viên (Bio từng giảng viên không được giống nhau)
UPDATE teacher 
SET 
	bio = 'BIONEW', updated_at = NOW()
WHERE 
	id = 1;
	
-- Hiển thị danh sách giảng viên 
SELECT * FROM teacher

-- Hiển thị danh sách khoá học
SELECT * FROM courses