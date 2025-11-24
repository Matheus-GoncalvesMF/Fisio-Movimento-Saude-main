INSERT INTO FISIOTERAPEUTA (fisio_CREFITO, nome, telefone, especialidade) VALUES
('CREFITO-12345', 'Dr. Pedro Alvares', '991234567', 'Ortopedia'),
('CREFITO-67890', 'Dra. Camila Santos', '998765432', 'Respiratória');

INSERT INTO SALA (nome_sala, capacidade_maxima) VALUES
('Sala A - Eletroterapia', 3),
('Sala B - Cinesioterapia', 5);

INSERT INTO PACIENTE (nome, cpf, data_nascimento, telefone, rua, numero, bairro, cidade, estado, cep) VALUES
('Maria Silva', '111.222.333-44', '1985-05-15', '991112233', 'Rua das Flores', '10', 'Centro', 'Lavras', 'MG', '37200-000'),
('João Souza', '555.666.777-88', '2000-11-20', '994445566', 'Av. Brasil', '1500', 'Vila Nova', 'Varginha', 'MG', '37000-000');

INSERT INTO PLANO_TRATAMENTO (data_inicio, num_total_sessoes, paciente_ID, fisio_CREFITO) VALUES
('2025-01-10', 12, 1, 'CREFITO-12345'), 
('2025-01-15', 8, 2, 'CREFITO-67890'); 

INSERT INTO TECNICA (nome_tecnica, custo_padrao) VALUES
('Massagem Terapêutica', 70.00),
('Eletroterapia', 50.00),
('Cinesioterapia', 60.00);

INSERT INTO PLANO_TECNICA (plano_ID, tecnica_ID) VALUES
(1, 1),
(1, 2), 
(2, 3); 

INSERT INTO SESSAO (data_sessao, hora_inicio, status, plano_ID, sala_ID) VALUES
('2025-01-10', '14:00:00', 'Realizada', 1, 1),
('2025-01-15', '10:00:00', 'Realizada', 2, 2),
('2025-12-17', '14:00:00', 'Agendada', 1, 1),
('2025-01-22', '10:00:00', 'Cancelada', 2, 2);

INSERT INTO EVOLUCAO (data_registro, anotacoes_fisioterapeuta, nivel_dor, sessao_ID, evolucao_ID) VALUES
('2025-01-10 15:00:00', 'Paciente estável, dor 5/10.', 5, 1, 1),
('2025-01-15 11:00:00', 'Boa evolução, dor 3/10.', 3, 2, 2);