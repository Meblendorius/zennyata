use tcc;

create table profissional(idprof int primary key  NOT NULL AUTO_INCREMENT,
nomeprof varchar(100) ,
sobreprof varchar(100),
cpf varchar(100),
email varchar(100),
senha varchar(100),
nasc datetime,
tel varchar(100),
cep varchar(100),
crpm varchar(100)
);

insert into profissional(nomeprof,sobreprof,cpf,email,senha,nasc,tel,cep,crpm) values('Flavia','rogeria','12345678','fla@gmail.com','coxinha@123',22/03/1987,'0712345676','04989123', '12357');
select * from profissional;
drop table profissional;
drop table paciente;
drop table questionario;
drop table tarefas;

create table paciente(idpac int primary key  NOT NULL AUTO_INCREMENT,
nomepac varchar(100) ,
sobrepac varchar(100),
cpf varchar(100),
idprof int,
email varchar(100),
senha varchar(100),
nasc datetime,
tel varchar(100),
cep varchar(100),
FOREIGN KEY (idprof) references profissional(idprof));

insert into paciente (nomepac,sobrepac,cpf,idprof,email,senha,nasc,tel,cep) values('Jorge','Cabral','1239487',1,'jorge@gmail.com','sa3t@@!','2001/06/22' ,'11982394726','239479');
SELECT resp FROM questionario where idpac=1;
select * from paciente;

create table questionario(idquest int primary key  NOT NULL AUTO_INCREMENT,
idpac int,
idprof int,
quest varchar(300),
resp varchar(300),
FOREIGN KEY (idprof) references profissional(idprof),
FOREIGN KEY (idpac) references paciente(idpac));

insert into questionario(idpac,idprof,quest,resp) values
(1,1,'Como está se sentindo?','estou me sentindo muito triste '),
(1,1,'Como está se sentindo?','sinto que estou tentando fazer as coisas e não conseguindo'),
(1,1,'Como está se sentindo?','a tristeza parece ser meu único sentimento'),
(1,1,'Como está se sentindo?','sinto que outros não gostam de mim '),
(1,1,'Como está se sentindo?','todas as minhas tentativas são falhas, não consigo fazer nada '),
(1,1,'Como está se sentindo?','hoje senti que estava um pouco melhor'),
(1,1,'Como está se sentindo?','Os sentimentos bons voltaram a aparecer'),
(1,1,'Como está se sentindo?','não tenho contade de sair de casa'),
(1,1,'Como está se sentindo?','me senti levemente alegre'),
(1,1,'Como está se sentindo?','não consigo focar nos meus pensamentos '),
(1,1,'Como está se sentindo?','ele me traiu, estou desolada'),
(1,1,'Como está se sentindo?','não tive chances'),
(1,1,'Como está se sentindo?','hoje tudo ocorreu bem'),
(1,1,'Como está se sentindo?','estou genuinamente feliz'),
(1,1,'Como está se sentindo?','me sinto alegre'),
(1,1,'Como está se sentindo?','estou sorridente'),
(1,1,'Como está se sentindo?','parecem estar melhorando '),
(1,1,'Como está se sentindo?','tudo ocorrendo bem'),
(1,1,'Como está se sentindo?','quero me matar'),
(1,1,'Como está se sentindo?','vou cometer suicidio'),
(1,1,'Como está se sentindo?','não quero mais viver'),
(1,1,'Como está se sentindo?','não sinto mais vontade'),
(1,1,'Como está se sentindo?','darei fim a tudo'),
(1,1,'Como está se sentindo?','não suporto mais'),
(1,1,'Como está se sentindo?','estou inquieto'),
(1,1,'Como está se sentindo?','não suporto as pessoas'),
(1,1,'Como está se sentindo?','odeio tudo'),
(1,1,'Como está se sentindo?','odeio todos'),
(1,1,'Como está se sentindo?','me sinto muito ansioso'),
(1,1,'Como está se sentindo?','quero desistir'),
(1,1,'Como está se sentindo?','não suporto mais'),
(1,1,'Como está se sentindo?','estou tentando '),
(1,1,'Como está se sentindo?','as coisas vão melhorar'),
(1,1,'Como está se sentindo?','preocupado');
SELECT resp FROM questionario where idquest=1;
select * from questionario;

create table tarefas(idtaref int primary key  NOT NULL AUTO_INCREMENT,
idpac int,
nome varchar(100),
importancia int,
dia datetime,
encerrado boolean,
humor int,
notas varchar(1000),
FOREIGN KEY (idpac) references paciente(idpac));

select dia, humor from tarefas where idpac=1;
insert into tarefas (idpac,nome,importancia,dia,encerrado,humor,notas)values
(1,	'Tarefa 1',2,'2022/10/10',true,2,'okay'),
(1,	'Tarefa 2',3,'2022/10/10',true,3,'okay'),
(1,	'Tarefa 3',3,'2022/10/10',true,3,'okay'),
(1,	'Tarefa 4',3,'2022/10/10',true,3,'okay'),
(1,	'Tarefa 5',2,'2022/10/10',true,2,'okay'),
(1,	'Tarefa 6',4,'2022/10/10',true,4,'okay'),
(1,	'Tarefa 7',1,'2022/10/10',true,1,'okay'),
(1,	'Tarefa 8',4,'2022/10/11',true,4,'okay'),
(1,	'Tarefa 9',3,'2022/10/11',true,3,'okay'),
(1,	'Tarefa 10',2,'2022/10/11',true,2,'okay'),
(1,	'Tarefa 11',2,'2022/10/11',true,2,'okay'),
(1,	'Tarefa 12',4,'2022/10/11',true,4,'okay'),
(1,	'Tarefa 13',2,'2022/10/11',true,2,'okay'),
(1,	'Tarefa 14',4,'2022/10/11',true,4,'okay'),
(1,	'Tarefa 15',4,'2022/10/12',true,4,'okay'),
(1,	'Tarefa 16',1,'2022/10/12',true,1,'okay'),
(1,	'Tarefa 17',1,'2022/10/12',true,1,'okay'),
(1,	'Tarefa 18',3,'2022/10/12',true,3,'okay'),
(1,	'Tarefa 19',3,'2022/10/13',true,3,'okay'),
(1,	'Tarefa 20',2,'2022/10/13',true,2,'okay'),
(1,	'Tarefa 21',5,'2022/10/13',true,5,'okay'),
(1,	'Tarefa 22',2,'2022/10/13',true,2,'okay'),
(1,	'Tarefa 23',2,'2022/10/13',true,2,'okay'),
(1,	'Tarefa 24',1,'2022/10/14',true,1,'okay'),
(1,	'Tarefa 25',3,'2022/10/14',true,3,'okay'),
(1,	'Tarefa 26',1,'2022/10/14',true,1,'okay'),
(1,	'Tarefa 27',1,'2022/10/14',true,1,'okay'),
(1,	'Tarefa 28',5,'2022/10/14',true,5,'okay'),
(1,	'Tarefa 29',1,'2022/10/14',true,1,'okay'),
(1,	'Tarefa 30',2,'2022/10/15',true,2,'okay'),
(1,	'Tarefa 31',2,'2022/10/15',true,2,'okay'),
(1,	'Tarefa 32',1,'2022/10/15',true,1,'okay'),
(1,	'Tarefa 33',1,'2022/10/15',true,1,'okay'),
(1,	'Tarefa 34',1,'2022/10/15',true,1,'okay'),
(1,	'Tarefa 35',3,'2022/10/16',true,3,'okay'),
(1,	'Tarefa 36',2,'2022/10/16',true,2,'okay'),
(1,	'Tarefa 37',5,'2022/10/16',true,5,'okay'),
(1,	'Tarefa 38',1,'2022/10/16',true,1,'okay'),
(1,	'Tarefa 39',1,'2022/10/16',true,1,'okay'),
(1,	'Tarefa 40',1,'2022/10/16',true,1,'okay'),
(1,	'Tarefa 41',3,'2022/10/16',true,3,'okay'),
(1,	'Tarefa 42',3,'2022/10/17',true,3,'okay'),
(1,	'Tarefa 43',4,'2022/10/17',true,4,'okay'),
(1,	'Tarefa 44',4,'2022/10/17',true,4,'okay'),
(1,	'Tarefa 45',4,'2022/10/17',true,4,'okay'),
(1,	'Tarefa 46',5,'2022/10/17',true,5,'okay'),
(1,	'Tarefa 47',4,'2022/10/17',true,4,'okay'),
(1,	'Tarefa 48',4,'2022/10/17',true,4,'okay'),
(1,	'Tarefa 48',4,'2022/10/17',true,4,'okay');

select * from tarefas;
