# Configuração de Variáveis de Ambiente para Coolify

Configure as seguintes variáveis de ambiente no Coolify:

## ⚠️ IMPORTANTE - Deploy via Docker Compose

Como o Coolify utiliza o `docker-compose.yaml` para o deploy, o serviço de banco de dados PostgreSQL é gerenciado automaticamente pelo Docker Compose. 

O `DATABASE_HOST` deve ser **`db`** (nome do serviço no docker-compose.yaml).

## Variáveis Obrigatórias

### Rails
```
RAILS_MASTER_KEY=6247ebaaab321e350ee57e56baef7a90
SECRET_KEY_BASE=15f92a59b4bbaf918409f5fc0429290cedc015fe503cace8c3fc49de3302d42b1f1866314746f9b9667d647b168aa0837e5152419b27f41c7c12bb5a61db2fe2
```

### Banco de Dados PostgreSQL
```
DATABASE_NAME=client_panel_production
DATABASE_USERNAME=client_panel
DATABASE_PASSWORD=client_panel_secret
```

**Nota**: O `DATABASE_HOST` já está configurado como `db` no docker-compose.yaml e não precisa ser definido nas variáveis de ambiente.



## Configuração no Coolify

1. Vá até o seu projeto no Coolify
2. Acesse a seção "Environment Variables"
3. Adicione as variáveis listadas acima
4. O Coolify detectará automaticamente o `docker-compose.yaml`
5. O PostgreSQL será criado automaticamente como serviço `db`
6. Faça o deploy da aplicação

## Suas Variáveis Atuais no Coolify

```bash (já está no .gitignore)
- A `RAILS_MASTER_KEY` é necessária para descriptografar as credenciais em produção
- A `SECRET_KEY_BASE` é usada para assinar cookies e sessões
- O banco de dados PostgreSQL é criado automaticamente pelo docker-compose.yaml
- O serviço de banco se chama `db` e é acessível internamente pela aplicação
- As variáveis `SERVICE_FQDN_WEB` e `SERVICE_URL_WEB` são geradas automaticamente pelo Coolify

## Troubleshooting

### Erro: "database does not exist"
- Certifique-se de que `DATABASE_NAME=client_panel_production`
- Verifique se o serviço `db` está rodando: o Coolify deve iniciar ambos os serviços (db e web)

### Erro: "key must be 16 bytes"
- Verifique se a `RAILS_MASTER_KEY` está correta (32 caracteres hexadecimais)
- Certifique-se de que a `SECRET_KEY_BASE` tem 128 caracteres hexadecimais

# Database
DATABASE_NAME=client_panel_production
DATABASE_PASSWORD=client_panel_secret
DATABASE_USERNAME=client_panel

# Rails
RAILS_MASTER_KEY=6247ebaaab321e350ee57e56baef7a90
SECRET_KEY_BASE=15f92a59b4bbaf918409f5fc0429290cedc015fe503cace8c3fc49de3302d42b1f1866314746f9b9667d647b168aa0837e5152419b27f41c7c12bb5a61db2fe2
```

⚠️ **ATENÇÃO**: A `RAILS_MASTER_KEY` que você está usando no Coolify está incorreta. Ela deve ser:
```
RAILS_MASTER_KEY=6247ebaaab321e350ee57e56baef7a90
```

E não:
```
RAILS_MASTER_KEY=5187629d58122b1001080c0e2bff345e9dad1f7dc604d8a1249a01f98ff1e9f7c10e4b42e1ec0f80a5ec2e1b9d0b333f810d0ead6ef2e78bc1a6fffb551fa992
```

## Notas Importantes

- **NUNCA** commite o arquivo `config/master.key` no repositório
- A `RAILS_MASTER_KEY` é necessária para descriptografar as credenciais em produção
- A `SECRET_KEY_BASE` é usada para assinar cookies e sessões
- Certifique-se de que o banco de dados PostgreSQL seja criado ANTES do deploy da aplicação
