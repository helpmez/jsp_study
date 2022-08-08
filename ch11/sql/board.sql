create table board(
	num number(5) primary key,-- 글번호는 중복허가 X--
	pass varchar2(30),
	name varchar2(30),
	email varchar2(30),
	title varchar2(50),
	content varchar2(1000),
	readcount number(4) default 0, --조회수 초기값은 0--
	writedate date default sysdate
);

create squence board_seq start with 1 increment by 1; 

commit;
select * from board;