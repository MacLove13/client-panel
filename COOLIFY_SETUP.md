# Configuração de Variáveis de Ambiente para Coolify

Configure as seguintes variáveis de ambiente no Coolify:

## Variáveis Obrigatórias

### Rails
```
RAILS_MASTER_KEY=6247ebaaab321e350ee57e56baef7a90
SECRET_KEY_BASE=34c2ed6fdbe0d6e5f7912b79677a23fe885f46d5a06a0724e95abcb0f8ccd7c9a3d98a956345516b8b4320febe66527bca46320295dc3332b02be5d60c7e2f29
```

### Banco de Dados PostgreSQL
```
DATABASE_HOST=<host-do-postgres-no-coolify>
DATABASE_NAME=client_panel
DATABASE_USERNAME=client_panel
DATABASE_PASSWORD=<senha-segura>
```

## Como Gerar SECRET_KEY_BASE

Execute localmente:
```bash
bin/rails secret
```

Copie a saída (128 caracteres hexadecimais) e configure como SECRET_KEY_BASE.

## Configuração no Coolify

1. Vá até o seu projeto no Coolify
2. Acesse a seção "Environment Variables"
3. Adicione cada variável acima
4. Para o PostgreSQL do Coolify:
   - O `DATABASE_HOST` geralmente é o nome do serviço PostgreSQL (ex: `postgres-12345`)
   - Configure `DATABASE_NAME`, `DATABASE_USERNAME` e `DATABASE_PASSWORD` para corresponder ao banco criado

## Notas Importantes

- **NUNCA** commite o arquivo `config/master.key` no repositório
- A `RAILS_MASTER_KEY` é necessária para descriptografar as credenciais em produção
- A `SECRET_KEY_BASE` é usada para assinar cookies e sessões
- Certifique-se de que o banco de dados PostgreSQL seja criado ANTES do deploy da aplicação
