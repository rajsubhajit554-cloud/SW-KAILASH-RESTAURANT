# Git Auto Update PowerShell Script
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "       SW KAILASH RESTAURANT - GIT AUTO UPDATER" -ForegroundColor Yellow
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/4] Checking Repository Status..." -ForegroundColor Green
git status -s
Write-Host ""

Write-Host "[2/4] Staging all files..." -ForegroundColor Green
git add .
Write-Host "[OK] Files staged successfully." -ForegroundColor Gray
Write-Host ""

$commitMsg = Read-Host "Enter commit message (Press ENTER for default auto-update)"
if ([string]::IsNullOrWhiteSpace($commitMsg)) {
    $commitMsg = "Update website content [$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')]"
}

Write-Host ""
Write-Host "[3/4] Committing changes with message: '$commitMsg'" -ForegroundColor Green
git commit -m "$commitMsg"
Write-Host ""

Write-Host "[4/4] Pushing changes to GitHub (origin main)..." -ForegroundColor Green
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=======================================================" -ForegroundColor Green
    Write-Host "   SUCCESS! GitHub Repository Updated Successfully!" -ForegroundColor Green
    Write-Host "=======================================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "=======================================================" -ForegroundColor Red
    Write-Host "   FAILED! Please check your internet or git credentials." -ForegroundColor Red
    Write-Host "=======================================================" -ForegroundColor Red
}

Write-Host ""
Read-Host "Press ENTER to exit..."
