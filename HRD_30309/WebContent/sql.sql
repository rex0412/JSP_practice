create table tbl_player_info(
registration_code char(4) not null primary key,
name varchar2(18),
birth_day varchar2(8),
height number(3),
weight number(3)
);

insert into tbl_player_info values ('A001', '김길동', '19900101', '180', '82');
insert into tbl_player_info values ('A005', '이길동', '20000101', '190', '85');
insert into tbl_player_info values ('B002', '홍길동', '19950101', '175', '75');
insert into tbl_player_info values ('B006', '조길동', '19950101', '185', '80');

create table tbl_hitter_info(
registration_code char(4) not null primary key,
game_numbers number(3),
appearance number(3),
hit_numbers number(3),
home_runs number(3),
put_out number(3),
double_play number(3),
error_count number(3)
);

insert into tbl_hitter_info values ('A001', '120', '330', '100', '20', '80', '27', '1');
insert into tbl_hitter_info values ('A005', '110', '300', '110', '30', '60', '5', '2');
insert into tbl_hitter_info values ('B002', '100', '270', '90', '5', '100', '10', '3');

select pl.registration_code, pl.name, hi.game_numbers, hi.appearance, hi.hit_numbers, hi.home_runs, round(((((hi.hit_numbers+hi.home_runs)/hi.appearance)*100)+hi.home_runs), 2) as attack, hi.put_out, hi.double_play, hi.error_count, hi.put_out+(hi.double_play*2)-(hi.error_count*5) as defend from tbl_player_info pl, tbl_hitter_info hi where pl.registration_code = hi.registration_code and pl.registration_code='';

순위 등급 점수 매기는 식 -> rank over에 넣어라.
(((((안타수+홈런수)/타석수)*100)+홈런수)+(아웃카운트수+(더블플레이수*2)-에러수*5)))

rank((((((안타수+홈런수)/타석수)*100)+홈런수)+(아웃카운트수+(더블플레이수*2)-에러수*5)))) over(order by [] asc);