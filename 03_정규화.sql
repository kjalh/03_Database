/*
	정규화(Normalization)
    - 데이터 베이스 테이블을 효율적으로 구조화하는 작업
    - 중복 데이터를 줄이고, 데이터가 꼬이지 않게 테이블을 나누는 과정
    - 데이터 무결성 유지, 유지보수 편리성 증가
    
    정규화 단계
    1. 제1정규형(1NF)
		- 하나의 칸에는 하나의 값만 들어가야 함
        예) MySQL, Python (X)
    2. 제2정규형(2NF)
		- 1NF 만족
        - 기본키 전체에 완전 종속 되어야 함
    3. 제3정규형(3NF)
		- 2NF 마족
        - 이행적 종속 제거
	* 이행적 종속
		학번 -> 학과번호
        학과번호 -> 학과명
        학번 -> 학과명: 간접 연결을 이행적 종속이라고 함
*/




-- student  -- 학생
CREATE TABLE student(
	student_id INT NOT NULL PRIMARY KEY,
    student_name VARCHAR(20)
);

-- professor  -- 교수
CREATE TABLE professor(
	professor_id INT PRIMARY KEY,
	professor_name VARCHAR(20),
    professor_phone VARCHAR(20)
);

-- course  -- 과목
CREATE TABLE course(
	course_id INT PRIMARY KEY,
	course_name VARCHAR(50),
	professor_id INT,
    FOREIGN KEY(professor_id) REFERENCES professor(professor_id)
);


DROP TABLE enroll;
-- enroll  -- 수강
CREATE TABLE enroll(
	student_id INT,
    course_id INT,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id),
    PRIMARY KEY(course_id)
);

DROP TABLE student, professor, course, enroll;

SELECT * FROM student;


SELECT * FROM member;

CREATE TABLE profile(
	idx INT NOT NULL,
    height DOUBLE,
    weight DOUBLE,
    mbti VARCHAR(10),
    FOREIGN KEY(idx) REFERENCES member(idx)
);


SELECT * FROM profile;

INSERT INTO profile values(1, 160, 50, 'ISTJ');
INSERT INTO profile values(3, 170, 70, 'ESTP');
INSERT INTO profile values(4, 175, 80, 'ENFJ');
-- INSERT INTO profile values(7, 160, 50, 'ISTJ'); 외래키 제약조건 위배

-- idx, userid, name, gender, mbti
SELECT  member.idx, userid, name, gender, mbti
FROM member 
INNER JOIN profile ON member.idx = profile.idx;

SELECT  m.idx, m.userid, m.name, m.gender, p.mbti
FROM member AS m 
INNER JOIN profile AS p ON m.idx = p.idx; -- member AS m이랑 member m 같음 그렇지만 as를 붙이는 게 좋음

SELECT  m.idx, m.userid, m.name, m.gender, p.mbti
FROM member AS m 
LEFT JOIN profile AS p ON m.idx = p.idx;

SELECT  m.idx, m.userid, m.name, m.gender, p.mbti
FROM member AS m 
RIGHT JOIN profile AS p ON m.idx = p.idx;

SELECT  userid, name, gender, mbti
FROM member 
CROSS JOIN profile;