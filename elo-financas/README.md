# Elo — Finanças da família

Aplicativo em português para uma família com dois titulares. Backend Cloudflare Worker, banco D1 e acesso privado pelo ChatGPT Sites. O código não contém credenciais nem dados financeiros pessoais.

## Recursos implementados

- Lançamentos manuais com armazenamento no servidor, edição, exclusão, revisão contra sobrescrita concorrente e valores em centavos.
- Visão mensal, filtros por pessoa, gráficos, orçamento e exportação CSV com proteção contra fórmulas.
- Migração opcional dos lançamentos manuais locais da primeira versão, sem duplicar IDs.
- Acesso de dois titulares por identidade fornecida pelo Sites e lista de e-mails no servidor.
- Integração Pluggy: widget oficial, autorização individual, descoberta dos conectores Open Finance reais de BB, Inter, Mercado Pago e Nubank, importação paginada de contas e transações BRL, reconexão e revogação.
- Deduplicação por conta/ID do provedor; correções de categoria e exclusões preservadas entre importações.
- Transferências internas e pagamentos de fatura classificados pelo provedor são excluídos do orçamento. Pendências também são excluídas. Categorias devem ser revisadas: transferências entre o casal não podem ser inferidas com certeza apenas pela descrição.
- Endpoint de atualização para uma tarefa em nuvem permite importar registros com o app fechado. O acesso exige o token secreto do mesmo Site e a fronteira privada da hospedagem. A tarefa deve ser ativada após configurar e validar o provedor; ela não está ativa nesta publicação.

## Configuração para produção

Configure os valores como segredos no Sites, nunca no GitHub ou no cliente:

| Variável | Uso |
|---|---|
| `OWNER_EMAIL` | Conta ChatGPT do responsável |
| `PARTNER_EMAIL` | Conta ChatGPT do segundo titular |
| `PLUGGY_CLIENT_ID` | Credencial da conta Pluggy com produção e cobertura aprovadas |
| `PLUGGY_CLIENT_SECRET` | Segredo da API Pluggy |
| `SITE_SERVICE_TOKEN` | Token de serviço existente do mesmo Site; não rotacionar sem atualizar a configuração e os webhooks |

A hospedagem precisa permitir explicitamente o segundo titular. A lista da aplicação e o acesso da hospedagem são controles distintos. Não publique dados bancários em um Site público.

Após configurar as credenciais e publicar, cada titular entra com a própria conta e conecta suas próprias contas pelo widget oficial. O aplicativo não recebe senhas bancárias. Valide o endpoint de atualização usando acesso de serviço e só então vincule uma tarefa Sites ao projeto. A tarefa precisa obter o token existente com get_site e enviá-lo exclusivamente ao mesmo Site nos cabeçalhos OAI-Sites-Authorization (Bearer) e X-Elo-Service. Nunca grave o token nas instruções da tarefa nem no GitHub. A tarefa consulta POST /api/internal/sync até completar ou relatar falha; não é necessário republicar o aplicativo a cada importação.

Não considere a importação real ativada antes de validar uma conexão autorizada em produção. Plano, preço, cobertura, limite histórico e frequência de atualização são definidos pelo provedor e banco. Não há promessa de instantaneidade. Movimentos em moeda estrangeira são ignorados nesta versão.

## Desenvolvimento e validação

Requer Node 24. Não há dependências de build.

```sh
npm run check
npm test
npm run build
```

Os testes executam as rotas reais contra SQLite e simulam as respostas do provedor: autenticação, isolamento, CSRF, centavos, revisões, orçamento, migração, paginação, duplicidade, preservação de correções, falhas e atualização sem navegador. Eles não substituem homologação com o provedor e consentimento reais.

O build inclui os assets no Worker `dist/server/index.js`, o manifesto e as migrações D1. Hospede pelo workflow Sites, preservando o ID em `.openai/hosting.json`. A publicação aplica migrações antes de disponibilizar o Worker. Nunca altere migrações já aplicadas; acrescente novas migrações.

## Operações

- `GET /api/internal/health`: verifica o banco, protegido pelo token de serviço do próprio Site e cabeçalho `X-Elo-Service`.
- `POST /api/internal/sync`: importa conexões existentes, com a mesma autorização de serviço. Retorna 503 quando o provedor não está configurado ou a paginação precisa continuar; não registra sucesso falso.
- A atualização mantém o cursor de páginas parciais no banco para continuar em outra tentativa. A sincronização importa registros disponíveis no provedor; disponibilidade e atualização no banco são distintas. Não há webhook público que exponha a fronteira privada do Site.
- Erros e última atualização são exibidos em cada conexão. A data de importação do app é distinta da atualização do banco.
- Desconectar revoga o item no provedor e remove contas e lançamentos daquela conexão. Exporte antes, se necessário.

## Limites atuais

Acesso do segundo titular e credenciais bancárias dependem da configuração do proprietário. QA visual não foi executada: o ambiente não disponibiliza `cua_repl.js`. Verificação de produção e conexão real devem ser registradas separadamente dos testes com respostas simuladas.
