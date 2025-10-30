
INSERT INTO socio (nome, data_nascimento, nif, telefone, gmail, data_inscricao, ativo) VALUES
('Ana Almeida', '1990-05-12', '123456789', '912345678', 'ana@gmail.com', '2024-02-01', TRUE),
('Pedro Tomas', '1987-03-25', '234567890', '913456789', 'pedro @gmail.com', '2023-03-15', TRUE),
('Ricardo Lopes', '1995-09-10', '345678901', '914567890', 'ricardo@gmail.com', '2025-04-10', TRUE),
('Sofia Costa', '1992-01-08', '456789012', '915678901', 'sofia.costa@gmail.com', '2023-05-20', TRUE),
('Tiago Tomas', '1998-06-14', '567890123', '916789012', 'tiago@gmail.com', '2021-06-05', TRUE),
('Carlos Silva', '1991-11-02', '678901234', '917890123', 'carlos@gmail.com', '2020-07-12', TRUE),
('Bogadn Paliy', '1989-08-30', '789012345', '918901234', 'bogdan@gmail.com', '2021-08-01', TRUE),
('Ines Marques', '1994-04-16', '890123456', '919012345', 'ines@gmail.com', '2022-09-10', TRUE),
('Pedro', '1993-07-19', '901234567', '911123456', 'pedro@gmail.com', '2023-10-22', TRUE),
('Marta', '1997-12-03', '912345678', '912234567', 'marta@gmail.com', '2021-11-15', TRUE);


INSERT INTO professores (nome, especialidade, telefone, email, data_contrato) VALUES
('Ana Almeida', 'Pilates', '931111111', 'ana.almeida@ginasio.com', '2022-02-10'),
('Carlos Eduardo', 'Musculação', '932222222', 'carloseduardo@ginasio.com', '2022-05-01'),
('Emanuel Marques', 'Zumba', '933333333', 'emanuel@ginasio.com', '2023-01-15'),
('Duarte Carvalho', 'CrossFit', '934444444', 'duarte@ginasio.com', '2023-03-20'),
('Luis Araujo', 'Yoga', '935555555', 'luis@ginasio.com', '2022-10-05'),
('Joao Silva', 'Spinning', '936666666', 'joao@ginasio.com', '2023-04-11'),
('Dinis Silva', 'Natação', '937777777', 'dinis@ginasio.com', '2022-11-25'),
('Bogdan Paliy', 'Body Pump', '938888888', 'bogdan@ginasio.com', '2023-02-08'),
('Gabriel Canteiro', 'Dança', '939999999', 'gabi@ginasio.com', '2023-01-03'),
('Dinis Vital', 'Alongamentos', '930000000', 'vital@ginasio.com', '2023-05-18');


INSERT INTO aulas (nome, descricao, horario, capacidade, id_professor) VALUES
('Pilates', 'Aula de alongamento e postura', '09:00', 15, 1),
('Musculação', 'Treino de força e resistência', '10:30', 20, 2),
('Zumba', 'Aula de dança e cardio', '18:00', 25, 3),
('CrossFit', 'Treino funcional intenso', '19:00', 15, 4),
('Yoga', 'Relaxamento e equilíbrio', '08:00', 12, 5),
('Spinning', 'Treino cardiovascular com bicicletas', '17:00', 20, 6),
('Natação', 'Treino intervalado de alta intensidade', '19:30', 15, 7),
('Body Pump', 'Aula de musculação em grupo', '12:30', 18, 8),
('Dança', 'Aulas coreografadas com ritmo', '20:00', 25, 9),
('Alongamentos', 'Flexibilidade e prevenção de lesões', '07:30', 10, 10);


INSERT INTO inscricao (id_socio, id_aula, data_inscricao) VALUES
(1, 2, '2025-05-01'),
(2, 5, '2025-05-02'),
(3, 3, '2025-06-10'),
(4, 4, '2025-06-12'),
(5, 1, '2025-07-01'),
(6, 7, '2025-07-05'),
(7, 8, '2025-07-10'),
(8, 9, '2025-08-01'),
(9, 6, '2025-08-15'),
(10, 10, '2025-09-01');




INSERT INTO produto (nome, categoria, preco, stock) VALUES
('Barra Proteica', 'Nutrição', 2.50, 100),
('Água 500ml', 'Bebidas', 1.00, 200),
('T-shirt Ginásio', 'Vestuário', 15.00, 50),
('Toalha Microfibra', 'Acessórios', 8.00, 40),
('Shake Whey 750g', 'Suplementos', 25.00, 30),
('Luvas de Treino', 'Acessórios', 12.00, 25),
('Tapete de Yoga', 'Acessórios', 18.00, 15),
('Garrafa 1L', 'Bebidas', 5.00, 60),
('Calças Desportivas', 'Vestuário', 20.00, 25),
('Barra Energética', 'Nutrição', 3.00, 90);

INSERT INTO checkin (id_socio, data_entrada, data_saida) VALUES
(1, '2025-05-10 09:00:00', '2025-05-10 10:30:00'),
(2, '2025-06-05 18:00:00', '2025-06-05 19:00:00'),
(3, '2025-06-12 19:00:00', '2025-06-12 20:30:00'),
(4, '2025-06-18 08:30:00', '2025-06-18 10:00:00'),
(5, '2025-07-02 17:00:00', '2025-07-02 18:30:00'),
(6, '2025-07-15 09:30:00', '2025-07-15 10:30:00'),
(7, '2025-08-01 19:00:00', '2025-08-01 20:00:00'),
(8, '2025-08-10 18:30:00', '2025-08-10 19:30:00'),
(9, '2025-08-15 07:30:00', '2025-08-15 09:00:00'),
(10, '2025-09-05 12:00:00', '2025-09-05 13:30:00');



CREATE TABLE venda (
    id_venda SERIAL PRIMARY KEY,
    id_socio INT NOT NULL,
    total NUMERIC(10,2),
    FOREIGN KEY (id_socio) REFERENCES socio(id)
);

CREATE TABLE venda_detalhes (
    id_detalhe SERIAL PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(10,2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);


INSERT INTO venda (id_socio, data_venda, total) VALUES
(1, '2025-09-10 14:30:00', 6.00),   
(3, '2025-09-12 10:45:00', 33.00),  
(5, '2025-09-15 16:00:00', 14.00),
(8, '2025-09-20 11:30:00', 20.00), 
(10, '2025-09-25 17:15:00', 26.00); 

INSERT INTO venda_detalhes (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 2, 2, 1.00),        
(1, 4, 2, 8.00),        
(2, 5, 1, 25.00),       
(2, 3, 2, 10.00),      
(3, 1, 3, 2.00),      
(4, 7, 1, 18.00),      
(4, 8, 1, 5.00),        
(4, 1, 2, 2.25),       
(5, 9, 1, 20.00),      
(5, 2, 8, 1.00);     


