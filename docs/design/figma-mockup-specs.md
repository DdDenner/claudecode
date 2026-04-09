# Especificação de Mockups Figma - Portfólio Landing Page

**Status:** ✅ Especificação Pronta para Figma  
**Data:** 2026-04-09  
**Designer:** Uma (@ux-design-expert)  
**Timeline:** MVP Rápido (2 horas de design)  

---

## 📐 Instruções para Criar no Figma

Este documento especifica exatamente o que precisa estar no Figma. Siga para criar os mockups de alta fidelidade.

### Arquivo Figma
- **Nome:** `Portfólio Denner Design - Landing Page MVP`
- **Breakpoints:** 
  - Desktop: 1440px
  - Mobile: 375px
- **Frames:** 2 principais (Desktop + Mobile)

---

## 🖼️ SEÇÃO 1: HERO (Desktop 1440px)

**Dimensions:** 1440 x 600px  
**Background:** Linear gradient #1a1a1a → rgba(26,26,26,0.7)  

### Layout Hero
```
┌─────────────────────────────────────────────┐
│  HEADER (sticky, 80px)                      │
│  [Logo] "Denner Design"     Nav links right │
├─────────────────────────────────────────────┤
│                                             │
│        Denner Design                        │
│    Especialista em Design Gráfico           │
│    para Sua Identidade Visual               │
│                                             │
│      [ Veja Meu Portfólio ]                 │
│                                             │
│        (Background: Dark + gradient)        │
│                                             │
└─────────────────────────────────────────────┘
```

**Elements:**
- H1: "Denner Design" (56px, weight 700, color #ffffff)
- Subheading: "Especialista em Design Gráfico..." (20px, weight 400, color #e6e6e6)
- CTA Button: "Veja Meu Portfólio" (Primary style)
  - Background: #0066cc
  - Text: #ffffff
  - Padding: 16px 32px
  - Border-radius: 8px
  - Hover: opacity 0.9

---

## 📸 SEÇÃO 2: PORTFOLIO GRID (Desktop 1440px)

**Dimensions:** 1440 x auto (4 colunas × ~4 linhas = ~15 cards)  
**Padding:** 64px 32px  
**Section Title:** "Meus Trabalhos Recentes" (36px, weight 600)  

### Grid Specs
- **Columns:** 4 (desktop)
- **Gap:** 20px
- **Card Size:** ~310px × 310px (4:3 aspect ratio)

### Card Component (Atom)
```
┌──────────────────┐
│                  │
│  PROJECT IMAGE   │ (310 x 232px, 4:3)
│  (4:3 aspect)    │
│                  │
├──────────────────┤
│ Project Title    │ (14px, weight 600)
│ Categoria Badge  │ (12px, bg #0066cc, color #fff)
└──────────────────┘
```

**Card Hover State:**
- Scale: 1.05
- Box Shadow: 0 12px 24px rgba(0,0,0,0.2)
- Overlay: rgba(0,102,204,0.1)
- Cursor: pointer

**Cards to Display:**
1. Alpha Noivas
2. Bio Actif
3. Malt Imobiliária
4. Cozinha da Drica
5. Salão da Lela
6. See through Cabelereia
7. Seetru Espeto na Brasa
8. Pavio Mágico Jr
9. Helen Multi Acessórios
10. SALGADOS RIQUETTE
11. Rádio Radar
12. Flyer Terapia
13. Bar e Mercearia Gomes
14. Chefya Íntima

---

## 👤 SEÇÃO 3: ABOUT (Desktop 1440px)

**Dimensions:** 1440 x 400px  
**Padding:** 64px 32px  
**Layout:** 2 columns (50% / 50%)  
**Background:** #f5f5f5  

### Column 1 (Image)
- Placeholder: Image ou illustration (300x300px)
- Border-radius: 12px

### Column 2 (Text)
```
Especialista em design gráfico desde 2015

Minha especialidade:
• Identidade Visual
• Embalagem Premium
• Sinalizações Comerciais
• Materiais Impressos Customizados

Trabalhando com empresas em BH e região
para transformar ideias em designs incríveis.
```

**Typography:**
- H2: "Especialista em design gráfico..." (28px, weight 600)
- Body: "Minha especialidade:" (16px, weight 500)
- List items: (16px, weight 400)

---

## 📧 SEÇÃO 4: CONTACT CTA (Desktop 1440px)

**Dimensions:** 1440 x 300px  
**Padding:** 48px 32px  
**Background:** #0066cc (accent color)  
**Text Color:** #ffffff  

### Layout
```
Vamos criar algo incrível juntos?
Envie uma mensagem e vamos conversar!

[Formulário simples]
- Nome
- Email
- Tipo de Projeto (dropdown)
- Mensagem

[ ENVIAR MENSAGEM ]  [ WHATSAPP ]
```

**Form Fields:**
- Input: 48px height, padding 12px 16px, border-radius 8px
- Textarea: 120px height, same styling
- Placeholder color: #999
- Focus: 2px solid outline, color #ffffff

**Buttons:**
- Primary: "ENVIAR MENSAGEM" (bold, white bg → transparent, outline white)
- Secondary: "WHATSAPP" (outline style)

---

## 🔗 FOOTER (Desktop 1440px)

**Dimensions:** 1440 x 120px  
**Background:** #1a1a1a  
**Text Color:** #ffffff / #e6e6e6  
**Padding:** 32px  

### Layout
```
© 2026 Denner Design     hello@denner.design
Belo Horizonte, MG       (61) 98765-4321

[📘 Facebook] [📷 Instagram] [📺 YouTube]
```

**Typography:**
- Copyright: 14px, weight 400, color #808080
- Contact info: 14px, weight 400, color #ffffff
- Social icons: 24px, hover color #0066cc

---

## 📱 MOBILE LAYOUT (375px)

All sections stack vertically with 1-column layout.

### Hero Mobile
- Height: 400px
- H1: 32px
- CTA: Full width
- Padding: 16px

### Portfolio Grid Mobile
- Columns: 2
- Card size: ~175px × 175px
- Gap: 12px
- Padding: 20px 16px

### About Mobile
- 1 column
- Image: 100% width
- Padding: 20px

### Contact Mobile
- Form full width
- Buttons: Stacked vertical
- Padding: 20px

### Footer Mobile
- Text centered
- Stacked vertically
- Font size: 12px
- Padding: 16px

---

## 🎨 Design System Tokens (Use in Figma)

### Colors
- **Primary Dark:** #1a1a1a
- **Primary Light:** #ffffff
- **Accent:** #0066cc
- **Gray 200:** #e6e6e6
- **Gray 500:** #808080
- **Gray 900:** #0a0a0a
- **Background Light:** #f5f5f5

### Typography
- **Heading Font:** Inter, Poppins (System fallback)
- **Body Font:** Inter, Open Sans (System fallback)
- **H1:** 56px / 700 / +2% letter-spacing
- **H2:** 36px / 600
- **H3:** 20px / 600
- **Body:** 16px / 400 / line-height 1.6
- **Small:** 14px / 400 / line-height 1.5

### Spacing (8px grid)
- xs: 4px
- sm: 8px
- md: 16px
- lg: 24px
- xl: 32px
- 2xl: 48px
- 3xl: 64px

### Border Radius
- Small: 4px
- Default: 8px
- Large: 12px

### Shadows
- Subtle: 0 4px 12px rgba(0,0,0,0.1)
- Medium: 0 8px 24px rgba(0,0,0,0.15)
- Large: 0 12px 36px rgba(0,0,0,0.2)

---

## ✅ Checklist para Figma

Desktop Frame (1440px):
- [ ] Hero section com gradient + CTA
- [ ] Portfolio Grid 4 colunas com 14 cards
- [ ] About section 2 colunas
- [ ] Contact form seção
- [ ] Footer
- [ ] Header sticky (80px)

Mobile Frame (375px):
- [ ] Hero responsivo
- [ ] Portfolio Grid 2 colunas
- [ ] About 1 coluna
- [ ] Contact form mobile
- [ ] Footer mobile
- [ ] Header mobile

Components (Reusable):
- [ ] Button (Primary, Secondary, Ghost)
- [ ] Card (Portfolio project card)
- [ ] Input (Form input)
- [ ] Badge (Category badge)
- [ ] Navigation (Header nav)

---

## 🎬 Próximas Ações

1. **Criar arquivo Figma** com esta especificação
2. **Compartilhar link** em `docs/design/figma-link.txt`
3. **Export componentes** como imagens PNG/SVG se necessário para refs
4. **Ready for Story 3.1** - Dex implementar HTML/CSS

---

**Status:** ✅ Especificação Pronta | Aguardando criação em Figma

— Uma, desenhando com empatia 💝
