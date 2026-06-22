/*
	DML(Data Manipulation Language, 데이터 조작어)
    SELCT: 데이터 조회(검색)
    INSERT: 데이터를 테이블에 삽입
    UPDATE: 데이터 수정
    DELETE: 데이터를 삭제
*/

CREATE TABLE voca(
	eng VARCHAR(50) PRIMARY KEY,
    kor VARCHAR(50) NOT NULL,
    lev INT DEFAULT 1,
    regdate DATETIME DEFAULT NOW()
);

USE ai;

DESC voca;


INSERT INTO voca VALUES('apple', '사과', 1, NOW());

SELECT * FROM voca;
INSERT INTO voca (eng, kor) VALUES('banana', '바나나'); -- 기본 데이터 값이 들어감
INSERT INTO voca VALUES('orange', '오렌지', NULL, NULL); -- 진짜 널값이 들어감

-- Error Code: 1062. Duplicate entry 'orange' for key 'voca.PRIMARY'
INSERT INTO voca VALUES('orange', '오렌지', NULL, NULL);
INSERT INTO voca (eng, kor) VALUES('melon', '메론');
INSERT INTO voca (eng, kor, lev) VALUES('avocado', '아보카도', 2);


DELETE FROM voca;
DELETE FROM voca WHERE eng = 'banana';

SELECT * FROM voca;
SELECT eng FROM voca WHERE kor = '메론';


UPDATE voca SET lev = 1;
UPDATE voca SET lev = 2 WHERE eng = 'avocado';
SELECT * FROM voca;

DESC member;

ALTER TABLE member ADD gender VARCHAR(10) NOT NULL;
SELECT * FROM member;

-- 회원가입
INSERT INTO member VALUES(); -- 이거 사용 못함 이유는 idx가 자동 증가(auto_increment <-  mysql 특징으로 기본키 설정해야 함)하는 값을 가지기 때문     (추가로 기본키도 하나만 오라클은 기본키를 테이블에 여러 개 둬도 됨)
INSERT INTO member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) VALUES ('apple', '1111', '김사과', '010-1111-1111', 'apple@apple.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11', '여자');
INSERT INTO member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) VALUES ('banana', '2222', '반하나', '010-2222-2222', 'banana@banana.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11', '여자');
INSERT INTO member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) VALUES ('orange', '3333', '오렌지', '010-3333-3333', 'orange@orange.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11', '남자');
INSERT INTO member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) VALUES ('melon', '4444', '이메론', '010-4444-4444', 'melon@melon.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11', '남자');
INSERT INTO member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) VALUES ('cherry', '5555', '채리', '010-5555-5555', 'cherry@cherry.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11', '여자');


SELECT * FROM member;
UPDATE member SET gender = '남자' WHERE userid = 'orange';


DESC member;


UPDATE member SET point = 0 WHERE idx = 5;
UPDATE member SET point = point + 50; 
UPDATE member SET point = point + 100 WHERE idx = 2;

SELECT * FROM member;  -- (실무에서는 아스테리크 쓰지마라 이유는 서버에 과부하 줌)


SELECT 100;
SELECT 100 + 50;
SELECT 100 + 50 AS 덧셈;
SELECT 100 + 50 AS '뎃셈 연산';
SELECT ''; -- 빈 문자열(빈 문자가 들어가있음)
SELECT NULL; -- 진짜 비어있는 즉 데이터 없음
SELECT 100 + NULL; -- NULL과의 연산은 무조건 NULL



/*  SQL은 대소문자 상관없음

	산술 연산자: +, -, *, /, mod, div
    비교 연산자: =, <, >, <=, >=, <>
	대입 연산자: =
    논리 연산자: AND, OR, NOT, XOR 
	IS: 양쪽의 피연산자가 모두 같으면 TRUE, 아니면 FALSE
    BETWEEN A AND B: A보다는 크거나 같고, B 보다는 작거나 같으면 TRUE, 아니면 FALSE
    IN: 매개변수로 전달된 리스트에 값이 존재하면 TRUE 아니면 FALSE
    LIKE: 패턴으로 문자열을 검색하여 값이 존재하면 TURE 아니면 FALSE
*/

SELECT point FROM member;

-- 포인트가 150이상인 멤버의 아이디, 이름, 포인트를 검색
SELECT userid, name, point FROM member WHERE point >= 150;

-- 포인트가 150이상이고, 200이하인 멤버의 아이디, 이름, 포인트, 성별검색
SELECT userid, name, point, gender FROM member WHERE point >= 150 AND point<=200;
SELECT userid, name, point, gender FROM member WHERE point BETWEEN 150 AND 200;

-- 로그인
SELECT userid FROM member WHERE userid = 'apple' AND userpw = '1111'; -- 성공
SELECT userid FROM member WHERE userid = 'apple' AND userpw = '1112'; -- 실패

-- 이름이 김사과, 반하나, 오렌지인 사람의 모든 정보를 검색
SELECT * FROM member WHERE name = '김사과' OR name = '반하나' OR name = '오렌지';
SELECT * FROM member WHERE name IN ('김사과', '반하나', '오렌지');

INSERT INTO member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender, regdate) VALUES ('berry', '6666', '배애리', '010-6666-6666', 'berry@berry.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11', '여자', null);

-- regdate가 null인 멤버를 검색
-- SELECT * FROM member WHERE regdate = NULL; -- 이거 안됨
SELECT * FROM member WHERE regdate IS NULL;
SELECT * FROM member WHERE regdate IS NOT NULL;


-- 아이디가 a로 시작하는 멤버의 정보를 검색
SELECT * FROM member WHERE userid like 'a%';

-- 아이디가  a로 끝나는 멤버의 정보를 검색
SELECT * FROM member WHERE userid like '%a';

-- 아이디가 a를 포함하는 멤버의 점보를 검색
SELECT * FROM member WHERE userid like '%a%';


SELECT * FROM member ORDER BY idx DESC;


-- 이메일이 '.com'으로 끝나는 멤버의 정보를 검색
SELECT * FROM member WHERE email like '%.com';

-- 이름이 3자인 멤버를 검색
SELECT * FROM member WHERE name LIKE '___';

-- 이름이 첫 글자가 '김'씨인 멤버를 검색
SELECT * FROM member WHERE name LIKE '김___';


SELECT * FROM member ORDER BY idx;        -- 오름차순 ASC 생략
SELECT * FROM member ORDER BY idx DESC;   -- 내림차순 DESC

-- 멤버를 포인트 순으로 정렬
SELECT * FROM member ORDER BY point DESC;
-- 멤러를 포인트 순으로 정렬. 단 포인트가 같으면 가입 최신순으로 정렬
SELECT * FROM member ORDER BY point DESC, regdate DESC;

-- limit: 일부 로우(레코드 ()) 검색
-- limit 검색할 로우의 개수, limit 시작로우(인덱스) 가져올 로우의 개수
SELECT * FROM member LIMIT 2;
SELECT * FROM member LIMIT 2, 3; -- 2번부터 3개 가져와라 근데 2번이 아니라 2번 이후부터 3개인듯
-- 멤버가 포인트 순으로 내림차순 정렬하고 포인트가 같다면 가입순으로 내림차순 한 뒤 top 3를 검색
SELECT * FROM member ORDER BY point DESC, regdate DESC LIMIT 3;


/*
	group
    SELECT 그룹을 맺을 컬럼 또는 집계함수 FROM 테이블 GROUP BY 그룹을 맺을 컬럼
*/
SELECT gender, userid FROM member GROUP BY gender;
SELECT gender, count(idx) AS 인원수 FROM member GROUP BY gender;
SELECT gender, count(idx) AS 인원수 FROM member GROUP BY gender HAVING gender = '여자';
SELECT gender, count(idx) AS 인원수 FROM member WHERE gender = '여자' GROUP BY gender;

-- 성별로 그룹을 맺고 인원수가 3명이상인 성별을 검색
SELECT gender, COUNT(idx) AS 인원수 FROM member GROUP BY gender HAVING COUNT(idx) >= 3; -- 난 gender로 하고 강사는 idx
SELECT gender, COUNT(idx) AS 인원수 FROM member GROUP BY gender HAVING 인원수 >= 3;

/*
	멤버 중 포인트 50이상인 멤버중에서 성별로 그룹을 나눈 뒤,
	각 그룹의 포인트 평균을 구하고 평군의 포인트가 100이상인 성별을 출력
    (단, 성별이 남자, 여자 모두 출력된다면 포인트가 높은 성별을 우선으로 출력)
*/

SELECT gender, AVG(point) AS 평균 
FROM member 
WHERE point >= 50 
GROUP BY gender 
HAVING 평균 >= 100 
ORDER BY 평균 DESC; -- 포인트를 이미 평균으로 구했으니까 평균 가져다 쓴거네
