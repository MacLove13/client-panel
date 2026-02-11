# 🚀 Ação Necessária - Atualize suas Variáveis no Coolify

## ⚠️ PROBLEMA IDENTIFICADO

A `RAILS_MASTER_KEY` configurada no seu Coolify está **incorreta**.

### Valor Atual (INCORRETO) ❌
```
RAILS_MASTER_KEY=5187629d58122b1001080c0e2bff345e9dad1f7dc604d8a1249a01f98ff1e9f7c10e4b42e1ec0f80a5ec2e1b9d0b333f810d0ead6ef2e78bc1a6fffb551fa992
```

### Valor Correto (USE ESTE) ✅
```
RAILS_MASTER_KEY=6247ebaaab321e350ee57e56baef7a90
```

---

## ✅ Configuração Completa para o Coolify

Atualize suas variáveis de ambiente no Coolify para:

```bash
# Database (suas configurações estão corretas)
DATABASE_NAME=client_panel_production
DATABASE_PASSWORD=client_panel_secret
DATABASE_USERNAME=client_panel

# Rails - ATUALIZE A RAILS_MASTER_KEY
RAILS_MASTER_KEY=6247ebaaab321e350ee57e56baef7a90
SECRET_KEY_BASE=15f92a59b4bbaf918409f5fc0429290cedc015fe503cace8c3fc49de3302d42b1f1866314746f9b9667d647b168aa0837e5152419b27f41c7c12bb5a61db2fe2
```

**Notas:**
- O `DATABASE_HOST` não precisa ser definido (já configurado como `db` no docker-compose.yaml)
- As variáveis `SERVICE_FQDN_WEB` e `SERVICE_URL_WEB` são geradas automaticamente pelo Coolify

---

## 📝 Passos para Corrigir

1. No Coolify, vá até seu projeto
2. Acesse "Environment Variables"
3. Encontre a variável `RAILS_MASTER_KEY`
4. **Altere** o valor para: `6247ebaaab321e350ee57e56baef7a90`
5. Salve as alterações
6. Faça o **redeploy** da aplicação

---

## 🔍 Por que está dando erro?

### Erro: "key must be 16 bytes"
Isso acontece porque a `RAILS_MASTER_KEY` incorreta não consegue descriptografar o arquivo `config/credentials.yml.enc`, causando falha na inicialização da aplicação.

### Erro: "database does not exist"  
Após corrigir a `RAILS_MASTER_KEY`, o banco será criado automaticamente pelo entrypoint do Docker.

---

## ✨ Após a Correção

A aplicação deverá:
1. ✅ Descriptografar as credenciais corretamente
2. ✅ Conectar ao banco de dados PostgreSQL (serviço `db`)
3. ✅ Executar as migrações automaticamente
4. ✅ Iniciar o servidor na porta 80 (mapeada para o Coolify)

---

Consulte [COOLIFY_SETUP.md](COOLIFY_SETUP.md) para mais informações sobre a configuração.
