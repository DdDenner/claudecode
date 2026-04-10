# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains **Agent 1: Social Media Post Generator** — a Node.js CLI application that generates social media content for Denner, a graphic designer based in Belo Horizonte expanding into digital social content creation.

The agent generates:
- 6 weekly post ideas for Instagram and LinkedIn
- Full content templates for selected topics (Instagram captions, LinkedIn posts, hashtags, Stories scripts, image recommendations)
- Output is saved locally as `.txt` files for manual refinement and publishing

**Target Audience**: Business owners and decision-makers (B2B), focus on design value and business impact.

## Architecture

**Single-file design**: The entire agent logic is in `agente1-posts/index.js`. This is intentional for a focused CLI tool.

**Core workflow**:
1. Initialize Anthropic client with environment variable `ANTHROPIC_API_KEY`
2. **Ideation phase**: Call Claude (Opus 4.6) with `PERFIL` (personality/brand profile) and `PROMPT_SUGESTOES` to generate 6 ideas
3. **Content generation**: User selects an idea or provides a custom topic, then Claude generates multi-channel content
4. **Persistence**: User can save output to `posts-gerados/` directory as timestamped files

**Key constants**:
- `PERFIL`: System prompt defining Denner's positioning, experience, target audience, and tone
  - Emphasizes design expertise for digital channels (not physical materials)
  - Professional but approachable tone
  - Focus on business impact, not just aesthetics
- `PROMPT_SUGESTOES`: Template for generating 6 idea suggestions (mix of educational, case studies, behind-the-scenes, tips)
- Output structure for content generation:
  - Instagram (2200 char limit, emojis moderate, WhatsApp/DM CTA)
  - LinkedIn (professional, targets business owners)
  - Hashtags (5 primary + 10 niche)
  - Stories (3 slides, 2 lines max each)
  - Image guidance (creative directions for Denner to execute)

**Model choice**: Claude Opus 4.6 for both ideation and full content generation (supports long 2048-token outputs).

## Common Commands

From `agente1-posts/` directory:

```bash
# Install dependencies (first time only, or if package.json changes)
npm install

# Run the agent
npm start
# or
node index.js

# Set API key before running (Windows)
set ANTHROPIC_API_KEY=sk-ant-...
```

**Environment**: Requires `ANTHROPIC_API_KEY` set. If missing, app warns but continues (will fail at API call).

## Key Implementation Notes

- **Interactive CLI**: Uses Node.js `readline` for synchronous user prompts (`pergunta()` helper)
- **File naming**: Sanitizes topic to create filenames (lowercase, replace spaces with `_`, remove slashes)
- **Markdown structure**: Output uses `##` headers for easy parsing if automated processing is added later
- **Error handling**: Basic try-catch in `main()`, but no retry logic for API failures
- **Model configuration**: Hardcoded to `claude-opus-4-6`; adjust if cost/latency becomes a concern

## Regras de Trabalho

### NUNCA
- Implementar sem mostrar opções primeiro (sempre formato 1, 2, 3)
- Deletar/remover conteúdo sem perguntar primeiro
- Deletar qualquer coisa criada nos últimos 7 dias sem aprovação explícita
- Mudar algo que já estava funcionando
- Fingir que o trabalho está pronto quando não está
- Processar em lote sem validar um primeiro
- Adicionar features que não foram solicitadas
- Usar dados fictícios quando dados reais existem no banco
- Explicar/justificar ao receber crítica (é só corrigir)
- Confiar em output de IA/subagente sem verificação
- Criar do zero quando algo similar existe em diretórios existentes

### SEMPRE
- Apresentar opções no formato "1. X, 2. Y, 3. Z"
- Usar AskUserQuestion tool para esclarecer dúvidas
- Verificar código/componentes existentes antes de criar novos
- Ler schema COMPLETO antes de propor mudanças no banco
- Investigar causa raiz quando erro persiste
- Fazer commit antes de passar para próxima tarefa
- Criar handoff em `docs/sessions/YYYY-MM/` ao final da sessão

## Maintenance Notes

**When to update PERFIL**:
- If Denner's positioning, experience level, or target audience changes
- If new service areas are added (currently excludes physical materials)
- If tone/personality needs adjustment

**When to update PROMPT_SUGESTOES**:
- If post categories or mix (6 types) should change
- If output format needs to be different (currently numbered list with descriptions)

**When to update content generation prompt**:
- If channel strategy changes (e.g., add TikTok, remove LinkedIn)
- If character limits or tone for existing channels change
- If image guidance is no longer needed

**Dependencies**: Only `@anthropic-ai/sdk` (no other frameworks). Keep SDK updated for latest models and features.

## Brazilian/Portuguese Context

- Interface language is Portuguese (pt-BR)
- References to local context (Belo Horizonte, CorelDRAW mastery, B2B market in Brazil)
- All prompts and output structure use Portuguese for clarity with the user
- No translation layer — designed to operate in Portuguese only
