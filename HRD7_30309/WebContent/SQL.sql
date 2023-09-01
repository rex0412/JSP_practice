create table tbl_pizza_01(
pcode char(4) not null primary key,
pname varchar2(30),
cost number(7)
 );
 
 insert into tbl_pizza_01 values ('AA01', '고르곤졸라피자', '6000');
 insert into tbl_pizza_01 values ('AA02', '치즈피자', '6500');
 insert into tbl_pizza_01 values ('AA03', '페퍼로니피자', '7000');
 insert into tbl_pizza_01 values ('AA04', '콤비네이션피자', '7500');
 insert into tbl_pizza_01 values ('AA05', '고구마피자', '6000');
 insert into tbl_pizza_01 values ('AA06', '포테이토피자', '7000');
 insert into tbl_pizza_01 values ('AA07', '불고기피자', '8000');
 insert into tbl_pizza_01 values ('AA08', '나폴리피자', '8000');
 
create table tbl_shop_01(
scode char(4) not null primary key,
sname varchar2(20)
);

insert into tbl_shop_01 values ('S001', '강남점');
insert into tbl_shop_01 values ('S002', '강서점');
insert into tbl_shop_01 values ('S003', '강동점');
insert into tbl_shop_01 values ('S004', '영동점');
insert into tbl_shop_01 values ('S005', '시청점');
insert into tbl_shop_01 values ('S006', '인천점');

create table tbl_salelist_01 (
saleno number(7) not null,
scode char(4) not null,
saledate date,
pcode char(4) not null,
amount number(5),
constraint tbl_salelist_01_pk primary key(saleno),
constraint tbl_salelist_01_fk foreign key (scode) references tbl_shop_01(scode),
constraint tbl_salelist_01_fk1 foreign key (pcode) references tbl_pizza_01(pcode)
);

insert into tbl_salelist_01 values ('100001', 'S001', '20181202', 'AA01', 50);
insert into tbl_salelist_01 values ('100002', 'S001', '20181202', 'AA02', 30);
insert into tbl_salelist_01 values ('100003', 'S001', '20181202', 'AA03', 20);
insert into tbl_salelist_01 values ('100004', 'S001', '20181202', 'AA04', 50);
insert into tbl_salelist_01 values ('100005', 'S003', '20181203', 'AA01', 40);
insert into tbl_salelist_01 values ('100006', 'S003', '20181203', 'AA02', 60);
insert into tbl_salelist_01 values ('100007', 'S003', '20181203', 'AA04', 60);
insert into tbl_salelist_01 values ('100008', 'S003', '20181204', 'AA05', 70);
insert into tbl_salelist_01 values ('100009', 'S005', '20181202', 'AA01', 80);
insert into tbl_salelist_01 values ('100010', 'S005', '20181202', 'AA03', 30);
insert into tbl_salelist_01 values ('100011', 'S005', '20181202', 'AA04', 40);
insert into tbl_salelist_01 values ('100012', 'S005', '20181202', 'AA05', 50);
insert into tbl_salelist_01 values ('100013', 'S004', '20181204', 'AA01', 30);
insert into tbl_salelist_01 values ('100014', 'S004', '20181204', 'AA02', 20);
insert into tbl_salelist_01 values ('100015', 'S004', '20181204', 'AA06', 50);

select sa.saleno, sa.scode, sh.sname, to_char(sa.saledate, 'YYYY-MM-DD'), pi.pcode, pi.pname, sa.amount, to_char(sum(pi.cost*sa.amount), '999,999,999') 
from tbl_pizza_01 pi, tbl_shop_01 sh, tbl_salelist_01 sa 
where sh.scode = sa.scode and pi.pcode = sa.pcode 
group by sa.saleno, sa.scode, sh.sname, sa.saledate, pi.pcode, pi.pname, sa.amount 
order by sa.saleno;

select sh.scode, sh.sname, to_char(sum(pi.cost*sa.amount), '999,999,999') 
from tbl_pizza_01 pi, tbl_shop_01 sh, tbl_salelist_01 sa 
group by sh.scode, sh.sname 
order by sh.scode;