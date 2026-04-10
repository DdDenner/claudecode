@echo off
REM 🔍 Monitor em Tempo Real - Portfólio Landing Page
REM Acompanha commits, arquivos e progresso em tempo real

setlocal enabledelayedexpansion

:loop
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║   🔍 MONITOR EM TEMPO REAL - Portfólio Landing Page       ║
echo ║                                                            ║
echo ║   Atualiza a cada 5 segundos                              ║
echo ║   Pressione Ctrl+C para sair                              ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM MOSTRA STATUS GERAL
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 📊 STATUS GERAL
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if exist docs\stories (
  for /f %%A in ('dir /b docs\stories\*.md 2^>nul ^| find /c /v ""') do (
    echo 📝 Stories: [%%A/11] ✅
  )
) else (
  echo 📝 Stories: [0/11] ⏳
)

if exist docs\design (
  for /f %%A in ('dir /b docs\design 2^>nul ^| find /c /v ""') do (
    echo 🎨 Design: [%%A/5+] ✅
  )
) else (
  echo 🎨 Design: [0/5+] ⏳
)

if exist portfolio-landing\src\components (
  for /f %%A in ('dir /b portfolio-landing\src\components\*.tsx 2^>nul ^| find /c /v ""') do (
    echo ⚛️  Componentes: [%%A/8+]
  )
) else (
  echo ⚛️  Componentes: [0/8+] ⏳
)

echo.

REM MOSTRA COMMITS
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 📝 ÚLTIMOS 10 COMMITS
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git log --oneline -10 2>nul || echo "Nenhum commit ainda... (aguardando River/Uma/Dex)"
echo.

REM MOSTRA STORIES
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 📚 STORIES CRIADAS
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
if exist docs\stories (
  dir /b docs\stories\*.md 2>nul || echo "Nenhuma story ainda..."
) else (
  echo Pasta docs\stories\ não existe ainda...
)
echo.

REM MOSTRA COMPONENTES
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ⚛️  COMPONENTES REACT
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
if exist portfolio-landing\src\components (
  dir /b portfolio-landing\src\components\*.tsx 2>nul || echo "Nenhum componente ainda..."
) else (
  echo Pasta de componentes não existe ainda...
)
echo.

REM RODAPÉ
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 🔄 Próxima atualização em 5 segundos...
echo ⏰ Hora: %date% %time%
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

timeout /t 5 /nobreak

goto loop
