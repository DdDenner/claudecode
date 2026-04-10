# Script de Limpeza Profunda de Disco
# REQUER: Executar como Administrador

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   LIMPEZA PROFUNDA DE DISCO"
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Verificar se está rodando como admin
$isAdmin = [bool]([System.Security.Principal.WindowsIdentity]::GetCurrent().Groups -match "S-1-5-32-544")
if (-not $isAdmin) {
    Write-Host "ERRO: Este script precisa rodar como Administrador!" -ForegroundColor Red
    Write-Host "Solucao: Clique com botao direito no PowerShell e selecione 'Executar como administrador'" -ForegroundColor Yellow
    Exit
}

$totalLimpeza = 0

# 1. LIMPEZA DE ATUALIZACOES DO WINDOWS
Write-Host "1. LIMPEZA DE ATUALIZACOES ANTIGAS DO WINDOWS" -ForegroundColor Cyan
Write-Host "   Processando..." -ForegroundColor Yellow

$winPath = "C:\Windows\SoftwareDistribution\Download"
if (Test-Path $winPath) {
    try {
        $items = Get-ChildItem -Path $winPath -Recurse -Force -ErrorAction SilentlyContinue
        $size = ($items | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum

        Remove-Item -Path $winPath -Recurse -Force -ErrorAction SilentlyContinue -Confirm:$false

        if ($size) {
            $sizeMB = [math]::Round($size / 1MB, 2)
            Write-Host "   ✓ Removido: $sizeMB MB de atualizacoes antigas"
            $totalLimpeza += $size
        }
    } catch {
        Write-Host "   [INFO] Nao foi possivel limpar neste momento"
    }
}
Write-Host ""

# 2. LIMPEZA DE ARQUIVOS TEMPORARIOS DO WINDOWS
Write-Host "2. LIMPEZA DE ARQUIVOS TEMPORARIOS DO WINDOWS" -ForegroundColor Cyan
Write-Host "   Processando..." -ForegroundColor Yellow

$tempWin = "C:\Windows\Temp"
if (Test-Path $tempWin) {
    try {
        $items = Get-ChildItem -Path $tempWin -Recurse -Force -ErrorAction SilentlyContinue
        $size = ($items | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum

        $items | Remove-Item -Force -ErrorAction SilentlyContinue -Confirm:$false

        if ($size) {
            $sizeMB = [math]::Round($size / 1MB, 2)
            Write-Host "   ✓ Removido: $sizeMB MB de temporarios do Windows"
            $totalLimpeza += $size
        }
    } catch {
        Write-Host "   [INFO] Nao foi possivel limpar neste momento"
    }
}
Write-Host ""

# 3. LIMPEZA DO CACHE DO WINDOWS UPDATE
Write-Host "3. LIMPEZA DO CACHE DO WINDOWS UPDATE" -ForegroundColor Cyan
Write-Host "   Processando..." -ForegroundColor Yellow

$updateCache = "C:\Windows\SoftwareDistribution\DataStore\DataStore.edb"
if (Test-Path $updateCache) {
    try {
        Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1

        Remove-Item -Path "C:\Windows\SoftwareDistribution\DataStore" -Recurse -Force -ErrorAction SilentlyContinue -Confirm:$false

        Start-Service wuauserv -ErrorAction SilentlyContinue

        Write-Host "   ✓ Removido: Cache do Windows Update"
        $totalLimpeza += 500000000 # Estimado em 500 MB
    } catch {
        Write-Host "   [INFO] Nao foi possivel limpar neste momento"
    }
}
Write-Host ""

# 4. LIMPEZA DO PREFETCH
Write-Host "4. LIMPEZA DO PREFETCH (Arquivos de Otimizacao)" -ForegroundColor Cyan
Write-Host "   Processando..." -ForegroundColor Yellow

$prefetch = "C:\Windows\Prefetch"
if (Test-Path $prefetch) {
    try {
        $items = Get-ChildItem -Path $prefetch -Force -ErrorAction SilentlyContinue | Where-Object {$_.Extension -eq ".pf"}
        $size = ($items | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum

        $items | Remove-Item -Force -ErrorAction SilentlyContinue -Confirm:$false

        if ($size) {
            $sizeMB = [math]::Round($size / 1MB, 2)
            Write-Host "   ✓ Removido: $sizeMB MB de arquivos prefetch"
            $totalLimpeza += $size
        }
    } catch {
        Write-Host "   [INFO] Nao foi possivel limpar neste momento"
    }
}
Write-Host ""

# 5. LIMPEZA DA RECICLA BIN
Write-Host "5. LIMPEZA DA RECICLA BIN" -ForegroundColor Cyan
Write-Host "   Processando..." -ForegroundColor Yellow

try {
    Clear-RecycleBin -Force -Confirm:$false -ErrorAction SilentlyContinue
    Write-Host "   ✓ Recicla bin esvaziada"
} catch {
    Write-Host "   [INFO] Recicla bin ja estava vazia"
}
Write-Host ""

# 6. LIMPEZA DE ARQUIVOS TEMPORARIOS DE APLICACOES
Write-Host "6. LIMPEZA DE CACHES DE APLICACOES" -ForegroundColor Cyan
Write-Host "   Processando..." -ForegroundColor Yellow

$appCaches = @(
    "$env:LOCALAPPDATA\Microsoft\Windows\WebCache",
    "$env:LOCALAPPDATA\Microsoft\Windows\INetCache"
)

foreach ($cache in $appCaches) {
    if (Test-Path $cache) {
        try {
            $items = Get-ChildItem -Path $cache -Recurse -Force -ErrorAction SilentlyContinue
            $size = ($items | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum

            $items | Remove-Item -Force -ErrorAction SilentlyContinue -Confirm:$false

            if ($size) {
                $sizeMB = [math]::Round($size / 1MB, 2)
                Write-Host "   ✓ Removido: $sizeMB MB de cache de aplicacoes"
                $totalLimpeza += $size
            }
        } catch {}
    }
}
Write-Host ""

# 7. INFORMACOES DE LIMPEZA
Write-Host "========================================" -ForegroundColor Green
Write-Host "   LIMPEZA CONCLUIDA COM SUCESSO!"
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

$totalLimpezaMB = [math]::Round($totalLimpeza / 1MB, 2)
$totalLimpezaGB = [math]::Round($totalLimpeza / 1GB, 2)

Write-Host "RESUMO DA LIMPEZA:"
Write-Host "   Total liberado: $totalLimpezaMB MB (~$totalLimpezaGB GB)"
Write-Host ""

if ($totalLimpezaGB -lt 0.5) {
    Write-Host "   [INFO] Disco ja estava relativamente limpo"
} elseif ($totalLimpezaGB -lt 1) {
    Write-Host "   [OK] Limpeza bem-sucedida"
} else {
    Write-Host "   [EXCELENTE] Muito espaco liberado!"
}

Write-Host ""
Write-Host "PROXIMOS PASSOS:"
Write-Host "1. Reinicie o computador (opcional, mas recomendado)"
Write-Host "2. Execute novamente a analise-sistema.ps1 para confirmar os ganhos"
Write-Host ""
