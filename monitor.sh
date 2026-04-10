#!/bin/bash
# 🔍 Real-time Project Monitor
# Acompanha commits, arquivos e progresso em tempo real

clear
echo "╔════════════════════════════════════════════════════════════╗"
echo "║   🔍 MONITOR EM TEMPO REAL - Portfólio Landing Page      ║"
echo "║                                                            ║"
echo "║   Acompanhando:                                           ║"
echo "║   ✅ Commits (git log)                                    ║"
echo "║   ✅ Arquivos criados                                     ║"
echo "║   ✅ Componentes React                                    ║"
echo "║   ✅ Stories documentação                                 ║"
echo "║                                                            ║"
echo "║   Pressione Ctrl+C para sair                              ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Função para mostrar commits
show_commits() {
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "📝 ÚLTIMOS 10 COMMITS"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  cd "$(dirname "$0")" || exit
  if [ -d .git ]; then
    git log --oneline -10 --graph --all 2>/dev/null || echo "Nenhum commit ainda..."
  else
    echo "Repositório Git não encontrado"
  fi
  echo ""
}

# Função para contar componentes
show_components() {
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "⚛️  COMPONENTES REACT"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  if [ -d "portfolio-landing/src/components" ]; then
    count=$(find portfolio-landing/src/components -name "*.tsx" -o -name "*.ts" | wc -l)
    echo "✅ Total de componentes: $count"
    echo ""
    echo "Arquivos:"
    find portfolio-landing/src/components -name "*.tsx" -o -name "*.ts" | sort | sed 's/^/  /'
  else
    echo "Pasta de componentes não encontrada ainda..."
  fi
  echo ""
}

# Função para contar stories
show_stories() {
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "📚 STORIES CRIADAS"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  if [ -d "docs/stories" ]; then
    count=$(find docs/stories -name "*.md" | wc -l)
    echo "✅ Total de stories: $count / 11"
    echo ""
    echo "Arquivos:"
    find docs/stories -name "*.md" | sort | sed 's/^/  /'
  else
    echo "Pasta de stories não encontrada ainda..."
  fi
  echo ""
}

# Função para mostrar design
show_design() {
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "🎨 DESIGN DOCUMENTAÇÃO"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  if [ -d "docs/design" ]; then
    count=$(find docs/design -type f | wc -l)
    echo "✅ Total de arquivos design: $count"
    echo ""
    echo "Arquivos:"
    find docs/design -type f | sort | sed 's/^/  /'
  else
    echo "Pasta de design não encontrada ainda..."
  fi
  echo ""
}

# Função para mostrar status geral
show_status() {
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "📊 STATUS GERAL"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  # Stories
  stories=$(find docs/stories -name "*.md" 2>/dev/null | wc -l)
  echo "📝 Stories:      [$stories/11]"

  # Design
  design=$(find docs/design -type f 2>/dev/null | wc -l)
  echo "🎨 Design:       [$design/5+]"

  # Componentes
  components=$(find portfolio-landing/src/components -name "*.tsx" 2>/dev/null | wc -l)
  echo "⚛️  Componentes:  [$components/8+]"

  # Tamanho do projeto
  if [ -d "portfolio-landing" ]; then
    size=$(du -sh portfolio-landing 2>/dev/null | cut -f1)
    echo "📦 Tamanho:      $size"
  fi

  echo ""
}

# Loop principal
while true; do
  clear

  # Header
  echo "╔════════════════════════════════════════════════════════════╗"
  echo "║   🔍 MONITOR EM TEMPO REAL - $(date '+%H:%M:%S')                        ║"
  echo "╚════════════════════════════════════════════════════════════╝"
  echo ""

  # Mostrar tudo
  show_status
  show_commits
  show_stories
  show_components
  show_design

  # Rodapé
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "🔄 Próxima atualização em 5 segundos... (Ctrl+C para sair)"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  sleep 5
done
