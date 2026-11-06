# RaiNexa Finanças

Aplicativo público em português com Worker Cloudflare, D1, controle por titular e integração Openi Connect, com Meu Pluggy pessoal como alternativa. O código não contém credenciais nem dados financeiros reais.

## Acesso público direto

A raiz `/` abre o painel operacional, assim como `/app`. Não há página de apresentação, demonstração, valores fictícios ou tela de login. Qualquer visitante pode consultar, criar, editar e excluir lançamentos, ajustar orçamentos e exportar os dados compartilhados. Essa abertura foi solicitada explicitamente pelo proprietário.

O navegador recebe automaticamente um cookie assinado, Secure, HttpOnly e SameSite=Lax, válido por um ano, para separar o gerenciamento de conexões bancárias. Em Preferências é possível escolher Você ou Esposa antes de conectar bancos. Cada titular usa o próprio navegador; apagar os cookies perde o acesso de gerenciamento às conexões daquele navegador. Os movimentos e saldos importados são públicos, mas as chaves permanecem cifradas e não são devolvidas pelas APIs. Tentativas de consentimento são vinculadas ao navegador e têm consumo único. Identidades Sites já reconhecidas conservam seus vínculos bancários anteriores, sem impor login a outros visitantes.

As escritas exigem origem igual à do Site e o cabeçalho de aplicação. Configurações globais existentes e o atualizador interno mantêm suas permissões próprias; o atualizador exige um segredo de serviço separado. Nenhum registro existente é removido pela mudança de acesso.

A identidade usa a logo N fornecida pelo usuário, extraída com transparência via image_gen, Sora e Inter hospedadas no próprio Worker, e cores grafite, azul, roxo e turquesa. Licenças em `assets/licenses/`. A revisão visual em navegador não está disponível neste ambiente; não há aprovação visual renderizada.

## Categorias automáticas

Na importação Openi ou Meu Pluggy, o RaiNexa usa a categoria específica informada pelo provedor, o código de atividade do estabelecimento (MCC), quando disponível, e regras locais sobre descrição/nome do estabelecimento. Não há consulta adicional a serviços de IA nem custo de classificação por transação. Categorias genéricas do banco são refinadas quando a descrição identifica a despesa.

Categorias de despesa: Moradia, Supermercado, Alimentação, Energia, Água, Internet e telefone, Transporte, Lazer, Saúde, Educação, Compras e Outros. Salário, Renda extra e Transferências continuam disponíveis. As categorias anteriores são preservadas: Alimentação não é renomeada nem tem seus limites antigos redistribuídos automaticamente.

Em novos lançamentos manuais, a opção **Automática (pela descrição)** classifica no momento de salvar. Em lançamentos bancários a classificação ocorre na importação. Um Pix para uma pessoa ou um intermediador de pagamento, sem finalidade identificável, fica em **Outros**; não é marcado como transferência interna apenas por ser Pix. O painel sinaliza categorias bancárias em Outros para revisão.

Para corrigir, abra Lançamentos e edite a categoria. A sincronização seguinte preserva o ajuste desse lançamento e não recria registros excluídos. A correção não ensina uma regra para todos os lançamentos futuros do mesmo estabelecimento. Os saldos e movimentações reais continuam dependendo da configuração da Openi e do consentimento no banco.

## Conexão iniciada pelo RaiNexa: Openi

A integração padrão agora usa o Connect hospedado da Openi. A página oficial de preços anuncia um plano pessoal de R$ 0/mês, cinco consentimentos do mesmo titular e uma atualização diária. Não confundir esse plano com o teste de 14 dias dos planos comerciais. A habilitação, o faturamento e a cobertura da conta são controlados pelo provedor; o RaiNexa não consegue confirmar o plano pela API documentada e não contrata assinaturas. Cada titular deve obter sua própria chave pessoal.

Fontes verificadas em 06/11/2026:

- https://openi4devs.com.br/precos
- https://developer.openi.com.br/docs/openfinance/connect/overview
- https://developer.openi.com.br/docs/openfinance/connect/create-connect-session

No RaiNexa, abra Contas e bancos e configure uma vez sua chave e a URL de produção fornecida pela Openi. A documentação pública usa uma URL base parametrizada; nenhum endereço de API foi inventado ou presumido. O formulário aceita apenas HTTPS em subdomínios oficiais openi.com.br, sem portas, usuário/senha, consultas ou caminhos arbitrários. As requisições não seguem redirecionamentos com a chave.

Depois, Conectar banco cria uma sessão temporária no servidor e envia o usuário ao Connect oficial. O retorno para /bancos inclui uma tentativa aleatória vinculada ao titular, com validade de 30 minutos e consumo único. O backend trata os parâmetros de retorno como dados não confiáveis: consulta o item com a chave do titular e confirma o banco pelo conector retornado pela API. Não exige copiar itemId manualmente. O widget permite escolher a instituição; o RaiNexa importa os bancos pessoais BB, Inter, Mercado Pago e Nubank quando disponibilizados para a chave.

O adaptador importa contas e transações bancárias BRL, normaliza valores e pagina até concluir, usa identificadores separados por provedor e participa da tarefa diária já vinculada ao Site. A integração de cartões e investimentos da Openi não está implementada nesta versão. O modo Meu Pluggy anterior continua disponível para as conexões existentes e como alternativa.

Configuração e autorização de produção ainda dependem das chaves e consentimentos dos titulares. Os testes usam respostas simuladas baseadas na documentação, sem provar acesso de produção. QA visual continua indisponível no ambiente.

## Alternativa pessoal gratuita: Meu Pluggy

O caminho alternativo **Meu Pluggy pessoal** é documentado pelo próprio provedor:

- https://meu.pluggy.ai/api-guide
- https://docs.pluggy.ai/pt/docs/guides/meu-pluggy-personal-use
- https://docs.pluggy.ai/en/docs/connections/item

Segundo a documentação consultada em 06/11/2026, esse modo é gratuito para leitura dos próprios dados, sem assinatura comercial, limitado a cinco conexões e sem finalidade comercial. Não se confunde com o teste de 15 dias da API empresarial. A disponibilidade dos bancos e produtos deve ser confirmada na conta Meu Pluggy; ela não é garantida pelo código do RaiNexa.

Cada membro da família utiliza suas próprias contas e credenciais do provedor. O proprietário solicitou acesso público ao painel. As integrações pessoais continuam destinadas aos dados do próprio titular, conforme as regras do provedor.

## Configuração inicial do modo alternativo Meu Pluggy pelo app

1. Abra **Preferências**, escolha seu perfil neste navegador e siga para **Bancos → Conectar gratuitamente**.
2. Use o link para criar sua conta gratuita no Meu Pluggy e autorize seus próprios bancos por lá.
3. No Dashboard Pluggy, com a mesma conta, escolha **Aplicações → Demo → Conectar Conta → MeuPluggy**. Escolher o conector direto do banco pertence a outro fluxo e pode exigir plano comercial.
4. Copie o itemId de cada banco e Client ID/Client Secret da aplicação pessoal para o formulário seguro do RaiNexa. Os itens não podem ser enumerados por `GET /v2/items` nesse plano, por isso o cadastro inicial do itemId é necessário.
5. O outro titular repete o processo no próprio navegador, com suas próprias credenciais. Nenhum cadastro de e-mail ou login é necessário para usar o painel.

O nome do conector proxy é MeuPluggy; o banco do item é um rótulo escolhido pelo titular no formulário, não uma inferência confirmada pelo provedor.

As chaves são cifradas com AES-256-GCM e contexto vinculado à identidade do titular. A chave de criptografia fica no segredo de hospedagem `INTEGRATION_ENCRYPTION_KEY`, nunca no GitHub ou no cliente. As APIs não devolvem chaves. O outro membro não pode usar as mesmas credenciais da aplicação pessoal nem gerenciar conexões alheias.

## Atualização automática

O Meu Pluggy atualiza as conexões de origem a cada 24 horas, de acordo com sua documentação. Os itens proxy refletem os dados da origem e não aceitam atualização manual via PATCH. O RaiNexa lê os dados disponíveis, sem forçar uma nova coleta no banco.

O endpoint privado `POST /api/internal/sync` foi preparado para a tarefa diária vinculada ao Site. A tarefa obtém o token de serviço existente com `get_site` e o envia **somente a este mesmo Site** nos cabeçalhos `OAI-Sites-Authorization: Bearer <token>` e `X-Elo-Service: <token>`. Nunca coloque credenciais no texto da tarefa ou no repositório. O servidor seleciona as credenciais do titular e o adaptador (Openi ou Meu Pluggy) de cada conexão, sem exigir uma API comercial global.

Sem conexões autorizadas, o endpoint responde `skipped: no_connections` e não inventa registros. Paginação parcial mantém o cursor para retomar. Falha ou autorização expirada de uma pessoa não impede a importação das demais; o retorno parcial lista as falhas por banco. Importar não significa atualizar instantaneamente a origem.

Após renovação de uma autorização Meu Pluggy, confirme o novo itemId no Dashboard. Segundo o provedor, a autorização de acesso da aplicação tem validade própria e pode expirar mesmo se o consentimento bancário ainda estiver ativo. O RaiNexa verifica a expiração e preserva o histórico; não interpreta leituras vazias após expiração como saldo zerado.

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
