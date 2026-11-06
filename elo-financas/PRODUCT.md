# RaiNexa Finanças

<!-- impeccable:product-schema 1 -->

## Platform
web

## Users
O proprietário e sua esposa acompanham as finanças da família no Brasil. Por solicitação explícita do proprietário, qualquer pessoa com o link pode consultar e alterar os registros compartilhados, sem login.

## Product Purpose
Acompanhar receitas, despesas, orçamento e contas bancárias em um painel público com dados persistentes no servidor.

## Operating Context
Banco do Brasil, Inter, Mercado Pago e Nubank. Cada titular autoriza suas próprias contas. Openi Connect usa uma chave pessoal por titular; Meu Pluggy pessoal é uma alternativa. Chaves de produção e consentimentos reais ainda não foram fornecidos.

## Capabilities and Constraints
Worker Cloudflare e D1. A raiz abre diretamente o painel real, sem demonstrações nem valores fictícios. Lançamentos manuais, filtros, orçamento, CSV e importação paginada. Categorias automáticas por dados do provedor, MCC e descrição; Supermercado, Energia, Água e Internet e telefone têm categorias próprias. Casos sem informação ficam em Outros. Ajustes manuais dos lançamentos bancários persistem nas próximas importações. Navegadores recebem identificação automática para gerenciar suas conexões sem login; cada titular usa seu próprio navegador. Chaves ficam cifradas no servidor. Cookies apagados perdem a identificação de gerenciamento. Identidades Sites existentes conservam os vínculos anteriores. Tarefa diária às 12h UTC. Plano pessoal, habilitação e cobertura dependem do provedor.

## Brand Commitments
RaiNexa Finanças. Logo N fornecida pelo usuário, sem fundo. Azul, roxo, turquesa e grafite; Sora e Inter. Preservar o visual existente e facilitar o acesso direto ao painel.

## Evidence on Hand
Três imagens de marca fornecidas. 46 testes automatizados. Nenhum banco real conectado e nenhuma prova de integração de produção. Revisão visual em navegador indisponível no ambiente.

## Product Principles
Preservar registros existentes. Acesso público direto e sem dados fictícios. Informar claramente o compartilhamento dos registros. Separar o gerenciamento das chaves por titular e explicar a ativação necessária antes da importação.
