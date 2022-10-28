create database DB_CDS;
use db_cds;

create table Artista(
	Nome_Coluna varchar (100),
    Cod_Art int auto_increment not null,
    Nome_Art varchar (100) not null,
    constraint PK_CodArt primary key (Cod_Art),
    constraint uq_nomeArt unique key (nome_art)
);
create table gravadora(
	Nome_coluna varchar(100) not null,
    Cod_grav int auto_increment not null,
    Nome_grav varchar (100) not null,
    constraint PK_CodGrav primary key (Cod_grav),
    constraint uq_NomeGrav unique key (Nome_grav)
);
create table Categoria(
     Cod_cat int auto_increment not null,
     Nome_cat varchar(100),
     constraint PK_CodCat primary key (Cod_cat),
     constraint uq_NomeCat unique key (nome_cat)
);
select * from Categoria;

create table Estado(
	Sigla_Est char(2) not null,
    Nome_Est char (50) not null,
    
    constraint pk_SiglaEst primary key (Sigla_Est)
 ); 
create table Cidade(
	Cod_Cid int  not null,
    Sigla_Est char (2) not null,
	Nome_Cid char(2) not null,
    
    constraint pk_CodCid primary key (Cod_Cid),
    constraint fk_SiglaEst foreign key (Sigla_Est) references Estado (Sigla_Est)
);

create table Cliente(
	Cod_cli int auto_increment not null,
    Cod_cid int not null,
    Nome_Cli varchar(100) not null,
    End_Cli varchar(200) not null,
    Renda_Cli  Decimal(10,2) not null,
    Sexo_cli char(1) not null,
		
	constraint pk_CodCid foreign key (Cod_cid) references Cidade (Cod_Cid),    
    constraint pk_CodCli primary key (Cod_cli)
);

create table Conjuge(
	Cod_cli int not null,
    Nome_Conj varchar(100) not null,
	Renda_conj decimal(10,2) not null,
    Sexo_conj char (1) not null,
    
    constraint pk_CodCli  foreign key (Cod_cli) references Cliente (Cod_cli)
);

create table Funcionario(
	Cod_func int auto_increment not null,
    Nome_func varchar(100) not null,
    End_Func varchar (200) not null,
    Sal_Func decimal (10,2) not null,
    sexo_Func char(1) not null,
    
    constraint fk_CodFunc primary key (Cod_Func)
);

create table dependente(
	Cod_Dep int auto_increment not null,
	Cod_Func int not null,
    Nome_dep varchar(100) not null,
    Sexo_dep char(1) not null,
    
    constraint pk_CodDep primary key (Cod_Dep),
    constraint pk_CodFunc foreign key (Cod_func) references Funcionario (Cod_func)
);

create table titulo(
	Cod_Tit int auto_increment not null,
    Cod_cat int not null,
    Cod_Grav int not null,
    Nome_cd varchar(100) not null,
    Val_cd decimal (10,2) not null,
    Qtd_Estq int not null,
    
    constraint pk_CodTit primary key (Cod_tit),
    constraint fk_CodCat foreign key (Cod_cat) references Categoria (Cod_cat),
    constraint fk_CodGrav foreign  key (Cod_Grav) references gravadora (Cod_Grav)
);

create table Pedido(
	Num_ped int auto_increment not null,
    Cod_cli int not null,
    Cod_func int not null,
    Data_ped datetime not null,
    Val_ped decimal(10,2) not null,
    
    constraint pk_NumPed primary key (Num_ped)
   
);

create table titulo_pedido(
	num_ped int not null,
    Cod_tit int not null,
    Qtd_cd int not null,
    Val_cd decimal(10,2),
    
    constraint fk_NumPed foreign key (Num_ped) references Pedido (Num_ped),
    constraint fk_Codtit foreign key (Cod_tit) references titulo (Cod_tit)
);

create table titulo_Artista(
	Cod_tit int not null,
    Cod_art int not null
); 