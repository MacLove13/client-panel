# Painel de Controle de Usuário

Aplicação Rails 8 com PostgreSQL e Tailwind CSS 4 para gerenciamento de perfil de usuário.

## Funcionalidades

- Tela de login (sem registro público)
- Edição de perfil do usuário logado
- Usuário padrão: `user` / senha: `admin`

## Desenvolvimento

### Pré-requisitos

- Ruby 3.2.3
- PostgreSQL
- Node.js

### Configuração

```bash
bin/setup
```

### Executar

```bash
bin/dev
```

## Deploy com Docker

### Build e execução com Docker Compose

```bash
docker compose up --build
```

A aplicação estará disponível em `http://localhost:3000`.

### Variáveis de ambiente

| Variável | Descrição | Padrão |
|----------|-----------|--------|
| `DATABASE_USERNAME` | Usuário do PostgreSQL | `client_panel` |
| `DATABASE_PASSWORD` | Senha do PostgreSQL | `client_panel_secret` |
| `DATABASE_NAME` | Nome do banco de dados | `client_panel_production` |
| `SECRET_KEY_BASE` | Chave secreta do Rails | - |
| `RAILS_MASTER_KEY` | Chave mestra do Rails | - |
| `PORT` | Porta da aplicação | `3000` |

### Deploy no Coolify

1. Conecte o repositório no Coolify
2. Configure as variáveis de ambiente necessárias
3. O Coolify irá detectar o `docker-compose.yaml` automaticamente
