CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_contrato DATE
);


CREATE TABLE aulas (
    id_aula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    horario TIME,
    capacidade INT,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
        ON UPDATE CASCADE ON DELETE SET NULL
);
-

CREATE TABLE inscricao (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    id_socio INT NOT NULL,
    id_aula INT NOT NULL,
    data_inscricao DATE,
    FOREIGN KEY (id_socio) REFERENCES socio(id_socio)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_aula) REFERENCES aulas(id_aula)
        ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(6,2),
    stock INT DEFAULT 0
);


CREATE TABLE checkin (
    id_checkin INT AUTO_INCREMENT PRIMARY KEY,
    id_socio INT NOT NULL,
    data_entrada DATETIME,
    data_saida DATETIME,
    FOREIGN KEY (id_socio) REFERENCES socio(id_socio)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE presenca (
    id_presenca INT AUTO_INCREMENT PRIMARY KEY,
    id_aula INT NOT NULL,
    id_socio INT NOT NULL,
    id_professor INT NOT NULL,
    data_aula DATE NOT NULL,
    presente BOOLEAN DEFAULT TRUE,
    observacoes VARCHAR(255),
    FOREIGN KEY (id_aula) REFERENCES aulas(id_aula)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_socio) REFERENCES socio(id_socio)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
        ON UPDATE CASCADE ON DELETE CASCADE
);