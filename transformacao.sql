--Algumas transformações foram feitas em planilhas para facilitar o input dos dados no banco. Porém o principal tratamento foi o aplicado na base_vacinas de modo a alterar sua estrutura para conter uma coluna com o indicativo do nome da vacina. Abaixo segue alguns dos tratamentos aplicados.
--input dos dados na tabela de coverage
INSERT INTO
    coverage (
        valor_cobertura,
        uf_id,
        vaccine_id,
        year
    )
SELECT
    CAST(
        REPLACE(valor_cobertura, ',', '.') AS NUMERIC
    ) AS valor_cobertura,
    uf_id,
    vaccine_id,
    year
FROM
    (
        ---------------------------------------
        -- 1) BCG
        SELECT
            CAST(b.bcg AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('BCG')
        WHERE
            b.bcg IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 2) Hepatite B idade <= 30 dias
        SELECT
            CAST(b."hepatite_b_idade_<=_30_dias" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Hepatite B idade <= 30 dias')
        WHERE
            b."hepatite_b_idade_<=_30_dias" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 3) Rotavírus Humano
        SELECT
            CAST(b.rotavirus_humano AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Rotavírus Humano')
        WHERE
            b.rotavirus_humano IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 4) Meningococo C
        SELECT
            CAST(b.meningococo_c AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Meningococo C')
        WHERE
            b.meningococo_c IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 5) Hepatite B
        SELECT
            CAST(b.hepatite_b AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Hepatite B')
        WHERE
            b.hepatite_b IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 6) Penta
        SELECT
            CAST(b.penta AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Penta')
        WHERE
            b.penta IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 7) Pneumocócica
        SELECT
            CAST(b.pneumococica AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Pneumocócica')
        WHERE
            b.pneumococica IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 8) Poliomielite
        SELECT
            CAST(b.poliomielite AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Poliomielite')
        WHERE
            b.poliomielite IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 9) Poliomielite 4 anos
        SELECT
            CAST(b.poliomielite_4_anos AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Poliomielite 4 anos')
        WHERE
            b.poliomielite_4_anos IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 10) Febre Amarela
        SELECT
            CAST(b.febre_amarela AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Febre Amarela')
        WHERE
            b.febre_amarela IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 11) Hepatite A
        SELECT
            CAST(b.hepatite_a AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Hepatite A')
        WHERE
            b.hepatite_a IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 12) Pneumocócica(1º ref)
        SELECT
            CAST(b."pneumococica(1º_ref)" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Pneumocócica(1º ref)')
        WHERE
            b."pneumococica(1º_ref)" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 13) Meningococo C (1º ref)
        SELECT
            CAST(b."meningococo_c_(1º_ref)" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Meningococo C (1º ref)')
        WHERE
            b."meningococo_c_(1º_ref)" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 14) Poliomielite(1º ref)
        SELECT
            CAST(b."poliomielite(1º_ref)" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Poliomielite(1º ref)')
        WHERE
            b."poliomielite(1º_ref)" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 15) Tríplice Viral D1
        SELECT
            CAST(b.triplice_viral__d1 AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Tríplice Viral D1')
        WHERE
            b.triplice_viral__d1 IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 16) Tríplice Viral D2
        SELECT
            CAST(b.triplice_viral__d2 AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Tríplice Viral D2')
        WHERE
            b.triplice_viral__d2 IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 17) Tetra Viral(SRC+VZ)
        SELECT
            CAST(b."tetra_viral(src+vz)" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Tetra Viral(SRC+VZ)')
        WHERE
            b."tetra_viral(src+vz)" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 18) DTP
        SELECT
            CAST(b.dtp AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('DTP')
        WHERE
            b.dtp IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 19) DTP REF (4 e 6 anos)
        SELECT
            CAST(b."dtp_ref_(4_e_6_anos)" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('DTP REF (4 e 6 anos)')
        WHERE
            b."dtp_ref_(4_e_6_anos)" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 20) Tríplice Bacte(DTP)(1º ref)
        SELECT
            CAST(b."triplice_bacte(dtp)(1º_ref)" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Tríplice Bacte(DTP)(1º ref)')
        WHERE
            b."triplice_bacte(dtp)(1º_ref)" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 21) Sarampo
        SELECT
            CAST(b.sarampo AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Sarampo')
        WHERE
            b.sarampo IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 22) Haemophilus influenzae b
        SELECT
            CAST(b.haemophilus_influenzae_b AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Haemophilus influenzae b')
        WHERE
            b.haemophilus_influenzae_b IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 23) Dupla adulto e dTpa gestante
        SELECT
            CAST(b.dupla_adulto_e_dtpa_gestante AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Dupla adulto e dTpa gestante')
        WHERE
            b.dupla_adulto_e_dtpa_gestante IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 24) dTpa gestante
        SELECT
            CAST(b.dtpa_gestante AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('dTpa gestante')
        WHERE
            b.dtpa_gestante IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 25) Tetravalente(DTP/Hib)(TETRA)
        SELECT
            CAST(b."tetravalente(dtp/hib)(tetra)" AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Tetravalente(DTP/Hib)(TETRA)')
        WHERE
            b."tetravalente(dtp/hib)(tetra)" IS NOT NULL
        UNION
        ALL ---------------------------------------
        -- 26) Varicela
        SELECT
            CAST(b.varicela AS VARCHAR) AS valor_cobertura,
            e.uf_id,
            v.vaccine_id,
            b.ano AS year
        FROM
            base_vacinas b
            JOIN estado e ON e.nome_estado = b.unidade_da_federacao
            JOIN YEAR y ON y.year = b.ano
            JOIN vaccine v ON LOWER(v.vaccine_name) = LOWER('Varicela')
        WHERE
            b.varicela IS NOT NULL
    ) AS subquery;

--input dos dados na tabela de presidentes
INSERT INTO
    president (president_name, party_id, year)
SELECT
    pdb.presidente,
    p.party_id,
    pdb.ano
FROM
    president_db AS pdb
    INNER JOIN party AS p ON lower(p.party_name) = lower(pdb.partido);