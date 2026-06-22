/*
	 DDL(Data Definition Language, 데이터 정의어)
     CREATE: 데이터베이스, 테이블, 뷰 등을 생성
     ALTER: 기존 객체(테이블, 뷰 등)의 구조를 변경
     DROP: 객체(데이터베이스, 테이블, 뷰, 인덱스 등)를 완전히 삭제
     TRUNCATE: 테이블의 모든 테이터를 삭제하지만, 구조는 남김(롤백 불가)

*/


-- 데이터 베이스 확인하기
show databases;

-- 데이버베이스 생성하기
CREATE database ai;

/*
	테이블
    - 데이터를 행과 열로 스키마에 따라 저장할 수 있는 구조
    
    CREATE TABLE 테이블명(
    칼럼명1 데이터타입 제약조건, 
    칼럼명2 데이터타입 제약조건,
    칼럼명3 데이터타입 제약조건,
    ...  
    );
    
    데이터 타입
    - 정수형: int, bigint(21억이 넘어간다하면 써라)
    - 실수형: float(소수점 6자리), double(6자리 넘으면), decimal (고정 소수점, 내가 결정)
    - 문자형: char, varchar(최대 65535byte), text, binary(영상, 이미지 등 글자 이외의 것), varbinary(varchar랑 같음)
	- 날짜형: date, time, datetime, timestamp
    
    제약 조건
    - 데이터의 무결성을 지키기 위해 데이터를 입력 받을 때 실행되는 검사 규칙
    - not null: null 값을 허용하지 않음
	- unique: 중복값을 허용하지 않음. 단 null 값은 허용
    - default: null 값을 삽입할 때 기본이 되는 값을 설정
    - primary key
		1. null 값을 허용하지 않음
        2. 중복값을 허용하지 않음
        3. 인덱싱 설정
        4. 기본키로 설정될 수 있고 참조(외래)키와 쌍으로 연결
	- foreign key : 기본키와 쌍으로 연결
    - auto_increment: 데이터를 직접 삽입하지 못함. 자동 증가되는 숫자 삽입(번호표)
    
    스키마
    - 데이터베이스의 구조와 제약조건에 관한 명세를 기술한 집합
	
*/

-- 데이터베이스 선택하기
USE ai;

-- 테이블 만들기
CREATE TABLE member(
	idx int auto_increment PRIMARY KEY,
    userid VARCHAR(20) UNIQUE NOT NULL,
    userpw VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    hp VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    ssn1 CHAR(6) NOT NULL,
    ssn2 CHAR(7) NOT NULL,
    zipcode VARCHAR(5), -- 우편번호
    address1 VARCHAR(100), 
    address2 VARCHAR(100), 
    address3 VARCHAR(100),
    regdate DATETIME DEFAULT NOW(),
    point INT DEFAULT 1000
);

-- 테이블 확인하기
DESC member;

-- 테이블 삭제하기
DROP TABLE member;

-- 컬럼 삭제하기
ALTER TABLE member DROP point;

-- 컬럼 추가하기
ALTER TABLE member ADD point INT DEFAULT 1000;

-- 컬럼 수정하기
ALTER TABLE member MODIFY COLUMN point INT DEFAULT 100; 







