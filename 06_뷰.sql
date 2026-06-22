/*
	뷰(VIEW)
    - SELECT 문을 저장해둔 가상의테이블
		CREATE VIEW 뷰이름 AS SELECT문
    - VIEW를 사용하는 이유
		1. 복잡한 SQL을 단순화
		2. 재사용( 자주 쓰는 조회 저장)
        3. 가독성(SQL을 보기 쉽게 구성)
        4. 보안(특정 컬럼만 공개)
        
	- 테이터를 직접 저장하지 않음(원본 테이블의 SELECT 결과를 보여주는 가상 테이블)
    - member 테이블 데이터를 변경 -> VIEW 결과도 같이 변경
    -
*/

USE ai;

CREATE VIEW vip_member AS SELECT userid, name, point from member WHERE point >= 100;
SELECT * FROM vip_member;
SELECT * FROM member;

-- VIEW는 SELECT처럼 사용 가능
SELECT * FROM vip_member WHERE point >= 150;

SELECT address1, address2, address3 FROM member;

-- 회원주소 VIEW(member_address) userid, name, address1 + address2 + address3 AS address
CREATE VIEW member_address AS 
SELECT userid, name, CONCAT(address1, ' ', address2, ' ', address3) AS address FROM member;

SELECT * FROM member_address;

DROP VIEW member_address;


-- VIEW 수정
CREATE OR REPLACE VIEW vip_member AS 
SELECT userid, name, point, email from member WHERE point >= 100;

SELECT * FROM vip_member;


-- VIEW 삭제
DROP VIEW member_address;

-- VIEW 구조 확인
SHOW CREATE VIEW vip_member;

-- VIEW 목록 확인
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

SELECT * FROM orders;


CREATE VIEW member_order AS
SELECT m.userid, m.name, o.product_name, o.price, o.order_date 
FROM member m
JOIN orders o ON m.idx = o.member_idx;


SELECT * FROM member_order;












