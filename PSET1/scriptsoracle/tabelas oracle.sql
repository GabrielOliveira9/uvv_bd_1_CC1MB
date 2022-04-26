/* Aqui as tabelas "funcionario", "dependente" e "departamento" serão criadas, com suas respectivas colunas e chaves primárias (cpf, cpf_funcionario e nome dependente, numero_departamento)*/

/* As alterações nas restrições NOT NULL das tabelas FUNCIONARIO e TRABALHA EM que impediam o preenchimento de acordo com as imagens do documento ou de forma geral foram feitas durante a criação desse script. Portanto não há comentários nas colunas que foram modificadas (funcionario.cpf_supervisor e trabalha_em.horas)*/

CREATE TABLE C##uvv.funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR2(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR2(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR2(30),
                sexo CHAR(1),
                salario NUMBER(10,2),
                cpf_supervisor CHAR(11),
                numero_departamento NUMBER NOT NULL,
                CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (cpf)
);


CREATE TABLE C##uvv.dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR2(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR2(15),
                CONSTRAINT DEPENDENTE_PK PRIMARY KEY (cpf_funcionario, nome_dependente)
);


CREATE TABLE C##uvv.departamento (
                numero_departamento NUMBER NOT NULL,
                nome_departamento VARCHAR2(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY (numero_departamento)
);

/* para criar o índice da chave alternativa da tabela "departamento" (nome_departamento)*/

CREATE UNIQUE INDEX C##uvv.departamento_ak
 ON C##uvv.departamento
 ( nome_departamento );

/* Criar a tabela "projeto", suas colunas e chave primária (numero_projeto) */

CREATE TABLE C##uvv.projeto (
                numero_projeto NUMBER NOT NULL,
                nome_projeto VARCHAR2(15) NOT NULL,
                local_projeto VARCHAR2(15),
                numero_departamento NUMBER NOT NULL,
                CONSTRAINT PROJETO_PK PRIMARY KEY (numero_projeto)
);

/* Criar o índice da chave alternativa da tabela "projeto" (nome_projeto)*/

CREATE UNIQUE INDEX C##uvv.projeto_ak
 ON C##uvv.projeto
 ( nome_projeto );

/* Para criar as tabelas "trabalha em" e "localizacoes departamento", suas colunas e respectivas chaves primárias (cpf_funcionario e numero_projeto, numero_departamento e local)*/

CREATE TABLE C##uvv.trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto NUMBER NOT NULL,
                horas NUMBER(3,1),
                CONSTRAINT TRABALHA_EM_PK PRIMARY KEY (cpf_funcionario, numero_projeto)
);


CREATE TABLE C##uvv.localizacoes_departamento (
                numero_departamento NUMBER NOT NULL,
                local VARCHAR2(15) NOT NULL,
                CONSTRAINT LOCALIZACOES_DEPARTAMENTO_PK PRIMARY KEY (numero_departamento, local)
);

/* Aqui serão criados os relacionamentos entre as tabelas*/

/*Primeiro, a chave estrangeira da tabela "departamento" é "cpf_gerente", referenciando "cpf" da tabela funcionario*/

ALTER TABLE C##uvv.departamento ADD CONSTRAINT FUNCIONARIO_DEPARTAMENTO_FK
FOREIGN KEY (cpf_gerente)
REFERENCES C##uvv.funcionario (cpf)
NOT DEFERRABLE;

/*Chave estrangeira da tabela "trabalha_em" é "cpf_funcionario", também referenciando "cpf" da tabela funcionario*/

ALTER TABLE C##uvv.trabalha_em ADD CONSTRAINT FUNCIONARIO_TRABALHA_EM_FK
FOREIGN KEY (cpf_funcionario)
REFERENCES C##uvv.funcionario (cpf)
NOT DEFERRABLE;

/*Chave estrangeira da tabela "dependente" é "cpf_funcionario", que referencia "cpf" da tabela "funcionario"*/

ALTER TABLE C##uvv.dependente ADD CONSTRAINT FUNCIONARIO_DEPENDENTE_FK
FOREIGN KEY (cpf_funcionario)
REFERENCES C##uvv.funcionario (cpf)
NOT DEFERRABLE;

/*Chave estrangeira da tabela "funcionario" é "cpf_supervisor", que referencia "cpf" na própria tabela 'funcionario"*/

ALTER TABLE C##uvv.funcionario ADD CONSTRAINT FUNCIONARIO_FUNCIONARIO_FK
FOREIGN KEY (cpf_supervisor)
REFERENCES C##uvv.funcionario (cpf)
NOT DEFERRABLE;

/* Chave estrangeira da tabela "localizacoes_departamento" é "numero_departamento", referenciando "numero_departamento" na tabela "departamento*/

ALTER TABLE C##uvv.localizacoes_departamento ADD CONSTRAINT DEPARTAMENTO_LOCALIZACOES_D323
FOREIGN KEY (numero_departamento)
REFERENCES C##uvv.departamento (numero_departamento)
NOT DEFERRABLE;

/* Chave estrangeira da tabela "projeto" é "numero_departamento", referenciando "numero_departamento" na tabela "departamento"*/

ALTER TABLE C##uvv.projeto ADD CONSTRAINT DEPARTAMENTO_PROJETO_FK
FOREIGN KEY (numero_departamento)
REFERENCES C##uvv.departamento (numero_departamento)
NOT DEFERRABLE;

/* Segunda chave estrangeira da tabela "trabalha_em" é "numero_projeto", que referencia "numero_projeto" na tabela "projeto"*/

ALTER TABLE C##uvv.trabalha_em ADD CONSTRAINT PROJETO_TRABALHA_EM_FK
FOREIGN KEY (numero_projeto)
REFERENCES C##uvv.projeto (numero_projeto)
NOT DEFERRABLE;
