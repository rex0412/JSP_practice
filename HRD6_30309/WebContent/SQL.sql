create table tbl_artist_201905(
artist_id char(4) not null primary key,
artist_name varchar2(20),
artist_birth char(8),
artist_gender char (1),
talent char(1),
agency varchar(30)
);

insert into tbl_artist_201905 values ('A001', '김스타', '19970101', 'F', '1', 'A엔터테이먼트');
insert into tbl_artist_201905 values ('A002', '조스타', '19980201', 'M', '2', 'B엔터테이먼트');
insert into tbl_artist_201905 values ('A003', '왕스타', '19900301', 'M', '3', 'C엔터테이먼트');
insert into tbl_artist_201905 values ('A004', '정스타', '20000401', 'M', '1', 'D엔터테이먼트');
insert into tbl_artist_201905 values ('A005', '홍스타', '20010501', 'F', '2', 'E엔터테이먼트');

create table tbl_mento_201905(
mento_id char(4) not null primary key,
mento_name varchar2(20)
);

insert into tbl_mento_201905 values ('J001', '함멘토');
insert into tbl_mento_201905 values ('J002', '박멘토');
insert into tbl_mento_201905 values ('J003', '장멘토');

create table tbl_point_201905 (
serial_no number(8) not null primary key,
artist_id char(4),
mento_id char(4),
point number(3)
);

insert into tbl_point_201905 values ('2019001', 'A001', 'J001', '78');
insert into tbl_point_201905 values ('2019002', 'A001', 'J002', '76');
insert into tbl_point_201905 values ('2019003', 'A001', 'J003', '70');
insert into tbl_point_201905 values ('2019004', 'A002', 'J001', '80');
insert into tbl_point_201905 values ('2019005', 'A002', 'J002', '72');
insert into tbl_point_201905 values ('2019006', 'A002', 'J003', '78');
insert into tbl_point_201905 values ('2019007', 'A003', 'J001', '90');
insert into tbl_point_201905 values ('2019008', 'A003', 'J002', '92');
insert into tbl_point_201905 values ('2019009', 'A003', 'J003', '88');
insert into tbl_point_201905 values ('2019010', 'A004', 'J001', '96');
insert into tbl_point_201905 values ('2019011', 'A004', 'J002', '90');
insert into tbl_point_201905 values ('2019012', 'A004', 'J003', '98');
insert into tbl_point_201905 values ('2019013', 'A005', 'J001', '88');
insert into tbl_point_201905 values ('2019014', 'A005', 'J002', '86');
insert into tbl_point_201905 values ('2019015', 'A005', 'J003', '86');

select po.serial_no, ar.artist_id, ar.artist_name, ar.artist_birth, po.point, po.point, me.mento_name 
from tbl_artist_201905 ar, tbl_mento_201905 me, tbl_point_201905 po 
where ar.artist_id = po.artist_id and me.mento_id = po.mento_id;

select ar.artist_id, ar.artist_name, sum(po.point) as sum, round(avg(po.point),2) as avg, rank() over(order by round(avg(po.point),2) desc)
from tbl_artist_201905 ar, tbl_point_201905 po
where ar.artist_id = po.artist_id
group by ar.artist_id, ar.artist_name;