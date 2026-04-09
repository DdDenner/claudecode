# Design System - Portfólio Landing Page

**Versão:** 1.0 MVP  
**Data:** 2026-04-09  
**Agente:** Uma (@ux-design-expert)

---

## 📐 Paleta de Cores

### Cores Primárias
- **Primary (Preto/Cinza Escuro):** `#1a1a1a` — Headlines, CTAs, backgrounds
- **Secondary (Branco):** `#ffffff` — Background, text on dark
- **Accent (Azul/Laranja Mínimalista):** `#0066cc` ou `#ff6b35` — Links, highlights

### Cores Secundárias
- **Gray 200:** `#e6e6e6` — Borders, subtle backgrounds
- **Gray 500:** `#808080` — Secondary text
- **Gray 900:** `#0a0a0a` — Darkest backgrounds

### Gradientes Sugeridos
```
Hero Overlay: linear-gradient(135deg, #1a1a1a 0%, rgba(26,26,26,0.7) 100%)
Card Hover: rgba(0, 102, 204, 0.1) — subtle accent tint
```

---

## 🔤 Tipografia

### Fontes
- **Headlines (H1-H3):** Inter, Poppins, ou Montserrat — Bold 700, Semibold 600
- **Body Text:** Inter, Open Sans, ou Roboto — Regular 400, Medium 500
- **Mono (Code):** Fira Code, JetBrains Mono — Regular 400

### Tamanhos & Weights
```
H1 Hero:       56px / 700 / +2% letter-spacing
H2 Section:    36px / 600 / normal
H3 Card Title: 20px / 600 / normal
Body:          16px / 400 / line-height 1.6
Small Text:    14px / 400 / line-height 1.5
```

### Line Height
- Headlines: 1.2
- Body: 1.6
- Small: 1.5

---

## 📦 Componentes Base (Atoms)

### Button
```
States: Default, Hover, Active, Disabled
Sizes: Small (12px padding), Medium (16px), Large (20px)
Variants: Primary (fill), Secondary (outline), Ghost (text-only)
Border Radius: 8px
```

### Card
```
Background: #ffffff ou #f5f5f5
Border Radius: 12px
Box Shadow: 0 4px 12px rgba(0,0,0,0.1)
Padding: 20px
```

### Input / Textarea
```
Border: 1px solid #e6e6e6
Hover: 1px solid #0066cc
Focus: 2px solid #0066cc (outline-style)
Border Radius: 8px
Padding: 12px 16px
```

### Gallery Grid
```
Desktop: 4 columns
Tablet: 3 columns
Mobile: 2 columns
Gap: 20px (desktop), 16px (tablet), 12px (mobile)
Image Aspect Ratio: 4:3
```

---

## 🎨 Espaciamento (Spacing Scale)

```
4px   → xs (details)
8px   → sm (tight)
12px  → base (compact)
16px  → md (comfortable)
24px  → lg (breathing room)
32px  → xl (sections)
48px  → 2xl (major sections)
64px  → 3xl (hero padding)
```

---

## 🎬 Animações & Micro-interactions

### Hover Effects
- **Cards:** `transform: scale(1.05); transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);`
- **Links:** `color transition: 0.2s ease-out;`
- **Buttons:** `opacity/background transition: 0.2s ease-out;`

### Page Transitions
- **Fade-in:** opacity 0 → 1, duration 0.3s on page load
- **Slide-up:** translateY(20px) → 0, duration 0.5s on sections

### Focus States (Accessibility)
- **Keyboard Focus:** 2px solid outline in accent color, 2px offset
- **Prefers Reduced Motion:** All animations disabled if user setting detected

---

## 📱 Responsividade

### Breakpoints
```
Mobile:       0px - 640px
Tablet:       641px - 1024px
Desktop:      1025px+
```

### Key Changes by Breakpoint
| Element | Mobile | Tablet | Desktop |
|---------|--------|--------|---------|
| Hero H1 | 32px | 40px | 56px |
| Section Padding | 16px | 24px | 32px |
| Grid Columns | 2 | 3 | 4 |
| Gap | 12px | 16px | 20px |

---

## ♿ Acessibilidade (WCAG 2.1 AA)

### Contraste
- **Text on Light:** 4.5:1 (normal text), 3:1 (large text 18pt+)
- **Text on Dark:** Inverted ratios
- **Interactive Elements:** 3:1 minimum

### Color-Blind Safe
- Não confiar **apenas** em cor para diferenciar estados
- Usar ícones, bordas, ou padrões adicionais

### Keyboard Navigation
- `:focus-visible` em todos os interactive elements
- Tab order lógico (top-to-bottom, left-to-right)
- Skip-to-content link na header

### Images & Alt Text
- **Portfolio Images:** Descriptive alt (ex: "Branding identity for local bakery, featuring hand-drawn logo and color palette")
- **Decorative:** `alt=""` (aria-hidden if needed)

---

## 📐 Mockup Sections (Story 2.1)

### Hero Section
```
Height: 100vh ou min(100vh, 600px)
Background: Dark (primary color) + subtle gradient ou hero image
Content: Logo, headline, subheading, CTA button
Layout: Center-aligned ou left-aligned
```

### Portfolio Grid
```
Section Padding: 64px (desktop), 32px (tablet), 20px (mobile)
Grid: 4-3-2 columns (desktop-tablet-mobile)
Card Shadow: Subtle, increases on hover
Image: Covers full card, aspect 4:3
Overlay: Optional dark overlay on hover with category tag
```

### About Section (Small)
```
Content: Brief paragraph about Denner + 3-4 core specialties
Layout: 2-column (desktop), 1-column (mobile)
Image: Optional portrait or design showcase
```

### Contact CTA
```
Background: Accent color or dark with outline
Content: Heading + short text + form or WhatsApp link
Layout: Center-aligned
```

### Footer
```
Content: Copyright, quick links, social icons
Layout: 3-4 columns (desktop), 1 column (mobile)
Background: Dark (#1a1a1a)
Text Color: Light (#ffffff) with muted (#808080) for secondary
```

---

## 🔗 Figma Link (to be created by Uma)

**Status:** Pending  
**Action:** Uma creates Figma file with above specifications  
**Deliverable:** Link shared in `docs/design/figma-link.txt`

---

## ✅ Design System Validation

- [ ] All colors pass WCAG AA contrast ratios
- [ ] Typography scales legibly across breakpoints
- [ ] Components render correctly in light/dark modes (if applicable)
- [ ] Animations respect `prefers-reduced-motion`
- [ ] Grid system is flexible and responsive
- [ ] Spacing is consistent with defined scale
- [ ] Keyboard navigation works without mouse

---

**Next Step:** Uma creates Figma mockups based on this system → Reference for @dev implementation
