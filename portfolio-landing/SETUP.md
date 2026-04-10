# ⚡ Setup Rápido

## 3 Passos para Começar

### 1️⃣ Instalar Dependências
```bash
npm install
```

### 2️⃣ Iniciar Dev Server
```bash
npm run dev
```

### 3️⃣ Abrir no Navegador
```
http://localhost:3000
```

---

## ✅ Verificar Setup

```bash
# Verificar Node.js
node --version  # >= 18.0.0

# Verificar npm
npm --version   # >= 9.0.0

# Verificar TypeScript
npm run type-check

# Verificar Linting
npm run lint

# Rodar testes
npm test
```

---

## 📁 Estrutura Criada

```
✓ package.json          - Dependências
✓ next.config.js        - Configuração Next.js
✓ tsconfig.json         - Configuração TypeScript
✓ tailwind.config.js    - Configuração Tailwind
✓ postcss.config.js     - PostCSS config
✓ .gitignore            - Git ignore
✓ src/app/              - App Router
✓ src/components/       - Componentes (vazio - será preenchido)
✓ src/styles/           - Estilos globais
✓ public/               - Assets estáticos
✓ README.md             - Documentação completa
```

---

## 🎯 Próximos Passos

1. **River (SM)** vai criar as stories individuais
2. **Uma (UX)** vai criar wireframes e mockups
3. **Dex (Dev)** vai implementar os componentes

---

## 🔗 Recursos

| Recurso | URL |
|---------|-----|
| Next.js | https://nextjs.org |
| Tailwind | https://tailwindcss.com |
| TypeScript | https://www.typescriptlang.org |
| Vercel | https://vercel.com |

---

## 🚨 Problemas Comuns

### Port 3000 em Uso
```bash
npm run dev -- -p 3001
```

### Module Not Found
```bash
rm -rf node_modules
npm install
```

### Build Error
```bash
rm -rf .next
npm run build
```

---

**Status:** ✅ Pronto para desenvolvimento!
