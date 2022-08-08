create table t_member(
	id varchar2(20) primary key,
	pwd varchar2(20),
	name varchar2(30),
	email varchar2(30),
	joinDate date default sysdate
);
commit;
insert into t_member(id,pwd,name,email) values('hong',123,'hong','email');
insert into t_member(id,pwd,name,email) values('lee',123,'lee','email');

select * from t_member;