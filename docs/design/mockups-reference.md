# Mockups Reference - Portfólio Landing Page

**Status:** Reference for Uma's Figma design  
**Fidelity:** Low (ASCII layouts) — High fidelity in Figma  
**Breakpoints:** Mobile (375px), Tablet (768px), Desktop (1440px)

---

## 📱 MOBILE LAYOUT (375px)

```
┌─────────────────────────────────────┐
│         HEADER / NAV                │  (60px)
│  Logo    Menu                       │
├─────────────────────────────────────┤
│                                     │
│        HERO SECTION                 │  (400px)
│        Denner Design                │
│    Design para seus negócios        │  Centered
│                                     │
│      [ COMEÇAR ]  (CTA Button)      │
│                                     │
├─────────────────────────────────────┤
│                                     │
│    PORTFOLIO GRID (2 colunas)       │  (20px gap)
│                                     │
│  ┌──────────┐  ┌──────────┐        │
│  │ Project  │  │ Project  │        │
│  │  Image   │  │  Image   │        │
│  │ 4:3 AR   │  │ 4:3 AR   │  Card format:
│  │          │  │          │  - Image (80%)
│  │ Title    │  │ Title    │  - Title
│  │ Category │  │ Category │  - Category tag
│  └──────────┘  └──────────┘        │  - Hover overlay
│                                     │
│  ┌──────────┐  ┌──────────┐        │
│  │ Project  │  │ Project  │        │
│  └──────────┘  └──────────┘        │
│                                     │
│  ... (more cards)                   │
│                                     │
├─────────────────────────────────────┤
│                                     │
│    ABOUT SECTION                    │  (240px)
│    "Especialista em Design          │
│     Gráfico desde 2015"             │  Single column
│                                     │  Simplified for mobile
│    • Identidade Visual              │
│    • Embalagem                      │
│    • Sinalizações                   │
│                                     │
├─────────────────────────────────────┤
│                                     │
│    CONTACT CTA                      │  (180px)
│    "Vamos criar algo incrível?"     │
│                                     │  Accent background
│    [ ENVIAR MENSAGEM ]              │  Center-aligned
│    ou  [ WHATSAPP ]                 │
│                                     │
├─────────────────────────────────────┤
│         FOOTER                      │  (120px)
│  © 2026 Denner Design               │
│  Belo Horizonte, MG                 │
│  hello@denner.design                │
│                                     │
│  Social: [📘] [📷] [📺]             │
└─────────────────────────────────────┘
```

---

## 💻 DESKTOP LAYOUT (1440px)

```
┌─────────────────────────────────────────────────────────────────┐
│             HEADER / NAVIGATION (80px fixed)                    │
│  [Logo] "Denner Design"            Home  Portfólio  Sobre  Contato
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                          HERO SECTION (600px)                   │
│                                                                 │
│                    Denner Design                                │
│        Especialista em Design Gráfico                           │
│         para Sua Identidade Visual                              │
│                                                                 │
│                    [ Veja Meu Portfólio ]                       │
│                                                                 │
│  (Background: Dark + subtle gradient + optional hero image)     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│  PORTFOLIO SECTION (Padding: 64px, 32px)                        │
│  (Heading: "Meus Trabalhos Recentes")                           │
│                                                                 │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐        │
│  │ Project  │  │ Project  │  │ Project  │  │ Project  │  Card:
│  │          │  │          │  │          │  │          │  - Image (70%)
│  │ Image    │  │ Image    │  │ Image    │  │ Image    │  - Title + category
│  │ 4:3 AR   │  │ 4:3 AR   │  │ 4:3 AR   │  │ 4:3 AR   │  - Hover: Overlay
│  │          │  │          │  │          │  │          │    + "View case"
│  │ ┌──────┐ │  │ ┌──────┐ │  │ ┌──────┐ │  │ ┌──────┐ │
│  │ │Branding│ │  │Embalagem│  │Flyers │  │Sinalização│
│  │ └──────┘ │  │ └──────┘ │  │ │      │  │ └──────┘ │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘
│                                                                 │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐        │
│  │ Project  │  │ Project  │  │ Project  │  │ Project  │        │
│  │ Image    │  │ Image    │  │ Image    │  │ Image    │        │
│  │ 4:3 AR   │  │ 4:3 AR   │  │ 4:3 AR   │  │ 4:3 AR   │        │
│  │          │  │          │  │          │  │          │        │
│  │ Title    │  │ Title    │  │ Title    │  │ Title    │        │
│  │ Category │  │ Category │  │ Category │  │ Category │        │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘        │
│                                                                 │
│  ... (continue grid, 4 columns, total 12-15 projects)          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│  ABOUT SECTION (2 columns, 400px height)                        │
│                                                                 │
│  ┌────────────────┐  ┌──────────────────────────────────────┐  │
│  │                │  │ Especialista em design gráfico       │  │
│  │  Image ou      │  │ desde 2015 (ou similar)              │  │
│  │  Illustration  │  │                                      │  │
│  │                │  │ Minha especialidade:                 │  │
│  │  (300x300)     │  │ • Identidade Visual                  │  │
│  │                │  │ • Embalagem Premium                  │  │
│  │                │  │ • Sinalizações Comerciais            │  │
│  │                │  │ • Materiais Impressos Customizados   │  │
│  │                │  │                                      │  │
│  │                │  │ Trabalhando com empresas em BH e     │  │
│  │                │  │ região para transformar ideias em    │  │
│  │                │  │ designs incríveis.                   │  │
│  └────────────────┘  └──────────────────────────────────────┘  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│  CONTACT / CTA SECTION (Accent background, 300px)               │
│                                                                 │
│              Vamos criar algo incrível juntos?                  │
│           Envie uma mensagem e vamos conversar!                 │
│                                                                 │
│    ┌──────────────────────────────────┐                         │
│    │  Nome                            │                         │
│    └──────────────────────────────────┘                         │
│    ┌──────────────────────────────────┐                         │
│    │  Email                           │                         │
│    └──────────────────────────────────┘                         │
│    ┌──────────────────────────────────┐                         │
│    │  Tipo de Projeto                 │ ▼                      │
│    └──────────────────────────────────┘                         │
│    ┌──────────────────────────────────┐                         │
│    │  Mensagem...                     │                         │
│    │                                  │                         │
│    │                                  │                         │
│    └──────────────────────────────────┘                         │
│                                                                 │
│           [ ENVIAR MENSAGEM ]          [ WHATSAPP ]             │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                        FOOTER (120px)                           │
│                                                                 │
│  © 2026 Denner Design     |     hello@denner.design             │
│  Belo Horizonte, MG       |     (61) 98765-4321                 │
│                           |                                     │
│                     [📘 Facebook] [📷 Instagram] [📺 Youtube]    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📐 TABLET LAYOUT (768px)

```
Híbrido entre Mobile e Desktop:

Header:
- Logo + menu (horizontal)

Hero:
- Similar ao desktop, mas menor
- CTA buttons stacked ou side-by-side

Portfolio Grid:
- 3 colunas (em vez de 4)
- Mesmo spacing que desktop

About:
- 2 colunas (desktop-like)
- OU 1 coluna se espaço limitado

Contact Form:
- Full width
- Inputs stacked

Footer:
- 2-3 colunas (em vez de 4)
```

---

## 🎨 Color Application

### Hero Section
- **Background:** Primary (#1a1a1a) + gradient overlay
- **Text:** Secondary (#ffffff)
- **CTA Button:** Accent (#0066cc) fill with white text

### Portfolio Cards
- **Background:** White (#ffffff)
- **Text:** Primary (#1a1a1a)
- **Hover:** Subtle gray background (#f5f5f5) + accent border
- **Category Badge:** Accent background (#0066cc) with white text

### About Section
- **Background:** Light gray (#f5f5f5) or white
- **Text:** Primary (#1a1a1a)
- **Highlights:** Accent color

### Contact Section
- **Background:** Accent (#0066cc) or primary (#1a1a1a)
- **Text:** Secondary/white (#ffffff)
- **Inputs:** White with primary border on focus

### Footer
- **Background:** Primary (#1a1a1a)
- **Text:** Light (#ffffff, #e6e6e6)

---

## 🎯 Key Micro-interactions

1. **Portfolio Card Hover:** Scale 1.05 + subtle shadow increase
2. **Link Hover:** Accent color with underline
3. **Button Hover:** Opacity 0.9 + slight scale
4. **Form Focus:** 2px accent outline
5. **Scroll:** Fade-in animations for sections (if not violating `prefers-reduced-motion`)

---

## ✅ Checklist for Figma Design

- [ ] Hero section with proper copy, sizing, and CTA
- [ ] Portfolio grid template (1 card only, replicate for 15)
- [ ] About section layout
- [ ] Contact form layout
- [ ] Footer layout
- [ ] Mobile (375px), Tablet (768px), Desktop (1440px) variants
- [ ] Color palette defined (6 colors minimum)
- [ ] Typography scale applied (H1, H2, H3, body, small)
- [ ] Component variants: Button (primary, secondary, ghost)
- [ ] Export: Design system specs as frame or doc
- [ ] Share Figma link in `docs/design/figma-link.txt`

**Created by:** Uma (@ux-design-expert)  
**Next Step:** Build Figma file with above specifications
