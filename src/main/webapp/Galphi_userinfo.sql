CREATE TABLE "JHB"."USERTABLE" 
   (	"USERNUM" NUMBER(*,0) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"NICK" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"PW" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "USERTABLE_PK" PRIMARY KEY ("USERNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;


  
DROP SEQUENCE usertable_idx_seq;
CREATE SEQUENCE usertable_idx_seq;
--중간 부터 idx 증가하기 => (select NVL(MAX(IDX), 0) + 1 from 테이블이름)  
select * from usertable order by usernum desc;
  
insert into usertable (usernum, USERNAME, NICK, EMAIL, PW) values (usertable_idx_seq.nextval, '홍길동', '홍길동', 'test1@.com', '1111');
insert into usertable (usernum, USERNAME, NICK, EMAIL, PW) values (usertable_idx_seq.nextval, '임꺽정', '아내', 'test2@.com', '2222');
insert into usertable (usernum, USERNAME, NICK, EMAIL, PW) values (usertable_idx_seq.nextval, '장길산', '신라면', 'test3@.com', '3333');

