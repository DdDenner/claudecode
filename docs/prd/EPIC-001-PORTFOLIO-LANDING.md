# EPIC 1: Portfólio Online - Landing Page de Design Gráfico

**Epic ID:** EPIC-001  
**Criado em:** 2026-04-09  
**Status:** Draft  
**Proprietário:** @pm (Morgan)  
**Timeline:** 4-6 semanas  

---

## 📋 Visão Geral

Criar e publicar uma **landing page profissional** que showcase o portfólio de design gráfico de **Denner**, apresentando 10-15 dos melhores projetos desenvolvidos, com foco em impacto visual e conversão de clientes.

## 🎯 Objetivo Estratégico

Estabelecer presença digital profissional que:
- ✅ Demonstre expertise em design gráfico (identidades, embalagens, flyers, sinalizações)
- ✅ Converta visitantes em leads/clientes potenciais
- ✅ Seja responsivo (mobile, tablet, desktop)
- ✅ Otimizado para SEO local (Belo Horizonte)
- ✅ Facilite contato e orçamentos

## 👥 Público-Alvo

- **Principais:** Pequenas/médias empresas em BH buscando identidade visual ou redesign
- **Secundário:** Agências que querem terceirizar design gráfico
- **Terciário:** Clientes que precisam de materiais impressos customizados

---

## ✅ Critério de Aceitação (Épico)

- [ ] 10-15 projetos selecionados e curados
- [ ] Wireframes e mockups da landing page aprovados
- [ ] Landing page publicada em domínio próprio
- [ ] Integração de formulário de contato funcional
- [ ] Galeria responsiva com otimização de imagens
- [ ] Página em produção com tempo de carregamento < 3s
- [ ] Analytics e rastreamento de conversão ativo
- [ ] SEO básico implementado

---

## 🏗️ Breakdown em Stories

### **Fase 1: Curação & Documentação** (1-2 semanas)

#### **Story 1.1** - Selecionar 10-15 Projetos Top
**Agente:** @dev (Dex)  
**Tamanho:** Small  
**Descrição:** Revisar os 37 projetos do Google Drive + 52+ da pasta local "Artes" e selecionar os 10-15 mais impactantes visualmente para a landing page.

**Entrada:**
- Lista de 37 projetos do Drive (catalogados)
- Pasta local: C:\Users\denne\OneDrive\Área de Trabalho\Artes
- Critério: Impacto visual, diversidade de tipos, qualidade de execução

**Critério de Aceitação:**
- [ ] 10-15 projetos selecionados
- [ ] Cada projeto tem 1-2 imagens de alta qualidade (.jpg export)
- [ ] Lista atualizada em documento compartilhado
- [ ] Aprovação de Denner

**Saída:** `docs/stories/portfolio-projects-selected.md`

---

#### **Story 1.2** - Organizar Projetos por Categoria
**Agente:** @ux-design-expert (Uma)  
**Tamanho:** Small  
**Descrição:** Categorizar os 10-15 projetos selecionados por tipo (Identidade Visual, Embalagem, Sinalizações, Flyers, Animações, etc)

**Critério de Aceitação:**
- [ ] Projetos organizados em 4-6 categorias principais
- [ ] Cada projeto tem título, categoria, cliente (se aplicável), descrição breve
- [ ] Imagens nomeadas consistentemente

**Saída:** `docs/stories/portfolio-structure.md`

---

#### **Story 1.3** - Criar Fichas Descritivas
**Agente:** @dev (Dex)  
**Tamanho:** Small  
**Descrição:** Criar uma ficha para cada projeto com: título, categoria, descrição breve (50-100 palavras), cliente, resultado/impacto.

**Critério de Aceitação:**
- [ ] 10-15 fichas descritivas completas
- [ ] Linguagem profissional mas acessível
- [ ] Cada ficha tem CTA claro (ex: "Veja case completo")

**Saída:** `docs/stories/portfolio-cards.md`

---

### **Fase 2: Design & Arquitetura** (1-2 semanas)

#### **Story 2.1** - Criar Wireframes e Mockups
**Agente:** @ux-design-expert (Uma)  
**Tamanho:** Medium  
**Descrição:** Design visual completo da landing page com mockups para mobile, tablet e desktop.

**Seções Obrigatórias:**
1. **Hero Section** - Logo, headline, CTA principal
2. **Portfólio Grid** - Galeria dos 10-15 projetos
3. **Filtros** (opcional) - Por categoria
4. **About/Expertise** - Breve sobre Denner e especialidades
5. **CTA Section** - Chamada para contato
6. **Footer** - Links e redes sociais

**Critério de Aceitação:**
- [ ] Wireframes baixa fidelidade
- [ ] Mockups alta fidelidade (Figma/Adobe XD)
- [ ] Versão mobile, tablet, desktop
- [ ] Design system (cores, tipografia, espaçamento)

**Saída:** `docs/stories/portfolio-design-mockups.figma` (link compartilhado)

---

#### **Story 2.2** - Definir Tecnologia & Arquitetura
**Agente:** @architect (Aria)  
**Tamanho:** Small  
**Descrição:** Escolher stack tecnológico para a landing page.

**Opções a Avaliar:**
1. **Next.js + Vercel** (recomendado - performance, SEO, fácil deploy)
2. **Astro + Netlify** (estático, muito rápido)
3. **Webflow/Framer** (visual, sem código)
4. **HTML/CSS/JS puro** (controle total, mais trabalho)

**Critério de Aceitação:**
- [ ] Tecnologia escolhida e justificada
- [ ] Estrutura de pastas definida
- [ ] Pipeline de CI/CD planejado
- [ ] Hosting selecionado

**Saída:** `docs/architecture/portfolio-tech-stack.md`

---

### **Fase 3: Implementação** (2-3 semanas)

#### **Story 3.1** - Implementar Estrutura HTML/CSS
**Agente:** @dev (Dex)  
**Tamanho:** Medium  
**Descrição:** Codificar a estrutura base da landing page com responsividade.

**Critério de Aceitação:**
- [ ] HTML semântico bem estruturado
- [ ] CSS responsivo (mobile-first)
- [ ] Todas as seções implementadas
- [ ] Tempo de carregamento < 3s (via Lighthouse)
- [ ] Sem erros de console

**Saída:** Repositório GitHub `portfolio-landing`

---

#### **Story 3.2** - Integrar Galeria de Projetos
**Agente:** @dev (Dex)  
**Tamanho:** Medium  
**Descrição:** Implementar galeria interativa com cards dos projetos.

**Features:**
- Grid responsivo (2-3-4 colunas conforme tela)
- Imagens otimizadas (WebP + fallback JPG)
- Hover effects profissionais
- Modal/lightbox ao clicar (opcional)
- Filtros por categoria (opcional)

**Critério de Aceitação:**
- [ ] Todos os 10-15 projetos carregando
- [ ] Imagens otimizadas (max 100KB cada)
- [ ] Filtros funcionando (se implementado)
- [ ] Performance em conexão lenta OK

**Saída:** Feature branch no repositório

---

#### **Story 3.3** - Implementar Formulário de Contato
**Agente:** @dev (Dex)  
**Tamanho:** Small  
**Descrição:** Criar formulário de contato integrado com email.

**Opções:**
1. **FormSpree** ou **Getform** (sem backend)
2. **Node.js + nodemailer** (backend próprio)
3. **WhatsApp link direto** (mais simples)

**Campos Obrigatórios:**
- Nome
- Email
- Assunto/Tipo de projeto
- Mensagem breve

**Critério de Aceitação:**
- [ ] Formulário funcional e validado
- [ ] Email chegando em inbox
- [ ] UX clara e intuitiva
- [ ] Mensagem de sucesso após envio

**Saída:** Feature implementada

---

#### **Story 3.4** - Otimização e QA
**Agente:** @qa (Quinn)  
**Tamanho:** Small  
**Descrição:** Testes de compatibilidade, performance, acessibilidade.

**Testes:**
- [ ] Cross-browser (Chrome, Firefox, Safari, Edge)
- [ ] Responsive em 5+ tamanhos de tela
- [ ] Performance (Lighthouse score > 90)
- [ ] SEO básico (meta tags, título, descrição)
- [ ] Acessibilidade (WCAG 2.1 AA)

**Saída:** Relatório de QA + ajustes

---

### **Fase 4: Deploy & Publicação** (1 semana)

#### **Story 4.1** - Configurar Domínio & Hospedagem
**Agente:** @devops (Gage)  
**Tamanho:** Small  
**Descrição:** Comprar domínio e configurar hospedagem.

**Tarefas:**
- [ ] Escolher domínio (ex: denner.design, dennerdesign.com, etc)
- [ ] Configurar hospedagem (Vercel, Netlify, ou tradicional)
- [ ] SSL/HTTPS ativo
- [ ] DNS configurado
- [ ] Email de domínio (opcional)

**Saída:** Domínio ativo e acessível

---

#### **Story 4.2** - Deploy da Landing Page
**Agente:** @devops (Gage)  
**Tamanho:** Small  
**Descrição:** Deploy da aplicação em produção.

**Critério de Aceitação:**
- [ ] Build funcionando
- [ ] Código em produção
- [ ] CI/CD configurado para deploy automático
- [ ] Rollback plan documentado

**Saída:** Landing page live

---

#### **Story 4.3** - Configurar Analytics & SEO
**Agente:** @dev (Dex)  
**Tamanho:** Small  
**Descrição:** Implementar rastreamento e otimizações SEO.

**Tarefas:**
- [ ] Google Analytics 4 instalado
- [ ] Google Search Console configurado
- [ ] Sitemap.xml gerado
- [ ] robots.txt configurado
- [ ] OG tags para redes sociais
- [ ] Schema.org markup (portfolio)

**Saída:** Analytics e SEO prontos

---

## 📊 Estimativas

| Fase | Semanas | Agentes Principais |
|------|---------|-------------------|
| 1: Curação | 1-2 | @dev, @ux-design-expert |
| 2: Design | 1-2 | @ux-design-expert, @architect |
| 3: Implementação | 2-3 | @dev, @qa |
| 4: Deploy | 1 | @devops, @dev |
| **TOTAL** | **5-8 semanas** | Equipe multidisciplinar |

## 🎯 Success Metrics

- ✅ **Conversion Rate:** Mínimo 2% (lead/visita)
- ✅ **Page Speed:** Lighthouse score > 90
- ✅ **Mobile Score:** > 95
- ✅ **SEO:** Ranking para "design gráfico bh" top 3
- ✅ **Uptime:** 99.9%

## 📁 Recursos Catalogados

**Google Drive:** 37 projetos (links em `docs/portfolio-drive-links.md`)  
**Local:** Pasta "Artes" com 50+ arquivos CorelDRAW  
**Selecionados:** 10-15 melhores para exibição  

## 🚀 Próximos Passos

1. ✅ Epic criado em draft
2. ⏭️ @sm (Scrum Master) criará stories individuais
3. ⏭️ @po (Product Owner) validará requirement
4. ⏭️ @dev começará implementação na Story 1.1

---

**Criado por:** Morgan (PM)  
**Data:** 2026-04-09  
**Status:** PRONTO PARA EXECUÇÃO
