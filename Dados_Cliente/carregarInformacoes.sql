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
from 'D:\ABP\alteracao_atibaia.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbalteracao_cruzeiro
from 'D:\ABP\alteracao_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbalteracao_taubate
from 'D:\ABP\alteracao_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbaoi_atibaia
from 'D:\ABP\aoi_atibaia.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbaoi_cruzeiro
from 'D:\ABP\aoi_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbaoi_taubate
from 'D:\ABP\aoi_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbapontamento_alteracao_atibaia
from 'D:\ABP\apontamento_alteracao_atibaia.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbapontamento_alteracao_cruzeiro
from 'D:\ABP\apontamento_alteracao_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbapontamento_alteracao_taubate
from 'D:\ABP\apontamento_alteracao_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbgrade_atuacao_atibaia
from 'D:\ABP\grade_atuacao_atibaia.csv'
with (format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbgrade_atuacao_cruzeiro
from 'D:\ABP\grade_atuacao_cruzeiro.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

copy tbgrade_atuacao_taubate
from 'D:\ABP\grade_atuacao_taubate.csv'
with (
format csv,
header true,
delimiter ';',
null 'NULL',
encoding 'UTF-8'
);

