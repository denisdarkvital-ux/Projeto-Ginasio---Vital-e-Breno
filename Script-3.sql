CREATE ROLE admingym;
CREATE ROLE professorgym;
CREATE ROLE rececionistagym;

CREATE USER admin WITH PASSWORD 'adminpass';
CREATE USER prof1 WITH PASSWORD 'prof123';
CREATE USER rececionista WITH PASSWORD 'recep12345';


GRANT admingym TO admin;
GRANT professorgym TO prof1;
GRANT rececionistagym TO rececionista;


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admingym;


GRANT SELECT ON aulas, inscricao, socio TO professorgym;


GRANT SELECT, INSERT ON socio, venda, venda_detalhe TO rececionistagym;


REVOKE DELETE ON socio FROM rececionistagym;
REVOKE UPDATE ON socio FROM professorgym;



SELECT nome, categoria, preco
FROM produto
ORDER BY preco DESC;

SELECT s.nome AS socio, a.nome AS aula, i.data_inscricao
FROM inscricao i
INNER JOIN socio s ON i.id_socio = s.id_socio
INNER JOIN aulas a ON i.id_aula = a.id_aula
ORDER BY i.data_inscricao;

SELECT nome, gmail
FROM socio
WHERE gmail LIKE '%gmail.com';

SELECT a.nome AS aula, COUNT(i.id_socio) AS total_inscritos
FROM inscricao i
JOIN aulas a ON i.id_aula = a.id_aula
GROUP BY a.nome
ORDER BY total_inscritos DESC;

SELECT COUNT(*) AS total_ativos
FROM socio
WHERE ativo = TRUE;

SELECT nome, preco
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto);

SELECT s.nome AS socio, SUM(d.subtotal) AS total_gasto
FROM venda v
JOIN venda_detalhes d ON v.id_venda = d.id_venda
JOIN socio s ON v.id_socio = s.id_socio
GROUP BY s.nome
ORDER BY total_gasto DESC;


SELECT 
    COUNT(*) AS total_itens_vendidos,
    SUM(d.quantidade) AS quantidade_total,
    AVG(d.preco_unitario) AS preco_medio,
    MAX(d.preco_unitario) AS produto_mais_caro,
    MIN(d.preco_unitario) AS produto_mais_barato
FROM venda_detalhes d;

SELECT nome, preco
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto)
ORDER BY preco DESC;

SELECT 
    s.nome AS socio,
    v.id_venda,
    v.data_venda,
    p.nome AS produto,
    d.quantidade,
    d.preco_unitario,
    (d.quantidade * d.preco_unitario) AS subtotal
FROM venda v
JOIN socio s ON v.id_socio = s.id_socio
JOIN venda_detalhes d ON v.id_venda = d.id_venda
JOIN produto p ON d.id_produto = p.id_produto
WHERE s.ativo = TRUE
ORDER BY v.data_venda DESC;


