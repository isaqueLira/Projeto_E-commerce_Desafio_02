-- Criação do Banco de Dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- Criar tabela Cliente
create table cliente(
	idCliente int primary key not null unique auto_increment
);

-- Criar tabela Pessoa Física
create table pessoaFisica(
	idClientePF int not null,
    idPessoaFisica int not null unique auto_increment,
    nomePF varchar(15) not null,
    nomeMeio char not null,
    sobrenome varchar(20) not null,
    CPF char(11) not null unique,
    dataNascimento date not null,
    CEP char(9) not null,
    rua varchar(25) not null,
    numero int not null,
    complemento varchar(10),
    bairro varchar(20) not null,
    cidade varchar(20) not null,
    estado char(2) not null,
    país varchar(10) not null,
    primary key (idPessoaFisica, idClientePF),
    foreign key (idClientePF) references cliente(idCliente) on update cascade
);

-- Criar tabela Pessoa Jurídica
create table pessoaJuridica(
	idClientePJ int not null,
    idPessoaJuridica int not null unique auto_increment,
    razaoSocial varchar(45) not null unique,
    CNPJ char(14) not null unique,
	CEP char(9) not null,
    rua varchar(25) not null,
    numero int not null,
    complemento varchar(10),
    bairro varchar(20) not null,
    cidade varchar(20) not null,
    estado char(2) not null,
    país varchar(10) not null,
    primary key (idPessoaJuridica, idClientePJ),
    foreign key (idClientePJ) references cliente(idCliente) on update cascade
);

-- Criar tabela Fornecedor
create table fornecedor(
	idFornecedor int not null unique auto_increment,
    razaoSocialFornecedor varchar(45) not null unique,
    CNPJFornecedor char(14) not null unique,
    tipoFornecedor enum('Padrão da Loja','Terceirizado') default 'Padrão da Loja',
    banco varchar(15) not null,
    tipoConta enum('Corrente','Poupança') default 'Corrente',
    agencia varchar(6) not null,
    conta varchar(10) not null,
    primary key (idFornecedor)
);

-- Criar tabela Estoque
create table estoque(
	idEstoque int not null unique auto_increment,
    CEPEstoque char(9) not null,
    ruaEstoque varchar(25) not null,
    numeroEstoque int not null,
    complementoEstoque varchar(10),
    bairroEstoque varchar(20) not null,
    cidadeEstoque varchar(20) not null,
    estadoEstoque char(2) not null,
    paísEstoque varchar(10) not null,
    primary key (idEstoque)
);

-- Criar tabela Produto
create table produto(
	idProduto int not null unique auto_increment,
    nomeProduto varchar(45) not null,
    categoria enum('Alimentos e Bebidas','Automotivo','Bebês','Beleza','Bolsas','Brinquedos','Casa','Celulares','Computadores','Cozinha','Livros') not null,
	avaliacao float default 10,
    dimensoes varchar(10),
    primary key (idProduto)
);

-- Criar tabela Pagamento
create table pagamento(
    idClientePag int not null,
    idPagamento int not null unique auto_increment,
    modalidade enum('Boleto','Cartão') not null,
	dados varchar(50) not null,
    primary key (idPagamento, idClientePag),
    foreign key (idClientePag) references cliente(idCliente) on update cascade
);

-- Criar tabela Pedido
create table pedido(
	idPedido int not null unique auto_increment,
    idClientePed int not null,
    idPagamentoPed int not null,
    statusPedido enum('Cancelado','Confirmado','Em Processamento') default 'Em Processamento',
    descricao varchar(255),
    frete decimal(4,2) default 0.00,
    primary key (idPedido, idClientePed, idPagamentoPed),
    foreign key (idClientePed) references pagamento(idCliente) on update cascade,
    foreign key (idPagamentoPed) references pagamento(id) on update cascade
);


