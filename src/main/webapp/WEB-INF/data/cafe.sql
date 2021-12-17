DROP TABLE OrderRecord;
DROP TABLE SalesRecord;
DROP TABLE Employee;
DROP TABLE Customer;
DROP TABLE Menu;


CREATE TABLE Employee (
   id				BIGINT         		PRIMARY KEY GENERATED ALWAYS AS IDENTITY,		 
   eId				VARCHAR(30)			NOT NULL,										-- 직원아이디
   passwd			VARCHAR(30)			NOT NULL,										-- 직원 비번
   position			CHAR(1)				NOT NULL	DEFAULT 'E',						-- 직원 직책 ( Employee / Manager )
   regDate			TIMESTAMP			NOT NULL   	DEFAULT CURRENT_TIMESTAMP,			-- 등록날짜(읽기 전용)
   
   CONSTRAINT   	Employee_eId_UK  	UNIQUE(eId)										-- 고객 아이디는 중복 없이
);
 
CREATE TABLE Customer (
   id				BIGINT         		PRIMARY KEY GENERATED ALWAYS AS IDENTITY,		 
   name				VARCHAR(30)			NOT NULL,										-- 고객이름
   phone			VARCHAR(13)			NOT NULL,										-- 고객 폰번호
   birth			VARCHAR(8)			NOT NULL,										-- 고객 생년월일( 19900102 )
   point			DOUBLE				NOT NULL	DEFAULT 0,
   regDate			TIMESTAMP			NOT NULL   	DEFAULT CURRENT_TIMESTAMP			-- 등록날짜(읽기 전용)
);

CREATE TABLE Menu (
   id         		BIGINT         		PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   menuType   		CHAR(1)        		NOT NULL,										-- 메뉴타입 ( Beverage / Coffee / Food )
   menuName   		VARCHAR(30)     	NOT NULL,										-- 메뉴이름
   menuPrice   		DOUBLE         		NOT NULL,										-- 메뉴가격
   stock      		BOOLEAN         	NOT NULL   DEFAULT true,						-- 재고유무 ( true : 재고있음 )
   regDate			TIMESTAMP			NOT NULL   	DEFAULT CURRENT_TIMESTAMP,			-- 등록날짜(읽기 전용)
   
   CONSTRAINT		Menu_menuName_UK	UNIQUE(menuName)
);

ALTER TABLE Menu ADD imgPath VARCHAR(200) NOT NULL DEFAULT '';							-- 메뉴이미지 경로

CREATE TABLE SalesRecord (
   id         		BIGINT         		PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   customerId   	BIGINT        		NOT NULL,										-- 고객아이디
   orderNumber  	VARCHAR(30)     	NOT NULL,										-- 주문번호
   amount      		DOUBLE         		NOT NULL,										-- 결제금액
   usePoint 		DOUBLE				NOT NULL,										-- 사용한 포인트
   place			CHAR(1)				NOT NULL   	DEFAULT 'I',						-- 매장 or 포장
   regDate			TIMESTAMP			NOT NULL   	DEFAULT CURRENT_TIMESTAMP,			-- 등록날짜(읽기 전용)
   
   CONSTRAINT		SalesRecord_customerId_FK 	FOREIGN KEY(customerId) REFERENCES Customer(id)
);

CREATE TABLE OrderRecord (
   id         		BIGINT         		PRIMARY KEY GENERATED ALWAYS AS IDENTITY,		-- 주문번호
   menuId  			BIGINT     			NOT NULL,										-- 메뉴아이디
   quantity      	INT         		NOT NULL,										-- 주문수량 
   regDate 			TIMESTAMP			NOT NULL   	DEFAULT CURRENT_TIMESTAMP,			-- 결제날짜 
   CONSTRAINT		Menu_menuId_FK 	FOREIGN KEY(menuId) REFERENCES Menu(id)
);

-- 비회원등록
INSERT INTO Customer(name,phone,birth,point) VALUES('비회원','','',0);


-- 관리자등록
INSERT INTO Employee(eId,passwd,position) VALUES('manager','manager','M');

-- 메뉴등록
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','핫윈터블로썸',1000.0,true,'/cafe/resources/img/beverage/hot/핫윈터블로썸.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','핫크리스마스라떼',1000.0,true,'/cafe/resources/img/beverage/hot/핫크리스마스_라떼.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','핫크리스마스초코',1000.0,true,'/cafe/resources/img/beverage/hot/핫크리스마스_초코.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','핫프루티하동',1000.0,true,'/cafe/resources/img/beverage/hot/핫프루티하동.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','아이스스트로베리그라니따',1800.0,true,'/cafe/resources/img/beverage/ice/아이스스트로베리그라니따.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','아이스시트러스',1800.0,true,'/cafe/resources/img/beverage/ice/아이스시트러스.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','아이스유채꿀애플스파클링',1800.0,true,'/cafe/resources/img/beverage/ice/아이스유채꿀애플스파클링.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','아이스청포도콤부차',2500.0,true,'/cafe/resources/img/beverage/ice/아이스청포도콤부차.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','아이스코코넛커피그라니따',2500.0,true,'/cafe/resources/img/beverage/ice/아이스코코넛커피그라니따.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','아이스키위주스',2500.0,true,'/cafe/resources/img/beverage/ice/아이스키위주스.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('B','아이스흑당펄밀크티',2500.0,true,'/cafe/resources/img/beverage/ice/아이스흑당펄밀크티.jpg','2021-10-01 12:00:00');


INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','핫아포가토',1000.0,true,'/cafe/resources/img/coffee/hot/핫아포가토.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','핫에스프레소',1000.0,true,'/cafe/resources/img/coffee/hot/핫에스프레소.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','핫카라멜라떼마끼아또',1500.0,true,'/cafe/resources/img/coffee/hot/핫카라멜라떼마끼아또.png','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','핫카페라떼',1500.0,true,'/cafe/resources/img/coffee/hot/핫카페라떼.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','핫카페모카',1500.0,true,'/cafe/resources/img/coffee/hot/핫카페모카.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','아이스아인슈패너',2300.0,true,'/cafe/resources/img/coffee/ice/아이스아인슈패너.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','아이스연유콜드브루플로트',2300.0,true,'/cafe/resources/img/coffee/ice/아이스연유콜드브루플로트.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','아이스카라멜라떼마끼아또',2300.0,true,'/cafe/resources/img/coffee/ice/아이스카라멜라떼마끼아또.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','아이스카페라떼',3000.0,true,'/cafe/resources/img/coffee/ice/아이스카페라떼.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('C','아이스카페모카',3000.0,true,'/cafe/resources/img/coffee/ice/아이스카페모카.jpg','2021-10-01 12:00:00');

INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('F','BLT샌드위치',45000.0,true,'/cafe/resources/img/food/BLT샌드위치.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('F','다크타르트',3000.0,true,'/cafe/resources/img/food/다크타르트.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('F','딸기크레이프',6500.0,true,'/cafe/resources/img/food/딸기크레이프.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('F','에그타르트',3000.0,true,'/cafe/resources/img/food/에그타르트.jpg','2021-10-01 12:00:00');
INSERT INTO Menu(menuType,menuName,menuPrice,stock,imgPath,regDate) VALUES('F','햄&치즈크라상',3500.0,true,'/cafe/resources/img/food/햄&치즈크라상.jpg','2021-10-01 12:00:00');

-- saleRecord 추가
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '110', 1000, 500,'2021-03-01 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '111', 10000, 300,'2021-04-05 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '112', 13000, 700,'2021-04-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '113', 12300, 600,'2021-06-30 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '114', 1540, 154,'2021-06-12 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '705', 1000, 10,'2021-08-29 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '706', 130000, 13000,'2021-01-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '707', 9800, 980,'2021-09-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '708', 1500, 330,'2021-10-05 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '709', 17200, 1720,'2021-10-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '700', 9100, 910,'2021-12-07 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '712', 13000, 1300,'2021-12-09 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '713', 5100, 510,'2021-12-01 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7024', 5600, 560,'2021-12-03 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7004', 10000, 1000,'2021-12-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '1105', 1000, 500,'2021-03-01 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '1116', 10000, 300,'2021-04-13 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '1127', 13000, 700,'2021-05-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '1138', 12300, 600,'2021-06-30 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '1149', 1540, 154,'2021-12-12 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7000', 1000, 10,'2021-12-10 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '70011', 130000, 13000,'2021-01-08 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '70012', 9800, 980,'2021-02-17 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '70013', 1500, 330,'2021-12-07 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '70014', 17200, 1720,'2021-12-09 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '70015', 9100, 910,'2021-12-05 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '70016', 13000, 1300,'2021-12-17 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '700111', 5100, 510,'2021-11-09 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7001111', 5600, 560,'2021-12-02 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '1200', 1000, 500,'2021-12-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '1010', 1000, 500,'2021-12-05 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7020', 1000, 500,'2021-12-09 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7030', 1000, 500,'2021-12-04 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7040', 1000, 500,'2021-12-05 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7010', 1000, 500,'2021-12-14 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7050', 1000, 500,'2021-11-14 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7060', 1000, 500,'2021-12-14 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7070', 1000, 500,'2021-12-06 00:02:11');
insert into SalesRecord(customerId,orderNumber, amount, usePoint, regDate) values(1, '7080', 1000, 500,'2021-12-14 00:02:11');

-- orderRecord 추가


insert into OrderRecord(menuId, quantity, regDate) values(1,1, '2021-11-03 00:02:10');
insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-11-03 00:02:11');

insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-12-05 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-12-05 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-12-05 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-12-05 00:02:11');

insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-11-30 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-11-30 00:02:11');

insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-12-01 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-12-01 00:02:11');

insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-10-12 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,2, '2021-10-13 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(1,2, '2021-10-17 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(1,2, '2021-10-28 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(3,1, '2021-10-28 00:02:11');

insert into OrderRecord(menuId, quantity, regDate) values(1,1, '2021-09-01 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(3,1, '2021-09-03 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(5,1, '2021-09-09 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(1,1, '2021-09-09 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(1,1, '2021-09-09 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,1, '2021-09-11 00:02:11');
insert into OrderRecord(menuId, quantity, regDate) values(2,1, '2021-09-11 00:02:11');


-- 각 table 보기
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Menu;
SELECT * FROM SalesRecord;
SELECT * FROM OrderRecord;
SELECT menuID, SUM(quantity) as quantity FROM OrderRecord WHERE Date(regDate) Between '2021-12-15 00:00:00' AND '2021-12-15 23:59:59' GROUP BY menuId;

-- 테이블 전체 삭제
DELETE FROM OrderRecord;
DELETE FROM SalesRecord;
DELETE FROM Employee;
DELETE FROM Customer;
DELETE FROM Menu;
