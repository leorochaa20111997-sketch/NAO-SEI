---
name: "RaiNexa Finanças"
description: "Identidade escura para organizar as finanças da família."
colors:
  primary-blue: "#2563eb"
  ribbon-violet: "#7c3aed"
  ribbon-teal: "#14b8a6"
  aqua: "#52e0e4"
  violet-light: "#c4b5fd"
  canvas: "#080d1a"
  panel: "#111a2c"
  surface: "#0e1627"
  ink: "#f1f5fc"
  muted: "#a9b5cd"
  border: "#26324a"
  balance-blue: "#17368a"
  sidebar: "#0b1324"
  secondary: "#111c30"
  secondary-text: "#e2e8f0"
  field: "#0d172b"
  field-text: "#e3ebfa"
  field-border: "#3a4b69"
  income-chart: "#50d1d9"
  expense-chart: "#ac8dea"
typography:
  display:
    fontFamily: "Sora, sans-serif"
    fontSize: "clamp(48px, 6.1vw, 84px)"
    fontWeight: 650
    lineHeight: 1.12
    letterSpacing: "-0.04em"
  headline:
    fontFamily: "Sora, sans-serif"
    fontSize: "clamp(28px, 3vw, 42px)"
    lineHeight: 1.3
    letterSpacing: "-0.035em"
  title:
    fontFamily: "Sora, sans-serif"
    fontSize: "29px"
    fontWeight: 600
    lineHeight: 1.35
    letterSpacing: "-0.035em"
  metric:
    fontFamily: "Sora, sans-serif"
    fontSize: "25px"
    fontWeight: 500
    letterSpacing: "-0.035em"
  body:
    fontFamily: "Inter, sans-serif"
    fontSize: "15px"
    fontWeight: 400
    lineHeight: 1.6
  lead:
    fontFamily: "Inter, sans-serif"
    fontSize: "17px"
    fontWeight: 400
    lineHeight: 1.8
  label:
    fontFamily: "Inter, sans-serif"
    fontSize: "13px"
    fontWeight: 600
    lineHeight: 1.4
rounded:
  compact: "4px"
  field: "7px"
  utility: "8px"
  button: "9px"
  panel: "10px"
  dialog: "13px"
  feature: "15px"
spacing:
  xs: "4px"
  sm: "8px"
  control-gap: "10px"
  md: "12px"
  card: "20px"
  panel: "22px"
  section-gap: "24px"
  app-gutter: "38px"
components:
  button-primary:
    backgroundColor: "{colors.primary-blue}"
    textColor: "#ffffff"
    typography: "{typography.label}"
    rounded: "{rounded.button}"
    padding: "12px 21px"
  button-primary-hover:
    backgroundColor: "#2463de"
  button-secondary:
    backgroundColor: "{colors.secondary}"
    textColor: "{colors.secondary-text}"
    typography: "{typography.label}"
    rounded: "{rounded.button}"
    padding: "12px 21px"
  button-secondary-hover:
    backgroundColor: "#1c2942"
  input:
    backgroundColor: "{colors.field}"
    textColor: "{colors.field-text}"
    rounded: "{rounded.field}"
    padding: "11px 12px"
  metric-card:
    backgroundColor: "{colors.panel}"
    textColor: "{colors.ink}"
    rounded: "{rounded.panel}"
    padding: "{spacing.card}"
  balance-card:
    backgroundColor: "{colors.balance-blue}"
    textColor: "#ffffff"
    rounded: "{rounded.panel}"
    padding: "{spacing.card}"
  navigation-item:
    textColor: "#a2b3cf"
    rounded: "{rounded.field}"
    padding: "12px 13px"
  navigation-item-active:
    backgroundColor: "#1b2d52"
    textColor: "#d7e6ff"
  context-tag:
    backgroundColor: "#1b3154"
    textColor: "#a9c4f5"
    rounded: "{rounded.compact}"
    padding: "6px 9px"
---

# Design System: RaiNexa Finanças

## Overview

**Creative North Star: "Seu dinheiro, na mesma direção"**

A identidade parte do monograma N fornecido pela família: uma fita azul, roxa e turquesa sobre um ambiente escuro. Sora dá presença aos títulos e valores; Inter mantém textos, controles e explicações diretos. A cor aparece com mais força na marca, na ação principal, no saldo e nas séries de dados.

O site público em / apresenta uma demonstração identificada e o guia de uso. O painel em /app concentra as operações e exige uma conta autorizada para mostrar registros reais. Esses dois contextos compartilham a identidade, com mais espaço na apresentação e maior densidade no trabalho diário. As conexões bancárias reais ainda dependem das chaves e da autorização de cada titular.

Este registro foi extraído de public/brand.css, public/landing.css, public/style.css, dos dois HTMLs e das cores de gráficos em public/app.js. Não houve inspeção visual, captura de tela ou validação de estilos computados no navegador; os valores abaixo descrevem o código. A frase norteadora é a chamada implementada no site, sem uma nova promessa de produto.

**Key Characteristics:**
- Monograma N original, com transparência preservada.
- Superfícies azul-grafite, divisórias discretas e contraste claro de texto.
- Títulos Sora, leitura Inter e números alinhados com algarismos tabulares.
- Apresentação pública espaçosa e painel operacional compacto.
- Demonstração fictícia e estados de autorização sempre identificados.

## Colors

A paleta combina azul de ação e violeta de marca com sinais aqua sobre superfícies frias e escuras. Os valores normativos estão no frontmatter.

### Primary

- **Azul RaiNexa** (`primary-blue`): ação principal, marca e preenchimento discreto de gráfico.
- **Azul de saldo** (`balance-blue`): plano destacado do saldo mensal na demonstração e no painel.

### Secondary

- **Violeta da fita** (`ribbon-violet`): identidade do monograma fornecido.
- **Violeta claro** (`violet-light`): família de realces secundários. A série de saídas usa o tom específico `expense-chart`.

### Tertiary

- **Turquesa da fita** (`ribbon-teal`): identidade do monograma.
- **Aqua luminoso** (`aqua`): foco de teclado, realces, legendas e sinais de entrada. A série do gráfico usa `income-chart`.

### Neutral

- **Canvas noturno** (`canvas`): fundo global e cor do navegador.
- **Painel grafite azulado** (`panel`) e **superfície interna** (`surface`): camadas de conteúdo.
- **Barra lateral** (`sidebar`): navegação e estrutura da demonstração.
- **Texto claro** (`ink`) e **texto secundário** (`muted`): leitura sobre o tema escuro.
- **Divisória** (`border`): contornos e separação entre regiões.
- **Ação secundária** (`secondary`, `secondary-text`): botão de apoio com contorno.
- **Campo escuro** (`field`, `field-text`, `field-border`): busca e formulários.

### Named Rules

**The Ribbon Identity Rule.** Use o monograma fornecido como assinatura da RaiNexa e preserve sua transparência e suas cores.

## Typography

**Display Font:** Sora, com sans-serif de fallback.  
**Body Font:** Inter, com sans-serif de fallback.

**Character:** títulos geométricos e compactos equilibram textos de apoio com entrelinhas abertas. As famílias são servidas localmente em `public/fonts`; a declaração de pesos acompanha os arquivos já presentes.

### Hierarchy

- **Display:** chamada pública fluida do frontmatter; os estilos responsivos usam tamanhos explícitos de 66, 58, 49 e 43 px nas faixas menores.
- **Headline:** títulos de seção pública; há variações locais de 35 e 36 px para guia e dúvidas.
- **Title:** título do painel; adapta-se para 24–25 px em telas menores.
- **Metric:** valores das estatísticas; tamanhos responsivos vão de 18 a 26 px no painel. A demonstração usa sua própria faixa fluida.
- **Body:** base global. Textos explicativos locais usam 12–14 px e entrelinha de 1.8–1.9; a introdução pública usa o papel `lead`.
- **Label:** botão padrão. O painel tem muitos rótulos de 11 px; esses tamanhos são observação do código, sem afirmar legibilidade verificada.

### Named Rules

**The Numeric Reading Rule.** Use Sora nos valores principais e algarismos tabulares nos saldos e nas listas de movimentos.

## Layout

A apresentação pública usa um contêiner de até 1240 px, com largura de viewport menos 88 px; em até 680 px, passa a viewport menos 36 px. A chamada ocupa uma coluna ampla junto ao monograma. As seções de história, guia e dúvidas usam pares de colunas e passam a uma coluna nas faixas menores. O guia deixa de ser fixo durante a rolagem em até 820 px. Os blocos públicos têm respiro vertical de 90–105 px, reduzido para cerca de 52–55 px no celular.

O painel mantém uma barra lateral fixa de 240 px, reduzida a 207 px em até 1200 px, uma faixa de ícones de 76 px em até 900 px e navegação inferior em até 560 px. A navegação inferior mede 74 px no estilo final, com reserva de espaço no conteúdo. O conteúdo tem limite de 1600 px e recuos laterais de 38 px no desktop, 24 px no intermediário e 17 px no celular. As quatro estatísticas viram duas colunas em até 900 px. Gráficos e listas empilham progressivamente.

O espaçamento combina grupos curtos nos controles com recuos de 20–24 px nos painéis. Não há uma escala matemática única no CSS. Os tokens registram somente passos repetidos. O diálogo limita sua largura a 490 px, ao viewport menos 28 px e a 90dvh, com rolagem interna.

## Elevation & Depth

O painel é separado principalmente por mudanças de tom e bordas finas. Sombras difusas dão relevo à ação principal, à demonstração pública e aos diálogos. O código não usa sombras com deslocamento duro.

### Shadow Vocabulary

- **Ação:** `0 8px 20px #0208193d`, na ação azul principal.
- **Demonstração:** `0 22px 55px #0005`, na janela pública do produto.
- **Diálogo:** `0 28px 80px #0007`, com backdrop escuro `#020715bf`.

### Named Rules

**The Quiet Surface Rule.** Separe os painéis operacionais com tom e borda; reserve a sombra ampla para a demonstração em destaque e o diálogo.

## Shapes

Cantos suavizados e contornos de um pixel dão forma aos controles e painéis. O frontmatter registra a sequência observada: cantos compactos em etiquetas, intermediários em campos e botões, mais amplos em painéis, diálogo e apresentação. As bolinhas de legenda, avatares e o gráfico de rosca mantêm seus círculos funcionais. A fita N é uma imagem de marca e não um molde para contornar todos os cartões.

## Components

### Buttons

A ação principal é azul, com texto branco, contorno ligeiramente mais claro e sombra curta. O botão padrão tem altura mínima de 46 px e o recuo registrado no frontmatter. O hover escurece o fundo, clareia o contorno e desloca o botão um pixel para cima. O botão secundário tem fundo escuro e borda visível; seu hover clareia o plano. A variante pequena reduz a altura mínima para 40 px. No painel, alguns comandos usam 42 px de altura e rótulos menores.

Links de texto usam aqua claro, ícone em SVG e sublinhado no hover. Botões, links e summaries recebem contorno de foco aqua de 3 px com afastamento de 5 px. Elementos desabilitados usam opacidade de 0.5 e cursor de espera.

### Chips

A etiqueta de contexto Open Finance usa um plano azul escuro, texto azul claro, cantos compactos e rótulo de 11 px. Serve como informação; não representa por si só conexão ativa. Os filtros por pessoa são um grupo segmentado: base escura com borda, opção selecionada mais clara e texto de maior contraste.

### Cards / Containers

Os painéis operacionais usam a superfície `panel`, borda `border` e cantos `panel`, sem sombra geral. As estatísticas têm recuo de 20 px. Cabeçalhos e linhas internas organizam o conteúdo com divisórias e recuos próprios. O saldo usa `balance-blue`; o total, sua descrição e o período precisam continuar reconhecíveis. A janela pública tem cantos maiores, sombra difusa e uma barra superior que identifica os valores fictícios.

### Inputs / Fields

Busca, inputs e selects usam plano escuro, texto claro, borda visível e cantos de campo. O foco recebe contorno aqua de 2 px com afastamento de 2 px. O placeholder fica em azul acinzentado. Campos somente leitura ganham um plano mais claro e texto mais suave. Erros de formulário usam fundo vinho escuro, borda e texto rosado; não há estado de erro global para todo componente.

### Navigation

A navegação operacional combina SVG, texto e nomes acessíveis explícitos nos botões. O item ativo tem plano azul, texto claro e peso maior; no celular, o estado ativo fica na cor de ícone e rótulo, sem o plano. A navegação pública usa links de seção e deixa de aparecer em até 600 px, preservando a entrada do painel. A demonstração oferece abas horizontais em até 820 px, quando sua barra lateral fica oculta. A transição de barra lateral para navegação inferior está descrita em Layout.

### Guides and disclosure

O guia compartilhado usa uma lista ordenada, número Sora em azul, título e descrição; divisórias organizam os passos. A FAQ usa `details` e `summary`, com ícone SVG que gira na abertura. O estado de integração fica em um bloco de informação próprio e o guia do painel acompanha a contagem de conexões retornada pelos dados. A única animação de apresentação revela o monograma por recorte em 1.1 s; interações de botão usam transições de 0.18 s. A preferência de movimento reduzido remove animações, transições e rolagem suave.

## Do's and Don'ts

### Do:
- **Do** preserve o monograma N fornecido e a relação entre Sora e Inter.
- **Do** use azul na ação principal, aqua para entradas e violeta para saídas, acompanhados de texto ou legenda.
- **Do** mantenha o valor principal e sua descrição juntos, com algarismos tabulares nos dados financeiros.
- **Do** mantenha visíveis a identificação dos exemplos públicos e o estado de autorização ou configuração do painel.
- **Do** ofereça o foco visível e respeite a preferência de movimento reduzido.

### Don't:
- **Don't** apresente os valores da demonstração como registros reais.
- **Don't** apresente os bancos como conectados antes da configuração e da autorização de cada titular.
- **Don't** altere as cores do monograma ou aplique um fundo sólido à imagem transparente.
- **Don't** transforme os detalhes de uma página pública em regras obrigatórias para todas as telas operacionais.


**Not canonized:** o código contém rótulo de navegação e legenda de apresentação em maiúsculas com espaçamento expandido, além do ícone informativo representado pelo glifo de texto `i`. São detalhes herdados que não viram padrões para novas superfícies. Os rótulos SVG dos gráficos agora usam 11 px; navegação de mês e fechamento de diálogo usam SVG. O grafite pedido no briefing (`#0F172A`) não está declarado no CSS atual; esta extração registra o canvas implementado, sem tratar a diferença como decisão aprovada. Nenhum desses pontos foi reparado neste registro, e a ausência de capturas impede uma conclusão visual sobre contraste, sobreposição e legibilidade.
