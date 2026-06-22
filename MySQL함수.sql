/*
	문자열 함수, 수학 함수, 조건 함수, 형변환 함수, 집계 함수
*/
USE ai;
-- 문자열 함수
-- CONCAT()
-- 문자열을 이어 붙이는 함수
SELECT CONCAT('안녕하세요', 'MySQL');
SELECT CONCAT(address1, ' ', address2, ' ', address3) AS 주소 FROM member;

-- LEFT(), RIGHT()
-- 문자열의 왼쪽/오른쪽 일부를 가져옴
SELECT LEFT('ABCDEFGHIJ', 3);
SELECT RIGHT('ABCDEFGHIJ', 3);
SELECT userid, LEFT(userid, 3) AS '아이디 앞부분' FROM member;

-- SUBSTRING()
-- 문자열의 일부를 추출
SELECT SUBSTRING('ABCDEFGHIJ', 3, 4); -- 3번째 문자부터 4글자 추출
SELECT ssn1, SUBSTRING(ssn1, 1, 2) AS 츨생년도 FROM member;

-- CHAR_LENGTH(), LENGTH()
SELECT CHAR_LENGTH('가나다');
SELECT LENGTH('가나다'); -- 한글 3바이트


-- TRIM(), LTRIM(), RTRIM()
-- 공백 제거
SELECT TRIM('    MYSQL    ');

-- REPLACE()
-- 문자열 치환
SELECT REPLACE('010-1111-1111', '-', '');
SELECT hp, REPLACE(hp, '-','') AS 번호 FROM member;

-- LOWER(), UPPER()
-- 소문자, 대문자 변환
SELECT UPPER('mysql');
SELECT email, UPPER(email) AS '대문자' FROM member;


-- 수학 함수
-- ABS()
-- 절대값
SELECT ABS(-100);

-- ROUND()
-- 반올림
SELECT ROUND(3.141592, 2);

-- CEIL(), FLOOR()
-- 올림, 내림
SELECT CEIL(3.1);
SELECT FLOOR(3.9);

-- MOD()
-- 나머지
SELECT MOD(10, 3);

-- RAND()
-- 랜덤값 생성(0~1사이의 실수)
SELECT RAND();
SELECT * FROM member ORDER BY RAND() LIMIT 1;

-- TRUNCATE()
-- 버림
SELECT TRUNCATE(3.141592,2);


-- 날짜 힘스
-- NOW()
-- 현재 날짜 + 시간
SELECT NOW();

-- CURDATE(), CURTIME() 
SELECT CURDATE(); 
SELECT  CURTIME();

-- DATE_FORMAT()
-- 날짜 포멧 변경
SELECT DATE_FORMAT(NOW(), '%Y년 %m월 %d일 %H시 %i분 %s초');  -- 대소문자로 가져오는 게 조금 다름

-- DATEDIFF()
-- 날짜 차이 계산
SELECT DATEDIFF('2026-12-17', NOW());

-- ADDDATE()
-- 날짜 더하기
SELECT ADDDATE(NOW(), 30);

-- SUBDATE()
-- 날짜 뺴기
SELECT SUBDATE(NOW(), 7);

-- DAYOFWEEK()
-- 요일 숫자 반환
SELECT DATOFWEEK(NOW()); -- 1. 일요일, 2: 월요일 ...

-- MONTH(), YEAR(), DAY()
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW()); 

-- 조건 함수
-- IF()
-- 조건 처리
SELECT userid, IF(point >= 100, 'VIP', '일반') FROM member;


-- IFNULL()
-- NULL인지 확인, NULL 처리
SELECT IFNULL(regdate, '가입일 없음') FROM member;
SELECT * FROM member;


-- NULLIF()
-- 두 값이 같으면 NULL 반환
SELECT NULLIF(10, 10);

-- CASE WHEN
-- 여러 조건 처리
SELECT userid,
CASE
	WHEN point >= 200 THEN 'VIP'
    WHEN point >= 100 THEN 'GOLD'
    ELSE 'Normal'
END AS 등급 FROM member;


-- 형번환 함수
-- CAST()
-- 자료형 변경
SELECT CAST('2026-06-08' AS DATETIME);

-- CONVERT()
-- 형변환
SELECT CONVERT('-123', SIGNED);
SELECT CONVERT('-123', UNSIGNED);


-- 집계 함수
-- COUNT()
-- 행 개수
SELECT COUNT(8) FROM member;
SELECT COUNT(idx) FROM member;

-- AVG()
-- 평균
 SELECT AVG(point) FROM member;
 
 -- SUM()
 -- 합계
 SELECT SUM(point) from member;
 
 -- MAX(), MIN()
 -- 최댓값 / 최소값
 SELECT MAX(point) FROM member;
 SELECT MIN(point) FROM member;


-- 1. userid 앞 3글자만 출력하세요.
SELECT SUBSTRING('userid', 3, 4);


-- 2. 전화번호의 '-'를 제거하세요.

-- 3. 현재 날짜를 yyyy/mm/dd 형식으로 출력하세요.

-- 4. point 평균을 구하세요.

-- 5. point가 가장 높은 회원을 조회하세요.

-- 6. userid를 모두 대문자로 출력하세요.

-- 7. 회원 등급을 case when으로 나누세요.

-- 8. 랜덤 회원 1명을 조회하세요.

-- 9. 이메일 길이를 출력하세요.

-- 10. 가입일 기준 오늘까지 며칠 지났는지 출력하세요.