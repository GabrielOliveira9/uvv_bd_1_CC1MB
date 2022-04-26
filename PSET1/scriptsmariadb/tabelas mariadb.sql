/* Aqui as tabelas "funcionario", "dependente" e "departamento" serão criadas, com suas respectivas colunas e chaves primárias (cpf, cpf_funcionario e nome dependente, numero_departamento)*/

/* As alterações nas restrições NOT NULL das tabelas FUNCIONARIO e TRABALHA EM que impediam o preenchimento de acordo com as imagens do documento ou de forma geral foram feitas durante a criação desse script. Portanto não há comentários nas colunas que foram modificadas (funcionario.cpf_supervisor e trabalha_em.horas)*/

CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(30),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11),
                numero_departamento INT NOT NULL,
                PRIMARY KEY (cpf)
);


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
);


CREATE TABLE departamento (
                numero_departamento INT NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                PRIMARY KEY (numero_departamento)
);

/* para criar o índice da chave alternativa da tabela "departamento" (nome_departamento)*/

CREATE UNIQUE INDEX departamento_ak
 ON departamento
 ( nome_departamento );

/* Criar a tabela "projeto", suas colunas e chave primária (numero_projeto) */

CREATE TABLE projeto (
                numero_projeto INT NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INT NOT NULL,
                PRIMARY KEY (numero_projeto)
);

/* Criar o índice da chave alternativa da tabela "projeto" (nome_projeto)*/

CREATE UNIQUE INDEX projeto_ak
 ON projeto
 ( nome_projeto );

/* Para criar as tabelas "trabalha em" e "localizacoes departamento", suas colunas e respectivas chaves primárias (cpf_funcionario e numero_projeto, numero_departamento e local)*/

CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INT NOT NULL,
                horas DECIMAL(3,1),
                PRIMARY KEY (cpf_funcionario, numero_projeto)
);


CREATE TABLE localizacoes_departamento (
                numero_departamento INT NOT NULL,
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY (numero_departamento, local)
);

/* Aqui serão criados os relacionamentos entre as tabelas*/

/*Primeiro, a chave estrangeira da tabela "departamento" é "cpf_gerente", referenciando "cpf" da tabela funcionario*/

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/*Chave estrangeira da tabela "trabalha_em" é "cpf_funcionario", também referenciando "cpf" da tabela funcionario*/

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/*Chave estrangeira da tabela "dependente" é "cpf_funcionario", que referencia "cpf" da tabela "funcionario"*/

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/*Chave estrangeira da tabela "funcionario" é "cpf_supervisor", que referencia "cpf" na própria tabela 'funcionario"*/

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Chave estrangeira da tabela "localizacoes_departamento" é "numero_departamento", referenciando "numero_departamento" na tabela "departamento*/

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Chave estrangeira da tabela "projeto" é "numero_departamento", referenciando "numero_departamento" na tabela "departamento"*/

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Segunda chave estrangeira da tabela "trabalha_em" é "numero_projeto", que referencia "numero_projeto" na tabela "projeto"*/

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
