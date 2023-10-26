drop database if exists Biblioteca;
create database Biblioteca;
use Biblioteca;

create table Generos(
	id_generos int primary key auto_increment,
    nome_genero varchar(45)
);

create table Autores(
	id_autores int primary key auto_increment,
    nome_autor varchar(60),
    nacionalidade_autor varchar(45),
    data_nasc date,
    profissao varchar(45)

);

create table Usuarios(
	id_usuario int primary key auto_increment,
    nome varchar(45),
    cpf varchar(11),
    cep varchar(8),
    numero_residencial int,
    numero_tel varchar(45)

);

create table Emprestimos(
	id_emprestimo int primary key auto_increment,
    data_retirada date,
    data_devolucao date,
    statuss varchar(45)

);

create table usuarios_has_emprestimos(
	usuarios_id_usuario int,
    emprestimos_id_emprestimo int,
	
    foreign key (usuarios_id_usuario) references Usuarios(id_usuario),
    foreign key (emprestimos_id_emprestimo) references Emprestimos(id_emprestimo)
    
    
);

create table Livros(
	id_livro int primary key auto_increment,
    titulo varchar(45),
    numero_pag int,
    estoque int,
    data_publicacao date,
    emprestimos_id_emprestimo int,
    
    foreign key (emprestimos_id_emprestimo) references Emprestimos(id_emprestimo)
    

);

create table autores_has_livros(
	autores_id_autores int,
    livros_id_livro int,
    
    foreign key (autores_id_autores) references Autores(id_autores),
    foreign key (livros_id_livro) references Livros(id_livro)

);

