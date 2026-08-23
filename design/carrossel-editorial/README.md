# Design System — Carrossel Editorial

Sistema de identidade para carrossel editorial de Instagram (@mktcomcled).

**Canvas publicada (visual, editável):**
https://claude.ai/code/artifact/e5f3f679-b283-4c6b-b073-d3c1713d2cfc

Este diretório guarda o código-fonte dos artboards que geram essa canvas —
use-o como referência versionada e ponto de partida para futuras edições.

## Arquivos

| Arquivo | Conteúdo |
|---|---|
| `Main.dc.html` | Capa/overview do design system |
| `Tokens.dc.html` | Tokens de cor + especimen de tipografia |
| `Components.dc.html` | Os 6 componentes de slide (kicker, headline-invadida, grifo-acento, bloco-corpo, numerador, assinatura) |
| `Rules.dc.html` | Checklist "nunca fazer" + voz visual + grid rápido |
| `Slide1.dc.html` … `Slide8.dc.html` | Template do carrossel de 8 slides, 1080×1350, com a linguagem já aplicada |
| `canvas.json` | Layout das duas páginas ("Sistema" e "Carrossel — template") na canvas |

## 0. Princípio central

A identidade não vem do template. Vem do **tratamento de cor aplicado a toda foto**.

Toda imagem, venha de onde vier, passa pela mesma grade:

- Dessaturar entre 40% e 60%
- Puxar sombras e meios-tons para o tom da marca (`--grade`)
- Escurecer globalmente (exposição −15% a −25%)
- Contraste médio-alto, pretos abertos (não estourar em preto puro)
- Grão sutil opcional (2–4%)

Sem esse passo, o resto do sistema não sustenta identidade. Com ele, foto de
banco de imagem genérica vira peça de marca.

> Nos slides deste diretório, o fundo "gradado" é um gradiente placeholder
> simulando esse tratamento — troque pelas fotos reais já tratadas.

## 1. Cor

| Token | Hex | Papel |
|---|---|---|
| `--grade` | `#2F3B2A` | Tom da grade de cor sobre foto (verde-oliva escuro) |
| `--acento` | `#C4F82A` | Neon de destaque (verde-limão). Grifo, nunca fundo |
| `--claro` | `#F2F1ED` | Texto sobre foto, fundos claros |
| `--escuro` | `#141613` | Texto sobre `--acento`, fundos escuros |
| `--neutro-1` | `#8A8F86` | Kicker, numerador, texto secundário |

Proporção por slide: ~70% foto gradada, ~25% tipografia clara, ~5% acento.
O acento nunca ocupa área grande.

Contraste mínimo 4.5:1 na área mais clara da foto — texto sobre foto exige
overlay escuro na região de leitura (gradiente linear de `--grade`, 0%→70%).

## 2. Tipografia

Par escolhido: **Archivo Black + Instrument Serif Italic** (Google Fonts, gratuitas).

| Nível | Família | Peso | Tamanho (base 1080×1350) |
|---|---|---|---|
| Display | Archivo Black | 900 | 130–180px, line-height 0.88 |
| Display itálico | Instrument Serif Italic | 400 | 130–180px, line-height 0.88 |
| Kicker | Archivo | 500 | 22px, tracking +0.18em, caixa baixa |
| Corpo | Archivo | 400 | 34–40px, line-height 1.25 |
| Micro | Archivo | 400 | 24px |
| Numerador | Archivo | 500 | 24px |

Em toda headline, 1 a 2 palavras trocam para o itálico serifado — a palavra
que carrega a tensão da frase, não o substantivo genérico.

## 3. Grid e espaçamento

- Formato: **1080 × 1350px** (4:5)
- Unidade base: **8px**
- Margem de segurança: **80px** em todos os lados
- Zona morta inferior: últimos **120px** livres de texto crítico
- Headline ancorada no terço superior; corpo ancorado na base, acima da zona morta

## 4. Componentes de slide

- **kicker** — 3 fragmentos (esquerda/centro/direita) formando uma frase única:
  `sua marca` · `para outro` · `patamar`. Aparece em todo slide.
- **headline-invadida** — display sobre a foto, sujeito passando na frente de
  parte do texto (recorte/máscara).
- **grifo-acento** — caixa sólida em `--acento`, 2 a 4 palavras, máx. 2 por slide.
- **bloco-corpo** — 2 a 4 linhas na base, palavras-chave com grifo ou sublinhado.
- **numerador** — canto inferior, formato `03/08`.
- **assinatura** — slide final: `@mktcomcled` + CTA.

## 5. Estrutura padrão (8 slides)

| Slide | Componentes |
|---|---|
| 1 — Capa | kicker + headline-invadida + bloco-corpo curto |
| 2 — Tensão | kicker + headline média + bloco-corpo |
| 3–6 — Desenvolvimento | kicker + título curto + bloco-corpo + numerador |
| 7 — Virada | kicker + headline-invadida + grifo-acento |
| 8 — CTA | kicker + frase de ação + assinatura |

## 6. Regras — o que nunca fazer

1. Nunca usar foto sem a grade de cor aplicada
2. Nunca mais de 2 grifo-acento por slide
3. Nunca texto crítico nos 120px inferiores
4. Nunca mais de 2 famílias tipográficas na peça
5. Nunca headline com mais de 7 palavras
6. Nunca `--acento` como cor de texto sobre foto
7. Nunca centralizar a headline
8. Nunca omitir o kicker, mesmo em slide cheio

## 7. Voz visual

**É:** editorial, adulto, confiante, com respiro.
**Não é:** infográfico, corporativo genérico, colorido, cheio de ícone, "template de Canva".

## Pendências antes de usar em produção

- [ ] Substituir os fundos placeholder pelas fotos reais tratadas
- [ ] Substituir a forma orgânica dos slides 1 e 7 pelo recorte real do sujeito
- [ ] Revisar/ajustar a CTA do slide 8 ("Guarda esse carrossel e comece o seu.")
- [ ] Validar contraste 4.5:1 em cada foto real usada
