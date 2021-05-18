���� �Խ��� ���̺�
CREATE TABLE QnABoard(
NO NUMBER PRIMARY KEY,
id varchar2(40) NOT NULL,
title varchar2(100) NOT NULL,
board varchar2(2000) NOT NULL,
Ref number(20) NOT NULL,
step number(20) NOT NULL,
AnswerNum number(20) NOT NULL,
ParontNum number(20) NOT NULL,
r_date DATE NOT NULL,
qna_delete varchar2(10) NOT NULL
);

����Ű ���� ��
ALTER TABLE qnaboard ADD FOREIGN KEY(id) REFERENCES REGISTER_USER(userid);

------------------------------------------------------------------------------------
�������̺�
CREATE TABLE RESERVATION(
RNO NUMBER PRIMARY KEY,
RUSERID VARCHAR2(40) NOT NULL,
RUSERNAME VARCHAR2(20) NOT NULL,
RUSERPHONE VARCHAR2(20) NOT NULL,
RUSERCOUNT NUMBER(10) NOT NULL,
CHECKIN DATE NOT NULL,
CHECKOUT DATE NOT NULL,
ROOMTYPE VARCHAR2(20) NOT NULL,
RUSERPRICE NUMBER(20) NOT NULL,
ROOMGRADE NUMBER(10) NOT NULL);

������ ����
CREATE SEQUENCE RESERVATION_SEQ START WITH 1;
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.NEXTVAL, 'choco1234', '�Ѵ���', '010-4033-5958', 2, '2021-05-28', '2021-05-29', '���Ĵٵ�', 100000, 1);
commit;
����Ű ���Ṯ
ALTER TABLE RESERVATION ADD FOREIGN KEY(RUSERID) REFERENCES REGISTER_USER(userid);

ROOMGRADE�� ���� ī��Ʈ�� 0�϶� ���డ��, 1�̻��϶� ����Ұ��� 
SELECT count(*) FROM RESERVATION WHERE checkin <= '2021-05-07' AND checkout >= '2021-04-30' AND ROOMGRADE = '2';

-----------------------------------------------------------------------------------------------
������ȸ(üũ���� ������¥ ����)
SELECT RNO, RUSERID, RUSERNAME, RUSERPHONE, RUSERCOUNT, CHECKIN, CHECKOUT, ROOMTYPE, RUSERPRICE 
FROM RESERVATION 
WHERE RUSERID = 'choco1234' AND CHECKIN > to_char(sysdate - 1, 'yyyy-mm-dd') ORDER BY RNO DESC;

SELECT RNO, RUSERID, RUSERNAME, RUSERPHONE, RUSERCOUNT, CHECKIN, CHECKOUT, ROOMTYPE, RUSERPRICE 
FROM RESERVATION ORDER BY RNO DESC;
��
�����ڱⰣ��ȸ
SELECT RNO, RUSERID, RUSERNAME, RUSERPHONE, RUSERCOUNT, CHECKIN, CHECKOUT, ROOMTYPE, RUSERPRICE 
FROM RESERVATION 
WHERE CHECKIN > to_char(sysdate - 1, 'yyyy-mm-dd') 
AND '2021-05-06' <= CHECKIN 
AND '2021-05-24' >= CHECKOUT
ORDER BY RNO DESC;
�Ⱓ��ȸ
SELECT RNO, RUSERID, RUSERNAME, RUSERPHONE, RUSERCOUNT, CHECKIN, CHECKOUT, ROOMTYPE, RUSERPRICE 
FROM RESERVATION 
WHERE CHECKIN > to_char(sysdate - 1, 'yyyy-mm-dd') AND ? <= CHECKIN AND ? >= CHECKOUT 
ORDER BY RNO DESC;
----------------------------------------------------------------------------------------------
DROP TABLE ROOM;
���� ���̺�
CREATE TABLE ROOM(ROOMTYPE VARCHAR2(20) NOT NULL, ROOMGRADE NUMBER(10) NOT NULL PRIMARY KEY);

����Ű ���Ṯ
ALTER TABLE RESERVATION ADD FOREIGN KEY(ROOMGRADE) REFERENCES ROOM(ROOMGRADE);

INSERT INTO ROOM VALUES('���Ĵٵ�', '1');
INSERT INTO ROOM VALUES('�𷰽�', '2');
INSERT INTO ROOM VALUES('����Ʈ', '3');
INSERT INTO ROOM VALUES('������Ƽ��', '4');

--------------------------------------------------------------------------------------------------
ȸ������ ���̺�
//1. ID�� unique �� �߰�
CREATE TABLE REGISTER_USER(
    USERCODE NUMBER PRIMARY KEY,
    USERID VARCHAR2(40) NOT NULL unique,
    USERPASSWORD VARCHAR2(20) NOT NULL, 
    USERNAME VARCHAR2(20) NOT NULL, 
    USERBIRTH VARCHAR2(20) NOT NULL, 
    USERPHONE VARCHAR2(20) NOT NULL,  
    USEREMAIL VARCHAR2(40) NOT NULL, 
    USERADDRESS VARCHAR2(100) NOT NULL, 
    USERREGDATE DATE DEFAULT SYSDATE NOT NULL,
    USERGRADE NUMBER(2) NOT NULL);

������ ������ ����/����
DROP SEQUENCE register_user_seq;
DROP SEQUENCE seq_qna;

������ �����
CREATE SEQUENCE register_user_seq START WITH 1;
CREATE SEQUENCE seq_qna START WITH 1;

<insert>
insert into REGISTER_USER values(register_user_seq.nextval,'4444','3333','�ѵ�ȣ','1994-03-22','010-3333-3333','cocu7714@naver.com','����� ���Ǳ�',sysdate,4);
insert into REGISTER_USER values(register_user_seq.nextval,'test7720','1111','�׽�Ʈ','1994-03-21','010-1111-1111','test7712@naver.com','����� ���Ǳ�','2020-04-17',1);

insert into QNABOARD values(seq_qna.nextval,'test7713','�䳢�� �ź��� �亯','�䳢�� �ź��̰� ��ҽ��ϴ�.',2,1,0,0,sysdate,'true');
insert into QNABOARD values(seq_qna.nextval,'4444','3333','�׽�Ʈ��',7,0,0,0,sysdate,'true');

SELECT USERCODE, USERID, USERNAME, USERPHONE, USERADDRESS, USERREGDATE, USERGRADE
						 FROM REGISTER_USER 
						 ORDER BY USERCODE DESC;

---------------------------------------------------------------------------------------------------------------------------
�������̺�
CREATE TABLE review (
    no          NUMBER PRIMARY KEY,
    room        VARCHAR2(50) NOT NULL,
    userid      VARCHAR2(50) NOT NULL,
    text        VARCHAR2(100) NOT NULL,
    regdate     DATE NOT NULL,
    rating      NUMBER NOT NULL,
    reviewdel   VARCHAR2(50) NOT NULL
);
������ ����
CREATE SEQUENCE REVIEW_SEQ START WITH 1;
INSERT INTO RESERVATION VALUES (REVIEW_SEQ.NEXTVAL, 'choco1234', '�Ѵ���', '010-4033-5958', 2, '2021-05-28', '2021-05-29', '���Ĵٵ�', 100000, 1);
commit;

����Ű ���Ṯ
ALTER TABLE REVIEW ADD FOREIGN KEY(USERID) REFERENCES REGISTER_USER(USERID);
����Ű ���Ṯ
ALTER TABLE RESERVATION ADD FOREIGN KEY(ROOMGRADE) REFERENCES ROOM(ROOMGRADE);
commit;
