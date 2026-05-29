# 🏥 Sistema de Banco de Dados - Clínica de Fisioterapia

## 📌 Descrição

Projeto de modelagem e implementação de banco de dados relacional para uma clínica de fisioterapia, desenvolvido utilizando MySQL.

## 🎯 Objetivo

Simular um sistema real para gestão de pacientes, fisioterapeutas, sessões e procedimentos.

## 🧠 Tecnologias

* MySQL
* MySQL Workbench

## 🗂️ Estrutura do Banco

O banco contempla as seguintes entidades:

- Paciente
- Fisioterapeuta
- Sessao
- Procedimento
- Telefone
- Telefone_de_contato
- Plano_Saude
- Avaliacao
- Exame
- Horario_Fisioterapeuta
  
## 🔗 Exemplos de Relacionamentos

* Um paciente pode possuir múltiplas sessões
* Um fisioterapeuta pode realizar várias sessões
* Cada sessão está associada a um procedimento
* Um paciente pode possuir múltiplos exames
* Um fisioterapeuta possui horários definidos de atendimento


📁 Arquivos do Projeto

- database/schema.sql → Script de criação do banco de dados
- database/inserts.sql → Script de inserção de dados

🚀 Como executar

- Executar o arquivo database/schema.sql
- Executar o arquivo database/inserts.sql

⚠️ Recomendado executar em um banco vazio para evitar conflitos de chave primária.


## 📷 Modelo EER
![Modelo EER](model/modelo-eer.png)

## 📈 Aprendizados

* Modelagem relacional
* Criação de tabelas e constraints
* Uso de chaves primárias e estrangeiras
* Estruturação de dados para análise

## 👨‍💻 Autor
* Maria Emanuelle Pimentel
* Catarina Garcia
* Rebeca Laila Duarte

🤝 Colaboração
O projeto foi desenvolvido de forma colaborativa, envolvendo etapas de modelagem, implementação do banco de dados e validação das relações entre as entidades.
