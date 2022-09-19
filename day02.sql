use web0315;
# 테이블 삭제
drop table car;

# 테이블 수정
# 제약조건
# unique 제약조건 : 고유한 값만 삽입될 수 있도록 하는 제약조건
# not null 제약조건 : 비어있을 수 없도록 하는 제약조건
create table user(
	userid varchar(300) unique,
    userpw varchar(300) not null,
    username varchar(300)
);

# 테이블명 수정
alter table user rename to userinfo;
alter table userinfo rename to user;

# 컴럼추가
alter table user add(useridx int primary key);

# 컬럼수정
alter table user modify useridx bigint;

# 컬럼삭제
alter table user drop username;

# 부모 테이블
create table owner(
	id varchar(300) primary key,
	name varchar(300),
    phone varchar(300),
    age int,
    addr varchar(1000)
);

# 자식 테이블
create table car(
	carnum varchar(300) primary key,
	brand varchar(300),
    color varchar(300),
    price int,
    id varchar(300),
    constraint car_owner_fk foreign key(id) references owner(id)
);
# 1. 요구분석
# 학생 - 학번, 필요학점, 학과, 학년
# 과목 정보 - 과목코드, 과목명, 강의실, 강의 교수, 강의시간, 학점, 시작시간, 학과, 학년, 정원
# 리스트 - 과목코드, 과목명, 강의실, 학과

# 2. 개념적 설계
# 학생 - 학번(PK), 필요학점(NN), 학과, 학년, 신청 과목
# 과목 정보 - 과목코드(PK), 과목명(NN), 과목코드(FK), 강의시작 시간, 강의 끝 시간
# 리스트 - 과목코드(PK), 과목명(NN), 신청가능 학점, 과목 수 

create table student(
	studentid varchar(300) primary key,
    neednum int not null,
    department varchar(300),
    grade varchar(300),
    subjects varchar(1000)
); 

create table class(
	classcode varchar(1000) primary key,
    classname varchar(1000) not null,
    claStart varchar(300),
    clasEnd varchar(300),
    subject varchar(1000),
    constraint class_student_fk foreign key(subject) references student(subject)
);

create table list(
	classcode varchar(1000) primary key,
    classname varchar(1000) not null,
    Applicable_credits int,
    number_of_subjects varchar(300)
);