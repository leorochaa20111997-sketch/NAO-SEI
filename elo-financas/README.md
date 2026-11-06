# Elo — Finanças da família

Aplicativo privado em português com Worker Cloudflare, D1, controle por titular e integração pessoal gratuita Meu Pluggy. O código não contém credenciais nem dados financeiros reais.

## Integração gratuita escolhida

O caminho principal do app é **Meu Pluggy pessoal**, documentado pelo próprio provedor:

- https://meu.pluggy.ai/api-guide
- https://docs.pluggy.ai/pt/docs/guides/meu-pluggy-personal-use
- https://docs.pluggy.ai/en/docs/connections/item

Segundo a documentação consultada em 06/11/2026, esse modo é gratuito para leitura dos próprios dados, sem assinatura comercial, limitado a cinco conexões e sem finalidade comercial. Não se confunde com o teste de 15 dias da API empresarial. A disponibilidade dos bancos e produtos deve ser confirmada na conta Meu Pluggy; ela não é garantida pelo código do Elo.

Cada membro da família utiliza suas próprias contas e credenciais do provedor. O compartilhamento do painel entre o casal atende ao pedido de um espaço familiar privado; não use a integração pessoal para oferecer um serviço a terceiros.

## Configuração inicial pelo app

1. Entre com seu próprio perfil ChatGPT autorizado e abra **Contas e bancos → Conectar gratuitamente**.
2. Use o link para criar sua conta gratuita no Meu Pluggy e autorize seus próprios bancos por lá.
3. No Dashboard Pluggy, com a mesma conta, escolha **Aplicações → Demo → Conectar Conta → MeuPluggy**. Escolher o conector direto do banco pertence a outro fluxo e pode exigir plano comercial.
4. Copie o itemId de cada banco e Client ID/Client Secret da aplicação pessoal para o formulário seguro do Elo. Os itens não podem ser enumerados por `GET /v2/items` nesse plano, por isso o cadastro inicial do itemId é necessário.
5. O outro titular repete o processo com a própria conta e credenciais. O cadastro da pessoa fica em Preferências → Pessoas da família. O mesmo e-mail precisa estar permitido no compartilhamento privado do site.

O nome do conector proxy é MeuPluggy; o banco do item é um rótulo escolhido pelo titular no formulário, não uma inferência confirmada pelo provedor.

As chaves são cifradas com AES-256-GCM e contexto vinculado à identidade do titular. A chave de criptografia fica no segredo de hospedagem `INTEGRATION_ENCRYPTION_KEY`, nunca no GitHub ou no cliente. As APIs não devolvem chaves. O outro membro não pode usar as mesmas credenciais da aplicação pessoal nem gerenciar conexões alheias.

## Atualização automática

O Meu Pluggy atualiza as conexões de origem a cada 24 horas, de acordo com sua documentação. Os itens proxy refletem os dados da origem e não aceitam atualização manual via PATCH. O Elo lê os dados disponíveis, sem forçar uma nova coleta no banco.

O endpoint privado `POST /api/internal/sync` foi preparado para a tarefa diária vinculada ao Site. A tarefa obtém o token de serviço existente com `get_site` e o envia **somente a este mesmo Site** nos cabeçalhos `OAI-Sites-Authorization: Bearer <token>` e `X-Elo-Service: <token>`. Nunca coloque credenciais no texto da tarefa ou no repositório. O servidor seleciona as credenciais do titular de cada conexão, sem exigir uma API comercial global.

Sem conexões autorizadas, o endpoint responde `skipped: no_connections` e não inventa registros. Paginação parcial mantém o cursor para retomar. Falha ou autorização expirada de uma pessoa não impede a importação das demais; o retorno parcial lista as falhas por banco. Importar não significa atualizar instantaneamente a origem.

Após renovação de uma autorização Meu Pluggy, confirme o novo itemId no Dashboard. Segundo o provedor, a autorização de acesso da aplicação tem validade própria e pode expirar mesmo se o consentimento bancário ainda estiver ativo. O Elo verifica a expiração e preserva o histórico; não interpreta leituras vazias após expiração como saldo zerado.

## Recursos financeiros

- Lançamentos manuais e importados com persistência no servidor e valores em centavos.
- Edição, exclusão e controle de revisão para evitar sobrescritas concorrentes.
- Orçamento, visão mensal, filtro por pessoa, gráficos e CSV protegido contra fórmulas.
- Migração idempotente dos registros manuais da primeira versão.
- Importação paginada por conta/ID, sem duplicar registros, preservando categorias ajustadas e exclusões.
- Transferências internas e pagamentos de fatura identificados pelo provedor ficam fora do orçamento; transações pendentes também. Revise as categorias e transferências entre o casal para evitar dupla contagem.
- Reconexão guiada, revogação e exclusão dos dados de uma conexão.

## Hospedagem e configuração

O manifesto `.openai/hosting.json` preserva o projeto e o binding D1 `DB`. Migrações aplicadas são imutáveis; novas alterações usam novas migrações. O build produz `dist/server/index.js` com assets embutidos. O artefato de publicação inclui `.openai/`, `dist/` e `drizzle/` na raiz.

Segredos da hospedagem:

| Chave | Uso |
|---|---|
| `OWNER_EMAIL` | Conta do responsável pela família |
| `PARTNER_EMAIL` | Opcional: segundo titular, em alternativa ao cadastro pelo app |
| `INTEGRATION_ENCRYPTION_KEY` | Chave AES de 32 bytes em hexadecimal; preserve-a para ler as configurações cifradas |
| `SITE_SERVICE_TOKEN` | Acesso de serviço do mesmo Site, somente para rotinas internas |
| `PLUGGY_CLIENT_ID` / `PLUGGY_CLIENT_SECRET` | Opcionais: compatibilidade com a integração comercial anterior; dispensáveis para o modo pessoal |

## Verificação

Requer Node 24, sem dependências de build:

```sh
npm run check
npm test
npm run build
```

Os testes executam o backend com SQLite e respostas simuladas da API. Incluem autenticação, CSRF, centavos, revisões, dois titulares, cifragem e sigilo das credenciais, proxies pessoais, limites, expiração, paginação e atualização automática sem API comercial.

Verificação real com bancos continua dependendo do cadastro e consentimento dos titulares. QA visual indisponível neste ambiente, que não contém `cua_repl.js`. Nenhum plano pago foi contratado e nenhuma conta financeira foi criada em nome do usuário.
