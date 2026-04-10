# Script para corrigir associação de arquivos .cdr no Windows

# Caminho do executável
$corelPath = "C:\Users\denne\OneDrive\Área de Trabalho\instaladores\CorelDRAW.exe"

# Verificar se arquivo existe
if (Test-Path $corelPath) {
    Write-Host "✅ CorelDRAW.exe encontrado em: $corelPath" -ForegroundColor Green

    # Atualizar registro do Windows
    $regPath = "HKLM:\SOFTWARE\Classes\cdr_auto_file\shell\open\command"

    # Criar o comando com escape correto
    $command = "`"$corelPath`" `"%1`""

    # Tentar atualizar o registro
    try {
        # Criar chave se não existir
        if (!(Test-Path $regPath)) {
            New-Item -Path $regPath -Force | Out-Null
        }

        # Definir valor padrão
        Set-ItemProperty -Path $regPath -Name "(Default)" -Value $command -Force

        Write-Host "✅ Associação de arquivo .cdr atualizada com sucesso!" -ForegroundColor Green
        Write-Host "Agora você pode abrir arquivos .cdr diretamente clicando duas vezes." -ForegroundColor Green

        # Verificar resultado
        Write-Host ""
        Write-Host "Novo valor no registro:" -ForegroundColor Cyan
        Get-ItemProperty -Path $regPath -Name "(Default)"
    }
    catch {
        Write-Host "❌ Erro ao atualizar registro (pode precisar de permissão de administrador)" -ForegroundColor Red
        Write-Host "Erro: $_" -ForegroundColor Red
        Write-Host ""
        Write-Host "Solução: Execute PowerShell como Administrador e tente novamente." -ForegroundColor Yellow
    }
} else {
    Write-Host "❌ CorelDRAW.exe não encontrado em: $corelPath" -ForegroundColor Red
}
