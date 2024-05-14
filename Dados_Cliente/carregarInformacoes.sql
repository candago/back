--CRIAÇÃO DAS TABELAS
create table if not exists tbalteracao_atibaia(
id integer primary key,
area_km2 float,
municipio varchar(254),
cod_estado varchar(254),
cod_class float,
class varchar(254),
obs varchar(254),
geom geometry(multipolygon,31983)
);

create table if not exists tbalteracao_cruzeiro(
id integer primary key,
area_km2 float,
municipio varchar(254),
cod_estado varchar(254),
cod_class float,
class varchar(254),
obs varchar(254),
geom geometry(multipolygon,31983)
);

create table if not exists tbalteracao_taubate(
id integer primary key,
area_km2 float,
municipio varchar(254),
cod_estado varchar(254),
cod_class float,
class varchar(254),
obs varchar(254),
geom geometry(multipolygon,31983)
);

create table if not exists tbaoi_atibaia(
id integer primary key,
cd_mun varchar(7),
nm_mun varchar(50),
sigla_uf varchar(2),
area_km2 float,
geom geometry(multipolygon,31983)
);

create table if not exists tbaoi_cruzeiro(
id integer primary key,
cd_mun varchar(7),
nm_mun varchar(50),
sigla_uf varchar(2),
area_km2 float,
geom geometry(multipolygon,31983)
);

create table if not exists tbaoi_taubate(
id integer primary key,
cd_mun varchar(7),
nm_mun varchar(50),
sigla_uf varchar(2),
area_km2 float,
geom geometry(multipolygon,31983)
);

create table if not exists tbapontamento_alteracao_atibaia(
id integer primary key,
correcao varchar(254),
status varchar(254),
obs varchar(254),
geom geometry(point,31983)
);

create table if not exists tbapontamento_alteracao_cruzeiro(
id integer primary key,
correcao varchar(254),
status varchar(254),
obs varchar(254),
geom geometry(point,31983)
);

create table if not exists tbapontamento_alteracao_taubate(
id integer primary key,
correcao varchar(254),
status varchar(254),
obs varchar(254),
geom geometry(point,31983)
);

create table if not exists tbgrade_atuacao_atibaia(
id integer primary key,
atribuicao varchar(25),
status varchar(25),
validacao varchar(25),
status_val varchar(25),
obs varchar(250),
area_km2 float,
geom geometry(multipolygon,31983)
);

create table if not exists tbgrade_atuacao_cruzeiro(
id integer primary key,
atribuicao varchar(25),
status varchar(25),
validacao varchar(25),
status_val varchar(25),
obs varchar(250),
area_km2 float,
geom geometry(multipolygon,31983)
);

create table if not exists tbgrade_atuacao_taubate(
id integer primary key,
atribuicao varchar(25),
status varchar(25),
validacao varchar(25),
status_val varchar(25),
obs varchar(250),
area_km2 float,
geom geometry(multipolygon,31983)
);

--INSERT DOS ARQUIVOS DO CLIENTE

copy tbalteracao_atibaia
from 'D:\Dados_Cliente\alteracao_atibaia.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbalteracao_cruzeiro
from 'D:\Dados_Cliente\alteracao_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbalteracao_taubate
from 'D:\Dados_Cliente\ABP\alteracao_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbaoi_atibaia
from 'D:\Dados_Cliente\ABP\aoi_atibaia.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbaoi_cruzeiro
from 'D:\Dados_Cliente\aoi_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbaoi_taubate
from 'D:\Dados_Cliente\aoi_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbapontamento_alteracao_atibaia
from 'D:\Dados_Cliente\apontamento_alteracao_atibaia.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbapontamento_alteracao_cruzeiro
from 'D:\Dados_Cliente\apontamento_alteracao_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbapontamento_alteracao_taubate
from 'D:\Dados_Cliente\apontamento_alteracao_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbgrade_atuacao_atibaia
from 'D:\Dados_Cliente\grade_atuacao_atibaia.csv'
with (format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbgrade_atuacao_cruzeiro
from 'D:\Dados_Cliente\grade_atuacao_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbgrade_atuacao_taubate
from 'D:\Dados_Cliente\grade_atuacao_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

create view tb_aoi as (
select * from (
	select cd_mun, nm_mun, sigla_uf, area_km2, geom from tbaoi_cruzeiro union
	select cd_mun, nm_mun, sigla_uf, area_km2, geom from tbaoi_atibaia union
	select cd_mun, nm_mun, sigla_uf, area_km2, geom from tbaoi_taubate) aois order by cd_mun );

create view tb_apontamento_alteracao as (
	select correcao, status, obs, geom from tbapontamento_alteracao_taubate union
	select correcao, status, obs, geom from tbapontamento_alteracao_atibaia union
	select correcao, status, obs, geom from tbapontamento_alteracao_cruzeiro);

create view tb_alteracao as (
	select * from tbalteracao_atibaia union
	select * from tbalteracao_taubate union
	select * from tbalteracao_cruzeiro);

create view tb_grade_atuacao as (
	select * from tbgrade_atuacao_atibaia union
	select * from tbgrade_atuacao_taubate union
	select * from tbgrade_atuacao_cruzeiro);


create table usuarios
(id serial primary key,
 nome varchar(125),
 email varchar(50),
 senha varchar);

