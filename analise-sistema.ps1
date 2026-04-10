# Script de análise do sistema
Write-Host ""
Write-Host "========================================"
Write-Host "     ANALISE DE DESEMPENHO DO PC"
Write-Host "========================================"
Write-Host ""

# Memória RAM
$os = Get-WmiObject Win32_OperatingSystem
$ram_total_mb = [math]::Round($os.TotalVisibleMemorySize / 1KB)
$ram_livre_mb = [math]::Round($os.FreePhysicalMemory / 1KB)
$ram_usado_mb = $ram_total_mb - $ram_livre_mb
$percentual_livre = [math]::Round(($ram_livre_mb / $ram_total_mb) * 100)
$percentual_uso = 100 - $percentual_livre

Write-Host "MEMORIA RAM"
Write-Host "   Total:       $([math]::Round($ram_total_mb / 1024)) GB"
Write-Host "   Em Uso:      $([math]::Round($ram_usado_mb / 1024)) GB"
Write-Host "   Disponivel:  $([math]::Round($ram_livre_mb / 1024)) GB"
Write-Host "   Uso:         $percentual_uso em uso | $percentual_livre livre"

if ($percentual_livre -lt 20) {
    Write-Host "   [ATENCAO] Menos de 20% de RAM disponivel"
} elseif ($percentual_livre -lt 50) {
    Write-Host "   [AVISO] Memoria comecando a ficar apertada"
} else {
    Write-Host "   [OK] Memoria adequada"
}
Write-Host ""

# Processador
$cpu = Get-WmiObject Win32_Processor
Write-Host "PROCESSADOR"
Write-Host "   Nome:        $($cpu.Name)"
Write-Host "   Nucleos:     $($cpu.NumberOfCores)"
Write-Host "   Threads:     $($cpu.NumberOfLogicalProcessors)"
Write-Host "   Velocidade:  $($cpu.MaxClockSpeed) MHz"
Write-Host ""

# Disco
Write-Host "DISCO (C:)"
$disco = Get-PSDrive -Name C
$tamanho_total = $disco.Used + $disco.Free
$percentual_usado = [math]::Round(($disco.Used / $tamanho_total) * 100)

Write-Host "   Total:       $([math]::Round($tamanho_total / 1GB)) GB"
Write-Host "   Em Uso:      $([math]::Round($disco.Used / 1GB)) GB ($percentual_usado%)"
Write-Host "   Livre:       $([math]::Round($disco.Free / 1GB)) GB"

if ($percentual_usado -gt 90) {
    Write-Host "   [CRITICO] Disco quase cheio!"
} elseif ($percentual_usado -gt 80) {
    Write-Host "   [AVISO] Disco acima de 80%"
} else {
    Write-Host "   [OK] Disco com espaco suficiente"
}
Write-Host ""

# Top 5 processos por memória
Write-Host "TOP 5 PROCESSOS (Por Memoria)"
$processos = Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5
$processos | ForEach-Object {
    $mem_mb = [math]::Round($_.WorkingSet / 1MB)
    Write-Host "   $($_.ProcessName.PadRight(25)) - $mem_mb MB"
}
Write-Host ""

# Uptime
$uptime = (Get-Date) - [System.Management.ManagementDateTimeConverter]::ToDateTime($os.LastBootUpTime)
Write-Host "SISTEMA"
Write-Host "   Uptime: $([int]$uptime.Days) dias, $([int]$uptime.Hours) horas, $([int]$uptime.Minutes) minutos"
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host ""
