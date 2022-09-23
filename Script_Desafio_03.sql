-- Criação do Banco de Dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- Criar tabela Cliente
create table cliente(
	idCliente int primary key not null unique auto_increment
);

-- Criar tabela Pessoa Física
create table pessoaFisica(
	idPessoaFisica int not null unique auto_increment,
    nome varchar(15) not null,
    nomeMeio char not null,
    sobrenome varchar(15) not null,
    CPF char(11) not null unique,
    dataNascimento date not null,
    CEP char(9) not null,
    endereco varchar(45) not null,
    idClientePF int not null,
    primary key (idPessoaFisica, idClientePF),
    foreign key (idClientePF) references cliente(idCliente)
);

-- Criar tabela Pessoa Jurídica
create table pessoaJuridica(
	idPessoaJuridica int not null unique auto_increment,
    razaoSocial varchar(45) not null unique,
    CNPJ char(14) not null unique,
	CEP char(9) not null,
    endereco varchar(45) not null,
    idClientePJ int not null,
    primary key (idPessoaJuridica, idClientePJ),
    foreign key (idClientePJ) references cliente(idCliente)
);

