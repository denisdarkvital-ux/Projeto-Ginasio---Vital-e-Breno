CREATE TABLE socio (
    id_socio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nif CHAR(9) UNIQUE,
    telefone VARCHAR(15),
    gmail VARCHAR(100),
    data_inscricao DATE,
    ativo BOOLEAN DEFAULT TRUE
);


