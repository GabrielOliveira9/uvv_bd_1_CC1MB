/* Com esse script serão preenchidos os dados das tabelas */

/* Preenchimento da tabela FUNCIONARIO nas colunas: cpf, primeiro nome, nome do meio, último nome, data de nascimento, endereco, sexo, salario e número do departamento. Por conta do relacionamento da coluna CPF do supervisor com a coluna CPF na mesma tabela, a primeira só pode ser preenchida após a segunda.*/

INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('12345678966','João','B','Silva',TIMESTAMP '1965-01-09 00:00:00.000000','R.das Flores,751,São Paulo,SP','M',30000,5);
INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('33344555587','Fernando','T','Wong',TIMESTAMP '1955-12-08 00:00:00.000000','Rua da Lapa,34,São Paulo,SP','M',40000,5);
INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('99988777767','Alice','J','Zelaya',TIMESTAMP '1968-01-19 00:00:00.000000','Rua Souza Lima,35,Curitiba,PR','F',25000,4);
INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('98765432168','Jennifer','S','Souza',TIMESTAMP '1941-06-20 00:00:00.000000','Av.Arthur Lima,54,St.André,SP','F',43000,4);
INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('66688444476','Ronaldo','K','Lima',TIMESTAMP '1962-09-15 00:00:00.000000','Rua Rebouças,65,Piracicaba,SP','M',38000,5);
INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('45345345376','Joice','A','Leite',TIMESTAMP '1972-07-31 00:00:00.000000','Av.Lucas Obes,74,São Paulo,SP','F',25000,5);
INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('98798798733','André','V','Pereira',TIMESTAMP '1969-03-19 00:00:00.000000','Rua Timbira,35,SãoPaulo,SP','M',25000,4);
INSERT INTO "C##UVV".FUNCIONARIO (CPF,PRIMEIRO_NOME,NOME_MEIO,ULTIMO_NOME,DATA_NASCIMENTO,ENDERECO,SEXO,SALARIO,NUMERO_DEPARTAMENTO)
	VALUES ('88866555576','Jorge','E','Brito',TIMESTAMP '1937-11-10 00:00:00.000000','Rua do Horto,35,São Paulo,SP','M',55000,1);


/* Agora a coluna CPF do supervisor será preenchida*/

UPDATE C##uvv.funcionario
	SET cpf_supervisor='33344555587'
	WHERE cpf='12345678966';
UPDATE C##uvv.funcionario
	SET cpf_supervisor='88866555576'
	WHERE cpf='33344555587';
UPDATE C##uvv.funcionario
	SET cpf_supervisor='98765432168'
	WHERE cpf='99988777767';
UPDATE C##uvv.funcionario
	SET cpf_supervisor='88866555576'
	WHERE cpf='98765432168';
UPDATE C##uvv.funcionario
	SET cpf_supervisor='33344555587'
	WHERE cpf='66688444476';
UPDATE C##uvv.funcionario
	SET cpf_supervisor='33344555587'
	WHERE cpf='45345345376';
UPDATE C##uvv.funcionario
	SET cpf_supervisor='98765432168'
	WHERE cpf='98798798733';

/*Preenhcimento da tabela DEPARTAMENTO*/

INSERT INTO C##uvv.departamento (numero_departamento,nome_departamento,cpf_gerente,data_inicio_gerente)
	VALUES (5,'Pesquisa','33344555587','22-may-1988');
INSERT INTO C##uvv.departamento (numero_departamento,nome_departamento,cpf_gerente,data_inicio_gerente)
	VALUES (4,'Administração','98765432168','01-january-1995');
INSERT INTO C##uvv.departamento (numero_departamento,nome_departamento,cpf_gerente,data_inicio_gerente)
	VALUES (1,'Matriz','88866555576','19-june-1981');

/*Preenchimento da tabela LOCALIZAÇÕES DO DEPARTAMENTO*/

INSERT INTO C##uvv.localizacoes_departamento (numero_departamento,"local")
	VALUES (1,'São Paulo');
INSERT INTO C##uvv.localizacoes_departamento (numero_departamento,"local")
	VALUES (4,'Mauá');
INSERT INTO C##uvv.localizacoes_departamento (numero_departamento,"local")
	VALUES (5,'Santo André');
INSERT INTO C##uvv.localizacoes_departamento (numero_departamento,"local")
	VALUES (5,'Itu');
INSERT INTO C##uvv.localizacoes_departamento (numero_departamento,"local")
	VALUES (5,'São Paulo');

/*Preenchimento da tabela PROJETO*/

INSERT INTO C##uvv.projeto (numero_projeto,nome_projeto,local_projeto,numero_departamento)
	VALUES (1,'ProdutoX','Santo André',5);
INSERT INTO C##uvv.projeto (numero_projeto,nome_projeto,local_projeto,numero_departamento)
	VALUES (2,'ProdutoY','Itu',5);
INSERT INTO C##uvv.projeto (numero_projeto,nome_projeto,local_projeto,numero_departamento)
	VALUES (3,'ProdutoZ','São Paulo',5);
INSERT INTO C##uvv.projeto (numero_projeto,nome_projeto,local_projeto,numero_departamento)
	VALUES (10,'Informatização','Mauá',4);
INSERT INTO C##uvv.projeto (numero_projeto,nome_projeto,local_projeto,numero_departamento)
	VALUES (20,'Reorganização','São Paulo',1);
INSERT INTO C##uvv.projeto (numero_projeto,nome_projeto,local_projeto,numero_departamento)
	VALUES (30,'Novosbeneficios','Mauá',4);

/*Preenchimento da tabela DEPENDENTE*/

INSERT INTO C##uvv.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco)
	VALUES ('33344555587','Alicia','F','05-april-1986','Filha');
INSERT INTO C##uvv.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco)
	VALUES ('33344555587','Tiago','M','25-october-1983','Filho');
INSERT INTO C##uvv.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco)
	VALUES ('33344555587','Janaína','F','03-may-1958','Esposa');
INSERT INTO C##uvv.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco)
	VALUES ('98765432168','Antonio','M','28-february-1942','Marido');
INSERT INTO C##uvv.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco)
	VALUES ('12345678966','Michael','M','04-january-1988','FIlho');
INSERT INTO C##uvv.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco)
	VALUES ('12345678966','Alicia','F','30-december-1988','Filha');
INSERT INTO C##uvv.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco)
	VALUES ('12345678966','Elizabeth','F','05-may-1967','Esposa');

/* Preenchimento da tabela TRABALHA EM*/

INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('12345678966',1,32.5);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('12345678966',2,7.5);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('66688444476',3,40);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('45345345376',1,20);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('45345345376',2,20);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('33344555587',2,10);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('33344555587',3,10);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('33344555587',10,10);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('33344555587',20,10);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('99988777767',30,30);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('99988777767',10,10);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('98798798733',10,35);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('98798798733',30,5);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('98765432168',30,20);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto,horas)
	VALUES ('98765432168',20,15.0);
INSERT INTO C##uvv.trabalha_em (cpf_funcionario,numero_projeto)
	VALUES ('88866555576',20);








