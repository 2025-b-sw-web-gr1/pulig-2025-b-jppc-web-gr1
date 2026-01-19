# Script de prueba de API para Windows PowerShell
# Uso: .\test-api.ps1

$BaseUrl = "http://localhost:3000"

Write-Host "================================" -ForegroundColor Cyan
Write-Host "   PRUEBAS API - TEAMS & PLAYERS" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# 1. Crear Teams
Write-Host "1. Creando equipos..." -ForegroundColor Green

$Team1 = Invoke-RestMethod -Uri "$BaseUrl/teams" -Method Post `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Real Madrid", "country": "España"}'
Write-Host "Real Madrid creado: ID $($Team1.id)"

$Team2 = Invoke-RestMethod -Uri "$BaseUrl/teams" -Method Post `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Barcelona", "country": "España"}'
Write-Host "Barcelona creado: ID $($Team2.id)"

$Team3 = Invoke-RestMethod -Uri "$BaseUrl/teams" -Method Post `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Manchester United", "country": "Inglaterra"}'
Write-Host "Manchester United creado: ID $($Team3.id)"
Write-Host ""

# 2. Obtener todos los equipos
Write-Host "2. Obteniendo todos los equipos..." -ForegroundColor Green
$AllTeams = Invoke-RestMethod -Uri "$BaseUrl/teams" -Method Get
$AllTeams | ConvertTo-Json | Write-Host
Write-Host ""

# 3. Obtener un equipo específico
Write-Host "3. Obteniendo equipo con ID 1..." -ForegroundColor Green
$Team1Info = Invoke-RestMethod -Uri "$BaseUrl/teams/1" -Method Get
$Team1Info | ConvertTo-Json | Write-Host
Write-Host ""

# 4. Crear Players
Write-Host "4. Creando jugadores..." -ForegroundColor Green

$Player1 = Invoke-RestMethod -Uri "$BaseUrl/players" -Method Post `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Cristiano Ronaldo", "position": "Delantero", "teamId": 1}'
Write-Host "Cristiano Ronaldo creado: ID $($Player1.id)"

$Player2 = Invoke-RestMethod -Uri "$BaseUrl/players" -Method Post `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Vinícius Júnior", "position": "Extremo", "teamId": 1}'
Write-Host "Vinícius Júnior creado: ID $($Player2.id)"

$Player3 = Invoke-RestMethod -Uri "$BaseUrl/players" -Method Post `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Robert Lewandowski", "position": "Delantero", "teamId": 2}'
Write-Host "Robert Lewandowski creado: ID $($Player3.id)"

$Player4 = Invoke-RestMethod -Uri "$BaseUrl/players" -Method Post `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Bruno Fernandes", "position": "Centrocampista", "teamId": 3}'
Write-Host "Bruno Fernandes creado: ID $($Player4.id)"
Write-Host ""

# 5. Obtener todos los jugadores
Write-Host "5. Obteniendo todos los jugadores..." -ForegroundColor Green
$AllPlayers = Invoke-RestMethod -Uri "$BaseUrl/players" -Method Get
$AllPlayers | ConvertTo-Json | Write-Host
Write-Host ""

# 6. Obtener un jugador específico
Write-Host "6. Obteniendo jugador con ID 1..." -ForegroundColor Green
$Player1Info = Invoke-RestMethod -Uri "$BaseUrl/players/1" -Method Get
$Player1Info | ConvertTo-Json | Write-Host
Write-Host ""

# 7. Obtener jugadores de un equipo específico
Write-Host "7. Obteniendo jugadores del equipo 1 (Real Madrid)..." -ForegroundColor Green
$TeamPlayers = Invoke-RestMethod -Uri "$BaseUrl/teams/1/players" -Method Get
$TeamPlayers | ConvertTo-Json | Write-Host
Write-Host ""

# 8. Actualizar un equipo
Write-Host "8. Actualizando equipo..." -ForegroundColor Green
$UpdatedTeam = Invoke-RestMethod -Uri "$BaseUrl/teams/1" -Method Put `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"name": "Real Madrid CF"}'
$UpdatedTeam | ConvertTo-Json | Write-Host
Write-Host ""

# 9. Actualizar un jugador
Write-Host "9. Actualizando jugador..." -ForegroundColor Green
$UpdatedPlayer = Invoke-RestMethod -Uri "$BaseUrl/players/1" -Method Put `
  -Headers @{"Content-Type"="application/json"} `
  -Body '{"position": "Extremo Derecho"}'
$UpdatedPlayer | ConvertTo-Json | Write-Host
Write-Host ""

# 10. Eliminar un jugador
Write-Host "10. Eliminando jugador con ID 4..." -ForegroundColor Green
$DeleteResult = Invoke-RestMethod -Uri "$BaseUrl/players/4" -Method Delete
$DeleteResult | ConvertTo-Json | Write-Host
Write-Host ""

# 11. Verificar que el jugador fue eliminado
Write-Host "11. Obteniendo todos los jugadores nuevamente..." -ForegroundColor Green
$RemainingPlayers = Invoke-RestMethod -Uri "$BaseUrl/players" -Method Get
$RemainingPlayers | ConvertTo-Json | Write-Host
Write-Host ""

Write-Host "================================" -ForegroundColor Cyan
Write-Host "   FIN DE PRUEBAS" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
