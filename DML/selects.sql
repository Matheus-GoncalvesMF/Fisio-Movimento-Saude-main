SELECT
    P.nome AS Paciente,
    PL.data_inicio AS Inicio_Plano,
    PL.num_total_sessoes AS Total_Sessoes,
    F.nome AS Fisioterapeuta_Responsavel
FROM PACIENTE P
JOIN PLANO_TRATAMENTO PL ON P.paciente_ID = PL.paciente_ID
JOIN FISIOTERAPEUTA F ON PL.fisio_CREFITO = F.fisio_CREFITO
ORDER BY 1;





SELECT
    S.data_sessao,
    S.hora_inicio,
    SA.nome_sala,
    P.nome AS Paciente
FROM SESSAO S
JOIN SALA SA ON S.sala_ID = SA.sala_ID
JOIN PLANO_TRATAMENTO PL ON S.plano_ID = PL.plano_ID
JOIN PACIENTE P ON PL.paciente_ID = P.paciente_ID
WHERE S.status = 'Agendada' AND S.data_sessao >= CURRENT_DATE
ORDER BY 1,2
LIMIT 5;





SELECT
    F.nome AS Fisioterapeuta,
    COUNT(S.sessao_ID) AS Sessoes_Realizadas
FROM FISIOTERAPEUTA F
JOIN PLANO_TRATAMENTO PL ON F.fisio_CREFITO = PL.fisio_CREFITO
JOIN SESSAO S ON PL.plano_ID = S.plano_ID
WHERE S.status = 'Realizada'
GROUP BY 1
ORDER BY Sessoes_Realizadas DESC;






SELECT
    PL.plano_ID,
    T.nome_tecnica,
    T.custo_padrao
FROM PLANO_TRATAMENTO PL
JOIN PLANO_TECNICA PT ON PL.plano_ID = PT.plano_ID
JOIN TECNICA T ON PT.tecnica_ID = T.tecnica_ID
WHERE PL.plano_ID = 1; 