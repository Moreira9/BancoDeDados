use Biblioteca;
CREATE OR REPLACE VIEW DetalhesEmprestimos AS
SELECT
    E.id_emprestimo AS 'ID do Empréstimo',
    L.titulo AS 'Título do Livro',
    MAX(A.nome_autor) AS 'Nome do Autor',
    GROUP_CONCAT(G.nome_genero) AS 'Gêneros',
    ANY_VALUE(U.nome) AS 'Nome do Leitor', -- Utilize ANY_VALUE para a coluna de não agregação
    MAX(E.data_retirada) AS 'Data de Retirada',
    MAX(E.data_devolucao) AS 'Data de Devolução',
    MAX(E.statuss) AS 'Status do Empréstimo'
FROM Emprestimos AS E
JOIN Livros AS L ON E.livros_id_livros = L.id_livro
JOIN autores_has_livros AS AHL ON L.id_livro = AHL.livros_id_livro
JOIN Autores AS A ON AHL.autores_id_autores = A.id_autores
JOIN generos_has_livros AS GL ON L.id_livro = GL.livros_id_livros
JOIN Generos AS G ON GL.generos_id_generos = G.id_generos
JOIN usuarios_has_emprestimos AS UE ON E.id_emprestimo = UE.emprestimos_id_emprestimo
JOIN Usuarios AS U ON UE.usuarios_id_usuario = U.id_usuario
GROUP BY E.id_emprestimo, L.titulo;


DELIMITER //

CREATE PROCEDURE CriarEmprestimo(
    IN emprestimo_id INT ,
    IN data_retirada DATE,
    IN data_devolucao DATE,
    IN status_emprestimo VARCHAR(45),
    IN livro_id INT,
    IN usuario_id INT
)
BEGIN
    -- Inserir o registro na tabela emprestimos
    INSERT INTO emprestimos (id_emprestimo, data_retirada, data_devolucao, statuss, livros_id_livros)
    VALUES (emprestimo_id, data_retirada, data_devolucao, status_emprestimo, livro_id);

    -- Inserir o registro na tabela usuarios_has_emprestimos
    INSERT INTO usuarios_has_emprestimos (usuarios_id_usuario, emprestimos_id_emprestimo)
    VALUES (usuario_id, emprestimo_id);
END //

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








