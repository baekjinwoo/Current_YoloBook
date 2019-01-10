SELECT table_name, constraint_name, constraint_type FROM   USER_CONSTRAINTS
SELECT constraint_name, status FROM ALL_CONSTRAINTS

-- yolo/ yolo

--관리자모드 접속 : conn /as sysdba
--계정생성 : create user 유저네임 identified by 패스워드;
--권한부여 : grant resource, connect to 유저네임

--관리자모드 접속 : sqlplus system/비밀번호
--사용자 삭제: drop user 유저네임 cascade; 

select member_seq from dual;
select * from program
select * from MEMBER
SELECT * FROM TAB;
select * from book;

ALTER TABLE member DROP CONSTRAINT member_id1_pk CASCADE;
alter table book add(payinfo varchar2(100));

alter table member modify(endtime varchar2(100));

DROP TABLE P_STATUS_NAME;
drop table MEMBER_STATUS;
drop table PROGRAM_STATUS;
DROP TABLE PROGRAM_CLASS;
drop table member
drop table program
DROP TABLE BOOK;


drop sequence mnumber_seq
drop sequence pnumber_seq
DROP sequence M_NUMBER_SEQ;
DROP sequence B_NUMBER_SEQ;
DROP sequence P_NUMBER_SEQ;

select * from PROGRAM_STATUS

delete MEMBER;
delete PROGRAM where pnumber>=1

--시퀀스 만들기
CREATE SEQUENCE M_NUMBER_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE;
CREATE SEQUENCE P_NUMBER_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE;
CREATE SEQUENCE B_NUMBER_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE;

--수업분류
CREATE TABLE PROGRAM_CLASS(
	P_CLASS NUMBER(11) CONSTRAINT PROGRAM_P_CLASS_CLASS_PK PRIMARY KEY NOT NULL,
	P_CLASS_NAME VARCHAR2(100) CONSTRAINT PROGRAM_CLASS_CLASSNAME_NN NOT NULL
);

INSERT INTO PROGRAM_CLASS VALUES(1, '떡 케이크');
INSERT INTO PROGRAM_CLASS VALUES(2, '프랑스지수');
INSERT INTO PROGRAM_CLASS VALUES(3, '가죽공예');
INSERT INTO PROGRAM_CLASS VALUES(4, '취미미술');


--회원상태 테이블: 0=관리자, 1=수강생, 2=미승인 강사, 3=승인된 강사
CREATE TABLE MEMBER_STATUS(
	M_STATUS NUMBER(11) CONSTRAINT MEMBER_STATUS_M_STATUS_PK PRIMARY KEY NOT NULL,
	M_STATUS_NAME VARCHAR2(30) CONSTRAINT M_STATUS_NAME_NN NOT NULL
);

INSERT INTO MEMBER_STATUS VALUES(0, '관리자');
INSERT INTO MEMBER_STATUS VALUES(1, '수강생');
INSERT INTO MEMBER_STATUS VALUES(2, '미승인 강사');
INSERT INTO MEMBER_STATUS VALUES(3, '승인 강사');


--프로그램상태 테이블: 0=메인화면 인기강좌6개, 2=미승인 강좌, 3=승인된 강의
CREATE TABLE PROGRAM_STATUS(
	P_STATUS NUMBER(11) CONSTRAINT P_STATUS_P_STATUS_PK PRIMARY KEY NOT NULL,
	P_STATUS_NAME VARCHAR2(30) CONSTRAINT P_STATUS_P_STATUS_NAME_NN NOT NULL
);

INSERT INTO PROGRAM_STATUS VALUES(0, '메인화면 인기강좌');
INSERT INTO PROGRAM_STATUS VALUES(2, '미승인 강좌');
INSERT INTO PROGRAM_STATUS VALUES(3, '승인 강좌');


--회원
CREATE TABLE MEMBER(
	M_NUMBER NUMBER(11) CONSTRAINT MEMBER_M_NUMBER_PK PRIMARY KEY NOT NULL,
	ID VARCHAR2(30) CONSTRAINT MEMBER_ID_NN NOT NULL,
	PW VARCHAR2(30) CONSTRAINT MEMBER_PW_NN NOT NULL,
	EMAIL VARCHAR2(100) CONSTRAINT MEMBER_EMAIL_CK CHECK(EMAIL LIKE '%@%') UNIQUE,
	PHONE VARCHAR2(100) CONSTRAINT MEMBER_PHONE_NN NOT NULL,
	M_NAME VARCHAR2(100) CONSTRAINT MEMBER_M_NAME_NN NOT NULL,
	M_STATUS NUMBER(11) CONSTRAINT MEMBER_M_STATUS_FK REFERENCES MEMBER_STATUS(M_STATUS) NOT NULL,
	CERTIFICATION_FILENAME VARCHAR2(200) CONSTRAINT MEMBER_CERTIRICATION_N NULL,
	M_INTRODUCTION VARCHAR2(4000) CONSTRAINT MEMBER_MINTRODUCTION_N NULL
);



--프로그램
CREATE TABLE PROGRAM(
	P_NUMBER NUMBER(11) CONSTRAINT PROGRAM_P_NUMBER_PK PRIMARY KEY NOT NULL,
	M_NUMBER NUMBER(11) CONSTRAINT PROGRAM_M_NUMBER_FK REFERENCES MEMBER(M_NUMBER) NOT NULL,
	P_NAME VARCHAR2(100) CONSTRAINT PROGRAM_P_NAME_NN NOT NULL,
	STARTTIME VARCHAR2(10) CONSTRAINT PROGRAM_STARTTIME_NN NOT NULL,
	ENDTIME VARCHAR2(10) CONSTRAINT PROGRAM_ENDTIME_NN NOT NULL,
	P_DATE DATE CONSTRAINT PROGRAM_P_DATE_NN NOT NULL,
	PRICE VARCHAR2(100) CONSTRAINT PROGRAM_PRICE_NN NOT NULL,
	LIMITOFSTUDENTS NUMBER(11) CONSTRAINT PROGRAM_LIMITOFSTUDENT_NN NOT NULL,
	P_INTRODUCTION VARCHAR2(4000) CONSTRAINT PROGRAM_P_INTRO_NN NOT NULL,
	P_THUMBNAIL_FILENAME VARCHAR2(200) CONSTRAINT P_THUMBNAIL_FILENAME_NN NOT NULL,
	P_CLASS NUMBER(11) CONSTRAINT PROGRAM_P_CLASS_NN REFERENCES PROGRAM_CLASS(P_CLASS) NOT NULL,
	P_STATUS NUMBER(11) CONSTRAINT PROGRAM_P_STATUS_FK REFERENCES PROGRAM_STATUS(P_STATUS) NOT NULL,
	P_SYLLABUS_FILENAME VARCHAR2(200) 
);

alter table program add(p_thumbnail_filename varchar2(200));

ALTER TABLE program DROP COLUMN p_thumbnail_filename;
alter table program RENAME COLUMN P_SYLLABUS_FILENAME TO p_thumbnail_filename;
alter table program add(P_SYLLABUS_FILENAME varchar2(200));


--예약 (payinfo 추가할 것)
CREATE TABLE BOOK(
	B_NUMBER NUMBER(11) CONSTRAINT BOOK_B_NUMBER_PK PRIMARY KEY NOT NULL,
	M_NUMBER NUMBER(11) CONSTRAINT BOOK_M_NUMBER_FK REFERENCES MEMBER(M_NUMBER),
	P_NUMBER NUMBER(11) CONSTRAINT BOOK_P_NUMBER_FK REFERENCES PROGRAM(P_NUMBER),
	PAYINFO VARCHAR2(100)
);



--멤버 데이터 삽입
INSERT INTO MEMBER
VALUES(M_NUMBER_SEQ.NEXTVAL, 'admin','admin','ADMIN@GAMIL.COM','010-0000-0000','관리자', 0, NULL, NULL);

INSERT INTO MEMBER 
VALUES(M_NUMBER_SEQ.NEXTVAL, 'ehddnr91','901','EHDDNR@GMAIL.COM','016-250-4347','김동욱', 2, '생활체육지도자3급',
'한신대학교 생활체육학과 졸업, 프로틴 홍보대사 ,헬스트레이너 경력 3년, 현직 보디빌더');

INSERT INTO MEMBER 
VALUES(M_NUMBER_SEQ.NEXTVAL, 'rudcjf91','901','rudcjf@GMAIL.COM','016-250-4348','최경철', 2, '제과제빵 자격증',
'한국제과학교 졸업, 신라호텔 파티쉐 경력 1년');

INSERT INTO MEMBER 
VALUES(M_NUMBER_SEQ.NEXTVAL, 'wlsdn91','901','wlsdn@GMAIL.COM', '016-250-4349', '백진우', 2, '없음',
'계원예술대학교 디지털미디어디자인과 졸업, 국가전시 4회, 프리랜서, 캐리커처와 소묘위주 강사 경력 2년');

INSERT INTO MEMBER 
VALUES(M_NUMBER_SEQ.NEXTVAL, 'dongwook', '1234', 'dongwook@GMAIL.COM','016-250-4350','kimdongwook', 1, NULL, NULL);

--프로그램 데이터 삽입: 케이크 
INSERT INTO PROGRAM
VALUES(P_NUMBER_SEQ.NEXTVAL, 2, '원데이클래스 미니떡케이크', '09:00', '15:00', '20180606', '50000', 10, '손으로 하나하나 꽃을 만들어 장식한 케이크는 눈을 즐겁게 해줄 뿐 아니라 만든 이의 정성이 느껴져 행복한 기분을 절로 느끼게 합니다.
백설기와 각종 떡 위에 지나치게 달지 않으면서도 부드러운 식감의 앙금을 올린 앙금플라워 수제 떡케이크 앙금의 달콤함과 설기 떡의 쫄깃함이 어우러져 그 맛 또한 보는 것만큼 감동적인 다양한 맛의 떡 케이크를 만들어 보세요~~^^', 'cake1-1.png', 1, 3, NULL);

INSERT INTO PROGRAM
VALUES(P_NUMBER_SEQ.NEXTVAL, 2, '컵 떡케이크 만들기과정', '09:00', '15:00', '20180611', '45000', 9, '꽃보다 예쁜 플라워 떡케이크!! 나 혼자서도 뚝딱~ 예쁘고 앙증맞은 플라워 컵 떡케이크 3종세트를 를 완성해 봅니다.
손재주가 없어도, 혼자서 쉽게 완성할수 있는 플라워떡케이크, 떡케이크의 기본이 되는 설기떡 찌는 방법부터 떡케이크 위를 꽃으로 멋스럽게 장식하는 것까지, 플라워 컵떡케이크를 만드는 방법을 배워 봅니다.직접 만든 정성 가득한 컵 떡케이크로 소중한 이에게 감사와 사랑을 전하고, 특별한 날을 더욱 특별하게 만들어 보세요~', 'cake1-2.png', 1, 3, NULL);

INSERT INTO PROGRAM
VALUES(P_NUMBER_SEQ.NEXTVAL, 2, '플라워리스 떡케이크과정', '09:00', '15:00', '20180612', '45000', 9, '파티 음식으로 꽃으로 장식된 아름다운 떡케이크를 준비하고 싶으신 분들. 감각적이고 예쁜 앙금 플라워 떡케이크를 내손으로 직접 만들어 성취감을 느끼고 싶으신 분들.
정성과 사랑이 가득한 특별한 선물 떡케이크를 선물 하고 싶으신 분들 관심과 재미만 있으면 누구나 따라할 수 있도록 지도하며 빠르고 쉽게 터득 할 수 있도록 합니다.  나만의 정성이 듬뿍 들어간  ‘플라워리스 떡케이크’ 클래스에 도전해 보세요~!! ', 'cake1-3.png', 1, 3, NULL);

INSERT INTO PROGRAM
VALUES(P_NUMBER_SEQ.NEXTVAL, 2, '카네이션 감사 떡케이크', '09:00', '15:00', '20180521', '50000', 10, '정성을 담아 부모님께 아름답고 건강한 떡케이크를 선물하고 싶으신분들.카네이션 감사 떡케이크로 감동을 선물하고 싶으신 분들.
관심과 재미만 있으면 누구나 따라할 수 있도록 지도하며 빠르고 쉽게 터득 할 수 있도록 합니다.  나만의 정성이 듬뿍 들어간  ‘카네이션 감사떡케이크’ 클래스에 도전해 보세요~!! ', 'cake1-4.png', 1, 3, NULL);

INSERT INTO PROGRAM
VALUES(P_NUMBER_SEQ.NEXTVAL, 2, '꽃다발 떡케이크 과정', '09:00', '15:00', '20180510', '50000', 10, '꽃다발 부케 떡케이크를 소중한 분에게 선물하고 싶으신 분들.건강과 정성 깃든 아름다운 케이크를 가족에게 먹이고 싶으신 분들.
 중요한 파티에 꽃다발 부케가 필요하신 분들. 관심과 재미만 있으면 누구나 따라할 수 있도록 지도하며 빠르고 쉽게 터득 할 수 있도록 합니다.  나만의 정성이 듬뿍 들어간  ‘꽃다발 부케 떡케이크’ 클래스에 도전해 보세요~!! ', 'cake1-5.png', 1, 3, NULL);

INSERT INTO PROGRAM
VALUES(P_NUMBER_SEQ.NEXTVAL, 2, '앙금플라워 정규과정', '09:00', '15:00', '20180508', '50000', 10, '정성과 사랑이 가득한 특별한 선물 떡케이크를 선물 하고 싶으신 분들.세상에 하나뿐인 200% 정성 가득한 건강한 떡을 가족에게 먹이고 싶으신 분들. 파티 음식으로 꽃으로 장식된 아름다운 떡케이크를 준비하고 싶으신 분들.
감각적이고 예쁜 앙금 플라워 떡케이크를 내손으로 직접 만들어 성취감을 느끼고 싶으신 분들.관심과 재미만 있으면 누구나 따라할 수 있도록 지도하며 기초와 고급과정을  빠르고 쉽게 터득 할 수 있도록 합니다. 나만의 정성이 듬뿍 들어간  ‘앙금 플라워 떡케이크’에 도전해 보세요~!!', 'cake1-6.png', 1, 3, NULL);



--프로그램 데이터 삽입: 자수
INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '펫자수', '09:00', '15:00', '20180406', '50000', 10, '사랑스럽고 귀여운 우리들의 애완견을 예쁘게 수를 놓아 봅니다.
자수 재료와 도구 준비부터 자수 도안 보는법, 도안옮기는법, 평범하면서도 특별하게 수놓는 다양한 응용 스티치를 배우면서 누구든지 쉽게 자수를 시작할 수 있도록 합니다.', 'jasu2-1.JPG', 2, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '콜라주 자수', '09:00', '15:00', '20180411', '45000', 9, '알록달록 다양한 패턴의 원단과 약간의 바느질로 탄생한 콜라주 자수~ 활용도가 가장 높은 소품에 콜라주 자수로 포인트를 주면 금세 세상에 하나뿐인 나만의 소품으로 바뀝니다.
에코백, 다이어리, 컵받침, 핸드폰 케이스도 콜라주 자수가 있으면 특별해집니다. 프랑스자수에서 활용도가 가장 높은 소품에 수를 놓아 일상에 그 색채를 더해봅니다', 'jasu2-2.JPG', 2, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '미니파우치 자수', '09:00', '15:00', '20180412', '45000', 9, '하늘거리는 꽃, 봄꽃이 가득한 들판, 노래하는 새들, 싱그러운 과일 등 미니파우치에 아름다운 감성을 더해 봅니다. 평범했던 미니케이스도 자수가 있으면 특별해집니다. 
지금 당장 수놓고 싶은 사랑스러운 작품을  한 땀 한 땀 수를 놓고 소품을 만들며 따뜻한 시간을 만들어 보길 바랍니다.', 'jasu2-3.JPG', 2, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 4, '꽃자수 수틀액자', '09:00', '15:00', '20180421', '50000', 10, '단순하고 평범한 꽃, 동물, 나무 등을 수놓는 것이 아닌 내가 상상하는 동화같은 일러스트 스토리를 자수에 담아봅니다.
봄꽃이 만발한 소녀와 나들이,  햇살을 즐기는 동물친구들, 동화속 주인공 일러스트 등 지금 당장 수놓고 싶은 사랑스러운 작품을 상상력과 감성을 자극시켜 개성있는 작품을 만들어 봅니다.', 'jasu2-4.JPG', 2, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '꽃자수 쿠션', '09:00', '15:00', '20180410', '50000', 10, '자수를 처음 시작하는 사람도, 자수를 즐기는 사람도, 자수를 무척 사랑하는 사람도  ‘꽃’이란 소재를 아주 좋아합니다.
꽃은 화려한 분위기를 풍기며 특유의 여유로움을 품고 있습니다. 꽃을 수놓은 쿠션 자수는 온전한 휴식을 얻게 합니다. 안락한 즐거움을 주는 쿠션에 직접 수를 놓아 일상에 특별함을 더해봅니다.', 'jasu2-5.JPG', 2, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '일러스트 자수', '09:00', '15:00', '20180408', '50000', 10, '손으로 끄적이던 아름답고 사랑스러운 동화같은 그림을 실로 따스하게 옮겨 수를 놓아봅니다.
꽃과 아름다운 소녀의 만남, 개구쟁이 귀여운 고양이들, 동화속 어린왕자 등 지금 당장 수놓고 싶은 사랑스러운 작품을 상상력과 감성을 자극시켜 다양한 소품을 만들어 봅니다.', 'jasu2-6.JPG', 2, 3, NULL);


--프로그램 데이터 삽입: 가죽
INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 4, '핸드메이드 가죽소품', '09:00', '15:00', '20180306', '50000', 10, '가죽공예를 접해보고 싶지만 막연한 분들, 시작이 두려우신 분들, 손재주가 있을까? 하는 생각에 고민되는 분들을 위한 가죽공예 소품만들기 부터 시작해 보는것은 어떨까요?
다양한 기법으로 만들어 연습하기에 알맞은 카드지갑, 멋진 디자인에 실용성을 겸비한 펜 케이스, 스트랩 핸드폰 케이스 등  모든 작품은 누구나 쉽게 따라 할 수 있는 단순한 기법으로 만들어 보며, 가죽공예의 기본 기법은 물론이고 다양한 개성있는 나만의 소품까지 배워봅니다.', 'leather3-1.JPG', 3, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 4, '가죽공예 정규과정', '09:00', '15:00', '20180311', '45000', 9, '매력적인 소재인 가죽으로 만드는 실용적인 생활 소품을 만들고 싶으신 분. 가죽으로  나만의 디자인, 나만의 개성이 담긴 새로운 작품을 만들고 싶으신 분. 
가죽공예를 처음 시작하는 초보자지만 아기자기하고 귀여운 잡화들을 손쉽게 만들고 싶으신 분. 독특한고 개성있는 가죽공예소품을 선물하고 싶으신 분', 'leather3-2.JPG', 3, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 2, '핸드메이드 가죽지갑', '09:00', '15:00', '20180312', '45000', 9, '내가 디자인 한 나만의 핸드메이드 가죽지갑을 가져보는 것은 어떨까요? 
가죽에서만 느낄 수 있는 독특한 매력 때문에 누구나 하나쯤 소장하고 싶은 아이템 중에 하나이면서, 간단한 제작 과정을 통해 만든 가죽지갑은 어디에나 어울리는 고급 소품이 됩니다. 
언뜻 보면 어려워 보이지만 부드러운 가죽을 사용해 초보자도 쉽게 완성할 수 있도록 실생활에서 사용 가능한 핸드메이드 지갑을 만들 수 있도록 도와드립니다.', 'leather3-3.JPG', 3, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 2, '여자 가죽가방과정', '09:00', '15:00', '20180321', '50000', 10, '심플하면서 고급스러운 디자인과 실용적이고 튼튼한 내구성을 가진 핸드메이드 가죽가방을 배워봅니다.','leather3-4.JPG', 3, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '남자 가죽가방과정', '09:00', '15:00', '20180310', '50000', 10, '다양한 디자인과 실용적인 기능을 가진 손바느질로 만드는 핸드메이드 가죽 가방 특유의 멋과 세상에 하나밖에 없는 나만의 가죽 가방 만들기를 배워봅니다. 
간편하게 들고 나갈 수 있는 작은 가죽가방부터, 2~3박 일정의 여행이나 출장에서 사용할 수 있는 여행용 가방, 서류나 노트북을 들고 미팅할 때 들면 좋은 비즈니스용 가방 외에도 여러 가지 실용적인 디자인을 배워봅니다.', 'leather3-5.JPG', 3, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 4, '가죽 다이어리과정', '09:00', '15:00', '20180308', '50000', 10, '누구나 하나쯤 가지고 있는 다이어리는 모양이 비슷하고, 색깔과 크기도 비슷한 종류의 다이어리를 가지고 다니는 것을 볼 수 있는데요.
비슷 비슷한 다이어리에 나만의 개성 있는 핸드메이드 가죽 다이어리를 만들어 가지고 다닌다면 정말 의미 있는 일일 것 같습니다. 실생활에서 중요한 내용을 적는 나만의 다이어리를 나의 개성을 표현하는 하나의 수단으로 옷을 입혀주는 것은 어떨까요?', 'leather3-6.JPG', 3, 3, NULL);

--프로그램 데이터 삽입: 수채화
INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 2, '감성꽃 수채화', '09:00', '15:00', '20180206', '50000', 10, '1주  물과 물감으로 표현하는 감성 수채화와 만나다, 
2주  우리 주변 가까이에서 볼 수 있는 꽃과 함께 수채화 기초와 재료다루기 ,3주  다양한 기법 활용과 자유로운 영감으로 나만의 수채화 꽃 그리기  , 4주  꽃 그림 수채화와 함께하는 생활 속의 활용방법', 'art4-1.png', 4, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '색연필 일러스트', '09:00', '15:00', '20180211', '45000', 9, '1주  색연필의 활용법과 만남, 2주  사랑스럽고 따뜻한 느낌의 색연필 일러스트 그리기 ,
3주  다양한 기법 활용과 자유로운 영감으로 나만의 색연필 일러스트 그리기 , 4주  색연필 일러스트로 엽서 초대장 카드 활용하기 ', 'art4-2.png', 4, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 4, '펜드로잉 수채화', '09:00', '15:00', '20180212', '45000', 9, '01. 구도와 거리감/ 투시법 알기, 02. 펜을 이용하여 자유로운 스케치와 수채화 채색방법 배우기
, 03. 펜으로 이용한 다양한 작품접하기, 04. 나만의 펜드로잉 완성하기', 'art4-3.png', 4, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 2, '너무 쉬운 인물 초상화', '09:00', '15:00', '20180221', '50000', 10, '1주  기초부터 튼튼히 (기초스케치), 2주  보는 각도에 따른 투시와 얼굴 골격구조 이해 ,
3주  인물 초상화 실전그리기, 4주  도구의 활용을 이용한 표현법과 수준높은 완성도', 'art4-4.png', 4, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 4, '팝아트 초상화', '09:00', '15:00', '20180210', '50000', 10, '1주  재료에 대한 이해와 표현방법, 2주  스케치하는 방법과 채색 순서, 
3주  좋은 그림을 만드는 표현기술, 4주  사진을 이용하여 작품 완성하기', 'art4-5.png', 4, 3, NULL);

INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '취미아트공예', '09:00', '15:00', '20180208', '50000', 10, '01. 기본기 연습, 02. 꽃 그리기(엽서크기 디자인), 03. 꽃잎그리기, 
04. 열매그리기, 05~09. 꽃그리기, 10. 실제 식물그리기_나뭇잎 그리기, 11~12. 나뭇잎 그리기', 'art4-6.png', 4, 3, NULL);

-- 프로그렘 데이터 삽입: 미승인된거
INSERT INTO PROGRAM
VALUES(p_number_seq.nextval, 3, '보노보노 이제 그마안~', '09:00', '15:00', '20180208', '50000', 10, '테스트', '보노만들기(프로그램).JPG', 4, 2, NULL);

update program
set P_THUMBNAIL_FILENAME = '보노만들기(프로그램).JPG'
where  P_THUMBNAIL_FILENAME = 'art4-6.png';

delete PROGRAM where P_number=25;
