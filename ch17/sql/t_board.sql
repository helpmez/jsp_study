drop table t_board cascade constraints;

create table t_board(
	articleNO number(10) primary key,
	parentNO number(10) default 0,
	title varchar2(500) not null,
	content varchar2(4000),
	imageFileName varchar(30),
	writedate date default sysdate not null,
	id varchar2(10),
	constraint fk_id foreign key(id)
	references t_member(id)
	on delete cascade /* ===>회원정보 화면에서 id 삭제시 
							그 회원이 게시판에 쓴 글 모두삭제  */
	);
	commit;
	
	insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate,id)
	 values(1,0,'테스트','테스트',null,to_date('2022-07-08','YYYY-MM-DD'),'hong');
    commit;
    select * from t_board;