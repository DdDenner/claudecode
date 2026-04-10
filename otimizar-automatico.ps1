# Script de Otimizacao Automatica do PC
# REQUER: Executar como Administrador

param(
    [switch]$SkipHibernacao = $false,
    [switch]$SkipStartup = $false,
    [switch]$SkipLimpeza = $false
)

# Verificar se está rodando como admin
$isAdmin = [bool]([System.Security.Principal.WindowsIdentity]::GetCurrent().Groups -match "S-1-5-32-544")
if (-not $isAdmin) {
    Write-Host "ERRO: Este script precisa rodar como Administrador!" -ForegroundColor Red
    Write-Host "Solucao: Clique com botao direito no PowerShell e selecione 'Executar como administrador'" -ForegroundColor Yellow
    Exit
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   OTIMIZACAO AUTOMATICA DO PC"
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# 1. DESABILITAR HIBERNACAO
if (-not $SkipHibernacao) {
    Write-Host "1. DESABILITAR HIBERNACAO (Libera 4-8 GB)" -ForegroundColor Cyan
    Write-Host "   Processando..." -ForegroundColor Yellow

    try {
        powercfg /h off
        Write-Host "   [OK] Hibernacao desabilitada com sucesso" -ForegroundColor Green
    } catch {
        Write-Host "   [ERRO] Nao foi possivel desabilitar hibernacao" -ForegroundColor Red
    }
    Write-Host ""
}

# 2. DESABILITAR PROGRAMAS NA INICIALIZACAO
if (-not $SkipStartup) {
    Write-Host "2. DESABILITAR PROGRAMAS NA INICIALIZACAO" -ForegroundColor Cyan
    Write-Host "   Processando..." -ForegroundColor Yellow

    $programasRemover = @(
        "Steam",
        "EpicGamesLauncher",
        "RiotClient",
        "Overwolf",
        "electron.app.CurseForge"
    )

    $registryPaths = @(
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
    )

    $removidos = 0
    foreach ($path in $registryPaths) {
        if (Test-Path $path) {
            foreach ($programa in $programasRemover) {
                try {
                    $item = Get-ItemProperty -Path $path -Name $programa -ErrorAction SilentlyContinue
                    if ($item) {
                        Remove-ItemProperty -Path $path -Name $programa -Force -ErrorAction SilentlyContinue
                        Write-Host "   ✓ Removido: $programa"
                        $removidos++
                    }
                } catch {}
            }
        }
    }

    if ($removidos -gt 0) {
        Write-Host "   [OK] $removidos programas removidos da inicializacao" -ForegroundColor Green
    } else {
        Write-Host "   [INFO] Nenhum programa para remover (podem estar em outro local)" -ForegroundColor Yellow
    }
    Write-Host ""
}

# 3. LIMPEZA DE DISCO
if (-not $SkipLimpeza) {
    Write-Host "3. LIMPEZA DE ARQUIVOS TEMPORARIOS" -ForegroundColor Cyan
    Write-Host "   Processando..." -ForegroundColor Yellow

    $limpezaTotal = 0

    # Limpar pasta TEMP do usuario
    $tempPaths = @(
        "$env:LOCALAPPDATA\Temp",
        "$env:TEMP"
    )

    foreach ($path in $tempPaths) {
        if (Test-Path $path) {
            try {
                $items = Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue
                $sizeAntes = ($items | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum

                $items | Remove-Item -Force -ErrorAction SilentlyContinue -Confirm:$false

                if ($sizeAntes) {
                    $sizeMB = [math]::Round($sizeAntes / 1MB, 2)
                    Write-Host "   ✓ Limpeza de: $path ($sizeMB MB)"
                    $limpezaTotal += $sizeAntes
                }
            } catch {}
        }
    }

    # Limpar cache do navegador (Chrome)
    if (Test-Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache") {
        try {
            Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache" -Recurse -Force -ErrorAction SilentlyContinue -Confirm:$false
            Write-Host "   ✓ Limpeza de cache do Chrome"
        } catch {
            Write-Host "   [INFO] Chrome precisa estar fechado para limpeza completa"
        }
    }

    $limpezaTotalMB = [math]::Round($limpezaTotal / 1MB, 2)
    Write-Host "   [OK] Limpeza concluida: $limpezaTotalMB MB liberados" -ForegroundColor Green
    Write-Host ""
}

# 4. RESUMO
Write-Host "========================================" -ForegroundColor Green
Write-Host "   OTIMIZACAO CONCLUIDA COM SUCESSO!"
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "PROXIMOS PASSOS:"
Write-Host "1. Reinicie o computador para aplicar todas as mudancas"
Write-Host "2. Apos reiniciar, feche o Chrome completamente"
Write-Host "3. Execute novamente para limpeza completa do Chrome"
Write-Host ""
Write-Host "Para otimizar Chrome manualmente:"
Write-Host "1. Abra Chrome > Menu (⋯) > Configuracoes"
Write-Host "2. Vá para: Performance"
Write-Host "3. Ative 'Modo economia de memoria'"
Write-Host ""
Write-Host "Para remover extensoes pesadas no Chrome:"
Write-Host "1. Chrome > Menu (⋯) > Mais ferramentas > Extensoes"
Write-Host "2. Procure extensoes nao usadas e clique no lixo"
Write-Host ""
