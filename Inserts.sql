use Biblioteca;    
INSERT INTO Generos (id_generos, nome_genero)
VALUES
    (1 , 'Ação'),
    (2 , 'Comédia'),
    (3 , 'Terror'),
    (4 , 'Ficção Científica'),
    (5 , 'Romance'),
    (6 , 'Aventura'),
    (7 , 'Terror'),
    (8, 'Fantasia'),
    (9, 'Drama');
    
INSERT INTO Usuarios (id_usuario, nome, cpf, cep, numero_residencial, numero_tel)
VALUES
    (1 , 'João de Oliveira', '42345678901', '12345678', 123, '987654321'),
    (2 , 'Maria Clara', '43456789012', '13456789', 234, '976543210'),
    (3 , 'Pedro Henrique', '44567890123', '14567890', 345, '965432109'),
    (4 , 'Ana Carolina', '45678901234', '15678901', 456, '954321098'),
    (5, 'Luísa Medeiros', '46789012345', '16789012', 567, '943210987');
    
INSERT INTO emprestimos (id_emprestimo, data_retirada, data_devolucao, statuss, livros_id_livros)
VALUES
    (1, '2023-10-27', '2023-11-27', "Esta no prazo",1),
    (2,'2023-09-30','2023-10-30',"Esta no prazo ",1),
    (3,'2023-08-11','2023-09-11',"Atrazado",2),
    (4, '2023-09-12', '2023-10-12', "Atrazado",2),
    (5, '2023-9-27', '2023-10-27', "Dia da entrega",3),
    (6,'2023-10-03','2023-11-03',"Esta no prazo",3),
    (7,'2023-08-11','2023-09-11',"Atrazado",4),
    (8, '2023-07-15', '2023-8-15', "Atrazado",4),
    (9, '2023-10-02', '2023-11-02', "Esta no prazo",5),
    (10,'2023-6-30','2023-7-30',"Atrazado",5);
INSERT INTO Autores (id_autores, nome_autor, nacionalidade_autor, data_nasc, profissao)
VALUES
    (1, 'Lewis Carroll', 'Inglês', '1832-01-27', 'Escritor'),
    (2, 'J.R.R. Tolkien', 'Inglês', '1892-01-03', 'Escritor'),
    (3, 'Miguel de Cervantes', 'Espanhol', '1547-09-29', 'Escritor' ),
    (4, 'George Orwell', 'Inglês', '1903-06-25', 'Escritor' ),
    (5, 'Jane Austen', 'Inglês', '1775-12-16', 'Escritora');
INSERT INTO Livros (id_livro, titulo, numero_pag, estoque, data_publicacao)
VALUES
    (1 , 'Aventuras de Alice no País das Maravilhas', 100, 5, '1865-11-26'),
    (2 ,  'O Senhor dos Anéis', 1178, 30, '1954-07-29'),
    (3 , 'Dom Quixote', 863, 60, '1605-01-16'),
    (4 , '1984', 328, 40, '1949-06-08'),
    (5 , 'Orgulho e Preconceito', 432, 70, '1813-01-28');
INSERT INTO usuarios_has_emprestimos (usuarios_id_usuario,emprestimos_id_emprestimo)
VALUES
    (1,1),
    (1,2),
    (1,3),
    (1,4),
    (2,5),
	(2,6),
    (3,7),
    (3,8),
    (4,9),
    (5,10);
   
    
    INSERT INTO autores_has_livros (autores_id_autores, livros_id_livro)
VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);

   INSERT INTO generos_has_livros (livros_id_livros, generos_id_generos)
VALUES
    (2,8),
    (2,6),
    (1,8),
    (1,6),
    (1,9),
    (3,6),
    (3,9),
    (4,4),
    (4,9),
    (4,4),
    (5,9),
    (5,5);

    
    