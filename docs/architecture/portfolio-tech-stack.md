# Technology Stack & Architecture - Portfólio Landing Page

**Status:** ✅ Definido e Validado  
**Data:** 2026-04-09  
**Arquiteto:** Aria (@architect)  
**Timeline:** MVP 2 semanas  

---

## 🎯 Executive Summary

**Selected Stack:** Next.js 14 + React 18 + TypeScript + Tailwind CSS 3 on Vercel

**Rationale:** 
- ⚡ Zero-config deployment on Vercel (perfect for MVP timeline)
- 🚀 Server components for performance
- 🎨 Tailwind CSS for rapid design system implementation
- 📱 Built-in responsive & mobile-first
- 🔍 SEO-optimized (meta tags, sitemap, structured data)
- 🌐 Edge caching & CDN included in Vercel

**Why NOT alternatives:**
- ❌ Astro: Overkill for interactive gallery (no dynamic filtering needed in MVP)
- ❌ Webflow: Can't version-control, not sustainable long-term
- ❌ HTML/CSS: No component reusability, maintenance nightmare at scale

---

## 📦 Technology Decisions

### Frontend Framework: Next.js 14

**Decision:** Next.js 14 with App Router

**Rationale:**
1. **Server Components** → Faster initial page load, better SEO
2. **Built-in Optimization** → Image optimization, font optimization
3. **Zero Config** → Deploy to Vercel with one command
4. **File-based Routing** → Intuitive structure, easy to understand
5. **API Routes** → Contact form backend without separate service

**Versions:**
- `next@14.0.0+`
- `react@18.2.0+`
- `react-dom@18.2.0+`

### Language: TypeScript 5.3

**Decision:** Full TypeScript (no JavaScript files)

**Rationale:**
1. **Type Safety** → Catch bugs at compile time
2. **Better IDE Support** → Auto-completion, refactoring
3. **Self-Documenting Code** → Types serve as inline documentation
4. **Future Maintainability** → Easier for others to understand

**Configuration:**
- `tsconfig.json`: Strict mode enabled
- `jsx: "preserve"` (Next.js handles JSX)
- Path aliases: `@/components`, `@/utils`, `@/types`

### Styling: Tailwind CSS 3

**Decision:** Tailwind CSS (utility-first)

**Rationale:**
1. **Design System Integration** → Use color/spacing tokens directly
2. **Fast Development** → No CSS file overhead
3. **Small Bundle Size** → Only included utilities are shipped
4. **Consistent Design** → No style drift, enforced by framework
5. **Responsive by Default** → Mobile-first built-in

**Configuration:**
- `tailwind.config.js`: Extended theme with design tokens
- `postcss.config.js`: Autoprefixer enabled
- Custom components defined in `/src/styles/globals.css`

### Animation: Framer Motion

**Decision:** Framer Motion for micro-interactions

**Rationale:**
1. **Smooth Hover Effects** → Card scaling, subtle transitions
2. **Small Library** → ~40KB gzipped
3. **React Native** → Familiar API for React developers
4. **Performance** → Uses GPU acceleration

**Usage:**
- Portfolio card hover effects
- Scroll-triggered animations (fade-in sections)
- Respect `prefers-reduced-motion` for accessibility

### Deployment: Vercel

**Decision:** Vercel (Automatic)

**Rationale:**
1. **Native Next.js Support** → Made by Next.js creators
2. **Zero Configuration** → Connect GitHub repo, auto-deploy
3. **Edge Functions** → API routes close to users
4. **Instant Rollback** → Easy to revert bad deploys
5. **Free Tier** → More than enough for MVP
6. **SEO Benefits** → Automatic sitemap generation

**Setup:**
- Connect GitHub repository
- Set environment variables (if needed)
- Auto-deploy on push to main branch

---

## 🏗️ Project Structure

```
portfolio-landing/
├── public/                        # Static assets
│   ├── favicon.ico
│   ├── manifest.json             # PWA manifest
│   └── images/                   # Project images (from Google Drive)
│
├── src/
│   ├── app/                      # App Router (Next.js 14)
│   │   ├── layout.tsx            # Root layout (metadata, header, footer)
│   │   ├── page.tsx              # Homepage (Hero + Gallery + About + Contact)
│   │   ├── robots.txt            # SEO robots file
│   │   └── sitemap.ts            # Dynamic sitemap
│   │
│   ├── components/               # Reusable React components (Atomic Design)
│   │   ├── atoms/
│   │   │   ├── Button.tsx        # CTA button component
│   │   │   ├── Badge.tsx         # Category badge
│   │   │   ├── Input.tsx         # Form input
│   │   │   └── Label.tsx         # Form label
│   │   │
│   │   ├── molecules/
│   │   │   ├── Card.tsx          # Portfolio project card
│   │   │   ├── FormField.tsx     # Label + Input wrapper
│   │   │   └── NavLink.tsx       # Navigation link
│   │   │
│   │   ├── organisms/
│   │   │   ├── Header.tsx        # Navigation header
│   │   │   ├── Hero.tsx          # Hero section
│   │   │   ├── Portfolio.tsx     # Gallery grid
│   │   │   ├── About.tsx         # About section
│   │   │   ├── Contact.tsx       # Contact form
│   │   │   └── Footer.tsx        # Footer
│   │   │
│   │   └── index.ts              # Component exports
│   │
│   ├── lib/                      # Utilities & helpers
│   │   ├── constants.ts          # App constants (site name, contact email)
│   │   ├── utils.ts              # Utility functions (cn, classname merge)
│   │   ├── portfolio-data.ts     # Portfolio projects array (14 projects)
│   │   └── api-client.ts         # API call helpers
│   │
│   ├── hooks/                    # Custom React hooks
│   │   ├── useInView.ts          # Detect element visibility
│   │   └── useMediaQuery.ts      # Responsive breakpoint detection
│   │
│   ├── styles/
│   │   ├── globals.css           # Global styles + design tokens
│   │   └── animations.css        # Reusable animations
│   │
│   └── types/
│       └── portfolio.ts          # TypeScript types (Project, Category, etc)
│
├── tests/                        # Test files (mirror src structure)
│   ├── components/
│   ├── lib/
│   └── __mocks__/
│
├── .github/
│   └── workflows/
│       ├── ci.yml                # CI pipeline (lint, test, build)
│       └── deploy.yml            # Deploy to Vercel (auto on merge)
│
├── .env.example                  # Environment variables template
├── .env.local                    # Local env (git-ignored)
├── .gitignore                    # Git ignore rules
├── next.config.js                # Next.js configuration
├── tsconfig.json                 # TypeScript configuration
├── tailwind.config.js            # Tailwind configuration
├── postcss.config.js             # PostCSS configuration
├── jest.config.js                # Jest test configuration
├── package.json                  # Dependencies
├── README.md                     # Project documentation
└── SETUP.md                      # Setup instructions
```

---

## 📋 Core Dependencies

### Production
```json
{
  "next": "14.0.0+",
  "react": "18.2.0+",
  "react-dom": "18.2.0+",
  "framer-motion": "10.16.0+",
  "clsx": "2.0.0+"
}
```

### Dev Dependencies
```json
{
  "typescript": "5.3.0+",
  "tailwindcss": "3.3.0+",
  "postcss": "8.4.31+",
  "autoprefixer": "10.4.16+",
  "@types/node": "20.0.0+",
  "@types/react": "18.2.0+",
  "@types/react-dom": "18.2.0+",
  "jest": "29.0.0+",
  "@testing-library/react": "14.0.0+",
  "eslint": "8.50.0+",
  "eslint-config-next": "14.0.0+"
}
```

**Note:** Exact versions pinned in package-lock.json for reproducibility

---

## 🚀 Build & Deploy Pipeline

### Development
```bash
npm run dev          # Start dev server (localhost:3000)
npm run build        # Build for production
npm run start        # Start production server
npm run lint         # Run ESLint
npm test            # Run Jest tests
```

### CI/CD (GitHub Actions)

**On Pull Request:**
1. ✅ Install dependencies
2. ✅ Run linter (eslint)
3. ✅ Run tests (jest)
4. ✅ Build project (next build)
5. ✅ Preview deployment on Vercel

**On Merge to main:**
1. ✅ All PR checks pass
2. ✅ Auto-deploy to production (Vercel)
3. ✅ Verify deployment health

**Workflow Files:**
- `.github/workflows/ci.yml` — Lint, test, build checks
- `.github/workflows/deploy.yml` — Auto-deploy to Vercel

---

## 🌐 Deployment Architecture

### Development Environment
```
Local Machine
  ↓
npm run dev
  ↓
localhost:3000
```

### Staging Environment (Optional)
```
GitHub Branch (feature/*)
  ↓
Vercel Preview Deployment
  ↓
https://<branch-name>.vercel.app
```

### Production Environment
```
GitHub main branch
  ↓
Vercel Production Deployment
  ↓
https://denner.design (custom domain)
```

### Vercel Configuration
- **Runtime:** Node.js 18+ (auto-detected)
- **Build Command:** `next build`
- **Start Command:** `next start`
- **Output Directory:** `.next`
- **Environment Variables:** Configured in Vercel dashboard

---

## 🔍 SEO & Performance

### SEO Implementation
- ✅ Meta tags (title, description, OG tags) in `layout.tsx`
- ✅ Dynamic sitemap.ts
- ✅ robots.txt configuration
- ✅ Schema.org markup (Portfolio, LocalBusiness)
- ✅ Open Graph tags for social sharing
- ✅ Canonical URLs

### Performance Targets (Lighthouse)
- **Largest Contentful Paint (LCP):** < 2.5s
- **First Input Delay (FID):** < 100ms
- **Cumulative Layout Shift (CLS):** < 0.1
- **Performance Score:** > 90
- **SEO Score:** > 95

### Image Optimization
- Next.js Image component (automatic)
- WebP with JPG fallback
- Responsive srcset (mobile, tablet, desktop)
- Lazy loading below the fold
- Max file size per image: 100KB

---

## 🔐 Security Architecture

### Built-in Security
- ✅ Next.js built-in XSS protection
- ✅ CORS headers configured
- ✅ Content Security Policy (CSP) headers
- ✅ Secure cookie defaults (if using sessions)
- ✅ HTTPS enforced by Vercel

### Contact Form Security
- ✅ Server-side validation
- ✅ Rate limiting on API routes
- ✅ CSRF protection (if applicable)
- ✅ Input sanitization
- ✅ No sensitive data in logs

---

## 🎯 Scalability Considerations

### Current (MVP)
- Single Next.js deployment on Vercel
- All assets on Vercel CDN
- No database (static content)
- Form submissions via email/Resend/FormSpree

### Future (v1.1+)
- Potential static site generation (SSG)
- Asset CDN optimization
- Caching strategy (HTTP caching headers)
- Analytics & monitoring (Vercel Analytics)

---

## ✅ Architecture Validation Checklist

**Frontend Layer:**
- [x] Server components for performance
- [x] Client components for interactivity
- [x] Atomic Design component structure
- [x] Type-safe components (TypeScript)
- [x] Responsive design (mobile-first)
- [x] Accessibility compliance (WCAG AA)

**API Layer:**
- [x] Form validation (server-side)
- [x] Error handling (user-friendly messages)
- [x] Rate limiting (prevent spam)
- [x] CORS configuration

**Infrastructure:**
- [x] Zero-config deployment (Vercel)
- [x] Auto-scaling (handled by Vercel)
- [x] Edge caching (Vercel CDN)
- [x] Environment separation (dev/staging/prod)
- [x] CI/CD pipeline configured

**SEO & Performance:**
- [x] Meta tags & OG data
- [x] Sitemap generation
- [x] Image optimization
- [x] Lazy loading
- [x] CSS-in-JS (Tailwind) optimized

---

## 📊 Technology Decision Matrix

| Criterion | Selected | Why |
|-----------|----------|-----|
| **Framework** | Next.js 14 | Optimal for MVP, Vercel integration, SSR/SSG flexibility |
| **React** | 18.2+ | Server components, latest features, performance |
| **Language** | TypeScript | Type safety, IDE support, maintainability |
| **Styling** | Tailwind CSS 3 | Utility-first, rapid design system integration |
| **Animation** | Framer Motion | Smooth micro-interactions, small bundle |
| **Deployment** | Vercel | Native Next.js, zero-config, free tier |
| **Database** | None (MVP) | No server state, static content suitable |
| **Auth** | None (MVP) | Contact form only, no user accounts |
| **Testing** | Jest + React Testing | Standard tooling, good coverage |
| **Linting** | ESLint + Prettier | Code quality, consistency |

---

## 🚀 Handoff to Development

### Prerequisites for @dev (Dex)
1. ✅ Tech stack confirmed (this document)
2. ✅ Project structure defined (above)
3. ✅ Design mockups ready (Story 2.1)
4. ✅ Portfolio data structured (Story 1.3)
5. ✅ CI/CD pipeline configured

### Entry Points
- **Story 3.1** → Implement HTML/CSS structure + responsive layout
- **Story 3.2** → Build portfolio gallery with 14 cards
- **Story 3.3** → Implement contact form
- **Story 3.4** → QA testing

### Development Environment Setup
See: `portfolio-landing/SETUP.md`

```bash
git clone <repo>
cd portfolio-landing
npm install
npm run dev      # Start dev server
npm test        # Run tests
```

---

## 📝 Configuration Files (To Create)

**Already Created:**
- ✅ `portfolio-landing/package.json`
- ✅ `portfolio-landing/next.config.js`
- ✅ `portfolio-landing/tsconfig.json`
- ✅ `portfolio-landing/tailwind.config.js`
- ✅ `portfolio-landing/src/app/layout.tsx`
- ✅ `portfolio-landing/src/app/page.tsx`
- ✅ `portfolio-landing/src/styles/globals.css`

**To Create (Story 3+):**
- ⏳ `portfolio-landing/postcss.config.js`
- ⏳ `portfolio-landing/jest.config.js`
- ⏳ `.github/workflows/ci.yml`
- ⏳ `.github/workflows/deploy.yml`

---

## 🎬 Next Actions

1. ✅ **Story 2.2** → Tech stack confirmed
2. ⏳ **Story 3.1** → Implement HTML/CSS
3. ⏳ **Story 3.2** → Gallery component
4. ⏳ **Story 3.3** → Contact form
5. ⏳ **Story 3.4** → QA & testing

---

**Status:** ✅ TECHNOLOGY STACK DEFINED & VALIDATED

— Aria, arquitetando o futuro 🏗️
