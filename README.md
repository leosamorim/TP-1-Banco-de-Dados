# Introdução a Banco de Dados

### Objetivo
O presente trabalho tem como objetivo promover o acesso, a coleta, o  gerenciamento, a integração e a análise de conjuntos de dados públicos para a matéria de Introdução a Banco de Dados (IBD) do Departamento de Ciência da Computação (DCC) da Universidade Federal de Minas Gerais (UFMG). Para isso, duas bases de dados públicas serão integradas, de forma que o trabalho agregue valor se comparado à consulta das fontes de maneira individual.

### Descrição do problema
Neste trabalho, iremos avaliar a cobertura vacinal (indicador que mede a percentagem da população que recebeu uma vacina na idade e tempo recomendados) no Brasil entre 1999 e 2022 em função dos partidos no poder nos governos estaduais e federais. Com isso, pretendemos entender melhor a relação entre a cobertura vacinal e o contexto político partidário nas regiões/estados brasileiros. As principais visões são:
Variação da cobertura vacinal geral por estado e por partido. 
Variação da cobertura vacinal por tipo de vacina, por estado e por partido.
Variação nacional da cobertura vacinal por partido.
Variação nacional da cobertura vacinal por vacina e por partido.


Neste trabalho, não analisamos os impactos de nenhum surto de doenças e a sua relação com o aumento/redução da cobertura vacinal. Além disso, faz-se necessário esclarecer que o intuito deste trabalho é apenas reportar os fatos e analisar os resultados, não há defesa de nenhum partido político, o trabalho é apartidário. 

### Fontes de dados
As fontes de dados utilizadas são ambas públicas, provenientes do Departamento de Informação e Informática do Sistema Único de Saúde (DATASUS) e do Tribunal Superior Eleitoral (TSE), onde é possível encontrar informações sobre a cobertura vacinal e os partidos no poder, respectivamente.

### Descrição dos dados
Abaixo está uma breve descrição da estrutura dos dados:
1. **DATASUS**: como principais atributos, possui: 
- Unidade federativa. 
- Ano. 
- Tipo de vacina.  
- Cobertura vacinal (em porcentagem).
2. **TSE**: os atributos são:
- Unidade Federativa.
- Nome do governante.
- Partido.
- Ano.

Para os dados da cobertura vacinal, foram avaliadas  24 tipos de vacinas diferentes, para um conjunto de 648 amostras e 27 unidades federativas. Ao passo que, para os dados do TSE, há 19 partidos para análise no período em questão e 652 amostras.
Além desses dados, criamos uma tabela que contém informações de cada presidente do Brasil de 1999 a 2022, com o intuito de melhorar a nossa análise. Essa tabela tem o nome do presidente, os anos em que ele permaneceu no poder e o partido ao qual pertenceu.  
Vale ressaltar que a cobertura vacinal é expressa em porcentagem e, em alguns casos, pode ser superior a 100%. Tal  fato ocorre devido a um ou mais dos seguintes fatores: problemas com as estimativas populacionais, erros ou duplicações nos registros, vacinação fora do grupo alvo (vacinação em grupos não incluídos na população-alvo oficial), campanhas e intensificações de vacinação (estados podem vacinar mais pessoas do que o esperado para compensar atrasos ou atingir populações que não foram contabilizadas corretamente), e cálculos acumulados (cobertura acumulada ao longo de anos, dados históricos não atualizados).
