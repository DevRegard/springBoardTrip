create database trip;

create table t_notice(
n_num int(4) not null auto_increment primary key,
user varchar(30) not null,
n_subject varchar(30) not null,
n_content text not null,
u_pass varchar(16) not null,
wdate date,
ip varchar(30),
n_readcount int(4) default 0
);

create table travel(
num int(4) not null auto_increment primary key,
writer varchar(30) not null,
subject varchar(20) not null,
language varchar(20),
distance varchar(20),
capital varchar(20),
food varchar(20),
pw varchar(14) not null,
regdate datetime,
readcount int(4) default 0,
content text not null,
ip varchar(20)
);

create table faq(
num int not null primary key auto_increment,
writer varchar(30) not null,
subject varchar(50) not null, 
pw varchar(16) not null,
regdate datetime,
content text not null, 
ip varchar(30) 
);

create table f_qna(
num int not null primary key auto_increment,
user varchar(30) not null,
f_subject varchar(50) not null, 
f_content text not null, 
pwd varchar(16) not null,
sec varchar(2) default 'n' check(choose in( 'y','n')),
ref int not null,
re_step int not null,
re_level int(4) not null,
f_regdate datetime,
ip varchar(30) 
);

create table member(
m_id varchar(20) not null primary key,
m_pw varchar(20) not null,
m_name varchar(30) not null,
m_jumin1 varchar(6),
m_jumin2 varchar(7),
m_email varchar(30) not null,
m_email2 varchar(30) not null,
m_zipcode varchar(7), 
m_addr varchar(60),
m_regdate date
);
