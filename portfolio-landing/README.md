# 🎨 Denner Portfolio Landing Page

Landing page profissional para portfólio de design gráfico de Denner, apresentando trabalhos de identidade visual, embalagens, sinalizações e muito mais.

**Status:** 🚀 Em Desenvolvimento  
**Repo:** GitHub (será criado)  
**Demo:** https://denner.design (será publicado)

---

## 📋 Sumário

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Instalação](#instalação)
- [Desenvolvimento](#desenvolvimento)
- [Build & Deploy](#build--deploy)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Contributing](#contributing)

---

## ✨ Features

- ✅ **Responsivo** - Mobile, tablet, desktop
- ✅ **Galeria de Projetos** - 10-15 melhores trabalhos
- ✅ **Filtros por Categoria** - Identidade, Embalagem, Sinalizações, etc
- ✅ **SEO Otimizado** - Meta tags, schema.org, sitemap
- ✅ **Acessível** - WCAG 2.1 AA compliance
- ✅ **Performance** - Lighthouse score > 90
- ✅ **Formulário de Contato** - Integrado com email
- ✅ **Animações Suaves** - Micro-interações
- ✅ **Dark Mode** - Suporte (planejado)

---

## 🛠️ Tech Stack

### Frontend
- **Framework:** Next.js 14
- **React:** v18.2
- **Styling:** Tailwind CSS 3
- **Animações:** Framer Motion
- **Type Safety:** TypeScript

### Build & Deploy
- **Package Manager:** npm / yarn / pnpm
- **Deployment:** Vercel (recomendado)
- **CI/CD:** GitHub Actions (será configurado)
- **Hosting:** Vercel + Custom Domain

### Development Tools
- **Linting:** ESLint + Prettier
- **Testing:** Jest + React Testing Library
- **Type Checking:** TypeScript

---

## 📦 Instalação

### Pré-requisitos
- Node.js >= 18.0.0
- npm >= 9.0.0 (ou yarn/pnpm)
- Git

### Setup Local

1. **Clone o repositório:**
```bash
git clone https://github.com/seu-usuario/denner-portfolio.git
cd denner-portfolio
```

2. **Instale dependências:**
```bash
npm install
# ou
yarn install
# ou
pnpm install
```

3. **Configure variáveis de ambiente:**
```bash
# Copie o arquivo de exemplo
cp .env.example .env.local

# Edite com seus valores
# NEXT_PUBLIC_SITE_URL=http://localhost:3000
# NEXT_PUBLIC_FORM_ENDPOINT=seu-endpoint-email
```

4. **Inicie o servidor de desenvolvimento:**
```bash
npm run dev
```

Acesse http://localhost:3000 no navegador.

---

## 🚀 Desenvolvimento

### Estrutura de Pastas

```
portfolio-landing/
├── src/
│   ├── app/                 # App Router (Next.js 13+)
│   │   ├── layout.tsx       # Layout root
│   │   └── page.tsx         # Homepage
│   ├── components/          # Componentes React
│   │   ├── Header.tsx
│   │   ├── Hero.tsx
│   │   ├── Portfolio.tsx
│   │   ├── ProjectCard.tsx
│   │   ├── Contact.tsx
│   │   └── Footer.tsx
│   ├── styles/              # Estilos globais
│   │   └── globals.css
│   ├── utils/               # Funções utilitárias
│   │   ├── cn.ts            # clsx wrapper
│   │   └── constants.ts     # Constantes
│   ├── hooks/               # Custom React Hooks
│   │   └── useScrollspy.ts
│   ├── types/               # Tipos TypeScript
│   │   └── project.ts
│   └── context/             # React Context
│       └── ProjectContext.tsx
├── public/
│   ├── images/
│   │   ├── projects/        # Imagens dos projetos
│   │   └── icons/           # Ícones
│   ├── favicon.ico
│   └── sitemap.xml
├── package.json
├── tsconfig.json
├── tailwind.config.js
├── next.config.js
└── README.md
```

### Comandos Úteis

```bash
# Desenvolvimento
npm run dev          # Inicia servidor com hot reload

# Build
npm run build        # Build para produção
npm start            # Inicia servidor de produção

# Qualidade
npm run lint         # ESLint
npm run type-check   # Type checking
npm run format       # Prettier format
npm test             # Jest tests
npm run test:watch   # Jest em modo watch

# Deploy
npm run build        # Prepara para deploy
```

### Fluxo de Desenvolvimento

1. **Crie uma branch feature:**
```bash
git checkout -b feature/nome-da-feature
```

2. **Faça commits semânticos:**
```bash
git commit -m "feat: adicionar componente Header"
git commit -m "fix: corrigir responsividade do Hero"
```

3. **Push e crie PR:**
```bash
git push origin feature/nome-da-feature
```

### Checklist antes de PR
- [ ] Code segue lint rules (`npm run lint`)
- [ ] TypeScript sem erros (`npm run type-check`)
- [ ] Testes passam (`npm test`)
- [ ] Responsive testado (mobile, tablet, desktop)
- [ ] Acessibilidade verificada
- [ ] Performance OK (Lighthouse)

---

## 🏗️ Build & Deploy

### Build Local
```bash
npm run build
npm start
```

### Deploy em Produção (Vercel)

1. **Conecte o repositório:**
```bash
vercel
```

2. **Configure o domínio:**
```bash
vercel domains add denner.design
```

3. **Deploy automático:**
- Qualquer push em `main` dispara build automático
- Vercel gera preview URL para PRs

### Environment Variables (Produção)
```
NEXT_PUBLIC_SITE_URL=https://denner.design
NEXT_PUBLIC_FORM_ENDPOINT=https://api.seu-dominio.com/contact
```

---

## 📊 Performance

### Lighthouse Goals
- **Performance:** > 90
- **Accessibility:** > 95
- **Best Practices:** > 90
- **SEO:** > 95

### Otimizações Implementadas
- Image optimization (Next.js Image)
- Code splitting automático
- CSS minification
- Font optimization
- Lazy loading de componentes

### Monitoramento
```bash
# Web Vitals em tempo real
npm run analyze
```

---

## 🎨 Design System

### Paleta de Cores (definida por Uma)
```
Primária:   #8b5cf6 (Purple)
Secundária: #64748b (Slate)
Accent:     #f59e0b (Amber)
```

### Tipografia (será definida)
```
Display:  TBD
Sans:     System Font Stack
```

### Espaçamento
```
xs: 0.25rem (4px)
sm: 0.5rem  (8px)
md: 1rem    (16px)
lg: 1.5rem  (24px)
xl: 2rem    (32px)
2xl: 3rem   (48px)
```

---

## 🧪 Testing

### Unit Tests
```bash
npm test
npm run test:watch
npm run test:coverage
```

### E2E Tests (planejado)
```bash
npm run e2e
```

### Manual Testing Checklist
- [ ] Todos os links funcionam
- [ ] Formulário de contato envia
- [ ] Imagens carregam rapidamente
- [ ] Animações são suaves
- [ ] Funciona offline (PWA)

---

## 🐛 Troubleshooting

### Problema: Porta 3000 já está em uso
```bash
# Use porta diferente
npm run dev -- -p 3001
```

### Problema: TypeScript errors
```bash
npm run type-check
npm run lint --fix
```

### Problema: Build falha
```bash
# Limpe cache Next.js
rm -rf .next
npm run build
```

---

## 📝 Roadmap

### Phase 1 (Atual) ✅
- [x] Setup projeto Next.js
- [ ] Design mockups (Uma)
- [ ] Stories estruturadas (River)

### Phase 2 🚀
- [ ] Componentes base implementados
- [ ] Galeria de projetos
- [ ] Filtros e busca

### Phase 3
- [ ] Formulário de contato
- [ ] SEO + Analytics
- [ ] Deploy produção

### Phase 4
- [ ] Dark mode
- [ ] Animações avançadas
- [ ] PWA

---

## 📖 Documentação

- [Next.js Docs](https://nextjs.org/docs)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [TypeScript](https://www.typescriptlang.org/docs)
- [Web Accessibility](https://www.w3.org/WAI/ARIA/apg)

---

## 👥 Contributing

Contribuições são bem-vindas! Por favor:

1. Faça fork do projeto
2. Crie uma branch feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

## 📄 License

MIT © 2026 Denner Gomes

---

## 📞 Contato

- **Email:** dennergomes6359@gmail.com
- **Portfólio:** https://denner.design
- **GitHub:** [seu-usuario]

---

**Last Updated:** 2026-04-09  
**Maintained by:** Morgan (PM) + River (SM) + Uma (UX) + Dex (Dev)
