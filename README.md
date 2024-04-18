<h1 align="center"> BACK-END  </h1>

###  🧑‍💻- Tecnologias

Tecnologias e ferramentas utilizadas no projeto: `Typescript, NodeJS / Express.js, Postgres, Cors, postGIS`

## ⚙️ - Como Executar a aplicação
```bash
# Baixe este repositório ou clone pelo Git usando o comando:
$ git clone https://github.com/candago/back.git

# Acesse a pasta do projeto
$ cd back

# Utilizando o Postgress crie o banco com o comando
'CREATE DATABASE bdapi'

# Instale as dependências do projeto
$ npm i

# Inicie o Projeto
$ npm start
```

## 🪧 - Rotas da aplicação
<div align="center">
  
|                                                                    Tipo | Rota                       | Ação                              |
| ----------------------------------------------------------------------: | :------------------------- | :-------------------------------- |
|                                                                    <hr> | <hr>                       | **Controle de usuários**          |
|   [![](https://img.shields.io/badge/POST-4682B4?style=for-the-badge)]() | `/alteracao/`              | Realiza alterações no banco        |
|   [![](https://img.shields.io/badge/POST-4682B4?style=for-the-badge)]() | `/aoi`                     |                              |
|   [![](https://img.shields.io/badge/POST-4682B4?style=for-the-badge)]() | `/apontamento`             | Ilustração de polígonos       |
|   [![](https://img.shields.io/badge/POST-4682B4?style=for-the-badge)]() | `/index`                   | Diretorio raiz com as rotas  |
|   [![](https://img.shields.io/badge/POST-4682B4?style=for-the-badge)]() | `/grade`                   | Listagem de grade de atuação  |
|   [![](https://img.shields.io/badge/GET-2E8B57?style=for-the-badge)]()  | `/search`                   | Listagem de grade de atuação  |
|   [![](https://img.shields.io/badge/POST-4682B4?style=for-the-badge)]() | `/sorting`                   | Listagem de grade de atuação  |
|   [![](https://img.shields.io/badge/POST-4682B4?style=for-the-badge)]() | `/user/{userId}`           | Cadastrar um usuário |



</div>

## 🗂️ - Estruturação das pastas

| Pasta                    | Definição                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------------ |
| 📁 src/                   | Arquivos com o código fonte do projeto                                                     |
| 📁 src/controllers        | Arquivos com os métodos de requisição das rotas                                            |
| 📁 src/models             | Arquivos com as entidades do banco de dados do projeto                                     |
| 📁 src/routes/            | Arquivos para expor rotas de controles da aplicação                                        |
| 📄 index.ts               | Arquivo usado para configurar o typescript como sintaxe, organização de arquivos, etc.     |
| 📄 tsconfig.json          | Arquivo usado para configurar o typescript como sintaxe, organização de arquivos, etc.     |
| 📄 package.json           | Arquivo usado gerenciar as dependencias do projeto com o Yarn e compor scripts de terminal |
