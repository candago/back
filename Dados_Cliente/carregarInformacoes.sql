-- Comandos SQL para criar as tabelas e carregar nas tabelas os registros
-- que estão nos arquivos CSV da pasta csv.
-- É necessário substituir o caminho D:\csv\ pelo caminho
-- do projeto no seu computador.
-- Lembre-se que antes de executar esses comandos, será necessário incluir a 
-- extensão espacial POSTGIS no seu BD.

-- Apagar as tabelas
drop table if exists grids;
drop table if exists changes;
drop table if exists pointers;
drop table if exists projects;
drop table if exists users;

-- Criar um tipo para o perfil de usuário
DROP TYPE IF EXISTS enum_profile CASCADE;
CREATE TYPE enum_profile AS ENUM ('user', 'adm');

-- Criar a tabela de usuários
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
  name varchar,
	mail VARCHAR(50) NOT NULL,
	password VARCHAR(100) NOT NULL,
	profile enum_profile NOT NULL DEFAULT 'user',
	CONSTRAINT users_mail_unique UNIQUE (mail)
);

-- Criar a tabela de projetos
create table if not exists projects (
	id serial primary key,
	name varchar(50) not null,
	area_km2 float not null,
	geom geometry(multipolygon,31983)
);

-- Criar a tabela de apontamentos
create table if not exists pointers (
   id serial primary key not null,
   idproject integer REFERENCES projects(id),
   correcao varchar(254),
   status varchar(254),
   obs varchar(254),
   geom geometry(point,31983)
);

-- Criar a tabela de alterações
create table if not exists changes (
   id serial primary key,
   idproject integer REFERENCES projects(id),
   area_km2 float,
   municipio varchar(254),
   cod_estado varchar(254),
   cod_class float,
   class varchar(254),
   obs varchar(254),
   geom geometry(multipolygon,31983)
);

-- Criar a tabela de grades
create table if not exists grids (
   id serial primary key,
   idproject integer REFERENCES projects(id),
   user_editor integer REFERENCES users(id),
   user_revisor integer REFERENCES users(id),
   status varchar(25),
   status_val varchar(25),
   obs varchar(250),
   area_km2 float,
   geom geometry(multipolygon,31983)
);

-- Ler o arquivo CSV e carregar na tabela users
copy users
from 'D:\csv\users.csv'
with (
  format csv,
  header true,
  delimiter ';',
  null 'NULL',
  encoding 'UTF-8'
);

-- Ler o arquivo CSV e carregar na tabela projects
copy projects
from 'D:\csv\projects.csv'
with (
  format csv,
  header true,
  delimiter ';',
  null 'NULL',
  encoding 'UTF-8'
);

-- Ler o arquivo CSV e carregar na tabela changes
copy changes
from 'D:\csv\changes.csv'
with (
  format csv,
  header true,
  delimiter ';',
  null 'NULL',
  encoding 'UTF-8'
);

-- Ler o arquivo CSV e carregar na tabela pointers
copy pointers
from 'D:\csv\pointers.csv'
with (
  format csv,
  header true,
  delimiter ';',
  null 'NULL',
  encoding 'UTF-8'
);

-- Ler o arquivo CSV e carregar na tabela grids
copy grids
from 'D:\csv\grids.csv'
with (
  format csv,
  header true,
  delimiter ';',
  null 'NULL',
  encoding 'UTF-8'
);

-- Redefine a sequência para o próximo valor disponível
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users) + 1);
SELECT setval('projects_id_seq', (SELECT MAX(id) FROM projects) + 1);
SELECT setval('pointers_id_seq', (SELECT MAX(id) FROM pointers) + 1);
SELECT setval('grids_id_seq', (SELECT MAX(id) FROM grids) + 1);
SELECT setval('changes_id_seq', (SELECT MAX(id) FROM changes) + 1);

create or replace view progressByAreaPerUser as (
	select p.name,
	(select u.name from users u where id = gs.user_editor) as mail,
	sum(gs.area_km2) as completo,
	(select sum(area_km2)
			from grids gs2 
			where user_editor = gs.user_editor 
			and idProject = gs.idProject)
	as total_atribuido 
	from grids gs
	inner join projects p on p.id = gs.idproject
where status = 'finalizado'
group by user_editor, idProject, p.name
order by p.name
)