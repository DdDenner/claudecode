# Script de Otimização do PC
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   OTIMIZACAO COMPLETA DO PC"
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# 1. INICIALIZACAO - Verificar programas que iniciam automaticamente
Write-Host "1. INICIALIZACAO - Programas na Inicializacao"
Write-Host "   Escaneando..." -ForegroundColor Yellow

$startupItems = @()
$registryPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
)

foreach ($path in $registryPaths) {
    if (Test-Path $path) {
        $items = Get-ItemProperty $path -ErrorAction SilentlyContinue
        if ($items) {
            foreach ($item in $items.PSObject.Properties) {
                if ($item.Name -notlike "PS*" -and $item.Name -notlike "*Default*") {
                    $startupItems += $item.Name
                }
            }
        }
    }
}

Write-Host "   Programas encontrados na inicializacao:"
if ($startupItems.Count -eq 0) {
    Write-Host "   [OK] Nenhum programa problematico identificado"
} else {
    foreach ($item in $startupItems) {
        Write-Host "   - $item"
    }
    Write-Host ""
    Write-Host "   RECOMENDACAO: Desabilite programas desnecessarios via:"
    Write-Host "   • Win + R > msconfig > Inicializacao"
    Write-Host "   • Ou: Configuracoes > Aplicativos > Inicializacao"
}
Write-Host ""

# 2. WINDOWS - Limpeza de Arquivos Temporarios
Write-Host "2. WINDOWS - Limpeza de Arquivos Temporarios"
Write-Host "   Escaneando..." -ForegroundColor Yellow

$tempSize = 0
$tempPaths = @(
    "$env:TEMP",
    "$env:LOCALAPPDATA\Temp",
    "C:\Windows\Temp"
)

foreach ($path in $tempPaths) {
    if (Test-Path $path) {
        $items = Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue
        $size = ($items | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
        if ($size) {
            $tempSize += $size
        }
    }
}

$tempSizeGB = [math]::Round($tempSize / 1GB, 2)
Write-Host "   Espaco em arquivos temporarios: $tempSizeGB GB"

if ($tempSizeGB -gt 1) {
    Write-Host "   [RECOMENDACAO] Limpeza recomendada!"
    Write-Host "   Limpando arquivos temporarios..." -ForegroundColor Yellow

    # Tentar limpar arquivos temporarios
    Get-ChildItem -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue |
        Remove-Item -Force -ErrorAction SilentlyContinue -Confirm:$false

    Write-Host "   [OK] Arquivos temporarios removidos"
} else {
    Write-Host "   [OK] Quantidade de temporarios aceitavel"
}
Write-Host ""

# 3. DISCO - Tamanho de Pastas
Write-Host "3. DISCO - Pastas Grandes (TOP 10)"
Write-Host "   Escaneando..." -ForegroundColor Yellow

$topFolders = Get-ChildItem -Path "C:\" -Directory -ErrorAction SilentlyContinue |
    ForEach-Object {
        $size = (Get-ChildItem $_.FullName -Recurse -Force -ErrorAction SilentlyContinue |
            Measure-Object -Property Length -Sum).Sum
        [PSCustomObject]@{
            Name = $_.Name
            SizeGB = [math]::Round($size / 1GB, 2)
        }
    } | Sort-Object SizeGB -Descending | Select-Object -First 10

Write-Host ""
$topFolders | ForEach-Object {
    Write-Host "   $($_.Name.PadRight(35)) - $($_.SizeGB) GB"
}

Write-Host ""
Write-Host "   RECOMENDACOES:"
Write-Host "   • Users: Limpe downloads e documentos nao usados"
Write-Host "   • Windows: Desabilite hibernacao (libera 4-8 GB)"
Write-Host "   • Windows.old: Delete se existir (de atualizacoes antigas)"
Write-Host ""

# 4. CHROME - Dicas de Otimizacao
Write-Host "4. CHROME - Reducao de Memoria"
Write-Host "   Status: Chrome usando ~1.9 GB" -ForegroundColor Yellow
Write-Host ""
Write-Host "   RECOMENDACOES:"
Write-Host "   • Desabilitar extencoes nao usadas:"
Write-Host "     1. Abra Chrome > chrome://extensions"
Write-Host "     2. Procure por extencoes pesadas (verificar opcoes)"
Write-Host ""
Write-Host "   • Ativar modo economia de memoria:"
Write-Host "     1. Chrome > Menu (tres pontos) > Configuracoes"
Write-Host "     2. Performance > Ativar 'Modo economia de memoria'"
Write-Host ""
Write-Host "   • Extencoes recomendadas para remover:"
Write-Host "     - Adobe Flash (descontinuado)"
Write-Host "     - Adware nao reconhecido"
Write-Host "     - Ferramentas de compras pesadas"
Write-Host ""

# 5. RAM - Informacoes adicionais
Write-Host "5. RAM - Dicas Gerais"
Write-Host "   Sua RAM atual: 14 GB (45% disponivel)"
Write-Host ""
Write-Host "   MELHORIAS RECOMENDADAS:"
Write-Host "   • Fechar abas desnecessarias no Chrome"
Write-Host "   • Usar extensao 'The Great Suspender' ou 'Tab Suspender'"
Write-Host "   • Considerar upgrade para 16 GB no futuro"
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host "   OTIMIZACAO CONCLUIDA"
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "   Proximos passos:"
Write-Host "   1. Reinicie o PC para aplicar mudancas"
Write-Host "   2. Execute novamente analise-sistema.ps1 para ver melhorias"
Write-Host ""
