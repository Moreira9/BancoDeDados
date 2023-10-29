use Biblioteca;
CREATE OR REPLACE VIEW vwlivros AS
SELECT
    Livros.id_livro AS id,
    Livros.titulo AS "titulo",
    GROUP_CONCAT(Autores.nome_autor) AS "autores",
    Livros.numero_pag AS "número de páginas",
    Livros.data_publicacao AS "data de publicação",
    Livros.estoque AS "estoque",
    GROUP_CONCAT(Generos.nome_genero) AS "gêneros"
FROM Livros
JOIN autores_has_livros ON autores_has_livros.livros_id_livro = Livros.id_livro
JOIN Autores ON autores_has_livros.autores_id_autores = Autores.id_autores
JOIN generos_has_livros ON generos_has_livros.livros_id_livros = Livros.id_livro
JOIN Generos ON generos_has_livros.generos_id_generos = Generos.id_generos
GROUP BY Livros.id_livro, Livros.titulo, Livros.numero_pag, Livros.data_publicacao, Livros.estoque;


DELIMITER $

CREATE  PROCEDURE InserirEmprestimo(
    IN data_retirada DATE,
    IN data_devolucao DATE,
    IN statuss VARCHAR(45),
    IN livros_id_livros INT
)
BEGIN
    INSERT INTO Emprestimos (data_retirada, data_devolucao, statuss, livros_id_livros)
    VALUES (data_retirada, data_devolucao, statuss, livros_id_livros);
END$

DELIMITER ;


DELIMITER //

CREATE FUNCTION EstoqueTotal(livro_id INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE estoque_total INT;

    
    SELECT estoque INTO estoque_total FROM Livros WHERE id_livro = livro_id;

    RETURN estoque_total -(
    SELECT COUNT(*) FROM Emprestimos WHERE livros_id_livros in (livro_id)
);
END //

DELIMITER ;








