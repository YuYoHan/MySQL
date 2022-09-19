create database project;
use project;
drop table car_detail;

create table user(
	userid varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300) not null,
	userphone varchar(300)not null,
	useraddr varchar(2000)not null
);

create table car(
	carnum int primary key,
    cartype varchar(300) not null,
    distance varchar(300) not null,
    carage  int not null,
    price varchar(300) not null,
    userid varchar(300), 
    constraint id_fk foreign key(userid) references user(userid)
);




create table dealinfo(
	tradenum varchar(300) primary key,
    tradestatus varchar(300) not null,
    registtime datetime default current_timestamp,
    carnum int, 
		constraint carnum_fk foreign key(carnum) references car(carnum),
	userid varchar(300),
		constraint id2_fk foreign key(userid) references user(userid)
);

create table good(
	click_like int default 0,
    carnum int,
		constraint carnum1_fk foreign key(carnum) references car(carnum),
	userid varchar(300),
        constraint id3_fk foreign key(userid) references user(userid)
);

create table review(
	article_number int primary key auto_increment,
    title varchar(300) not null,
    detail varchar(4000) not null,
	registtime datetime default current_timestamp,
    carnum int,
		constraint carnum2_fk foreign key(carnum) references car(carnum),
	userid varchar(300),
		constraint id4_fk foreign key(userid) references user(userid)

);

create table message(
	msgnum int primary key auto_increment,
    send_id varchar(300) not null,
    msg varchar(300) not null,
    registtime datetime default current_timestamp,
	recieve_id varchar(300) not null,
		constraint message_fk foreign key(recieve_id) references user(userid)
);