UPDATE EVOLUCAO
SET nivel_dor = 4,
    anotacoes_fisioterapeuta = 'Redução da dor após ajuste na técnica.'
WHERE sessao_ID = 1;




UPDATE TECNICA
SET custo_padrao = custo_padrao * 1.10
WHERE nome_tecnica = 'Massagem Terapêutica';




UPDATE SESSAO
SET status = 'Agendada',
    data_sessao = '2025-01-24'
WHERE status = 'Cancelada' AND plano_ID = 2;




INSERT INTO SALA (nome_sala, capacidade_maxima) VALUES ('Sala C - Vazia', 1);
DELETE FROM SALA WHERE nome_sala = 'Sala C - Vazia';




DELETE FROM PLANO_TECNICA WHERE plano_ID = 1 AND tecnica_ID = 2; 




DELETE FROM PACIENTE WHERE paciente_ID = 1; --Esse comando da erro, mostrando que a FK fuciona




DELETE FROM SESSAO WHERE sessao_ID = 1;