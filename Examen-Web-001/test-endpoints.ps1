# Script de pruebas para todos los endpoints
# Examen 02 - API RESTful

$BASE_URL = "http://localhost:3001"

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  PRUEBAS DE ENDPOINTS - EXAMEN 02                         ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 1. GET / - Root endpoint
Write-Host "1. GET / - Verificar servidor" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 2. GET /teams - Obtener todos los equipos
Write-Host "2. GET /teams - Obtener todos los equipos" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/teams" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 3. POST /teams - Crear un equipo
Write-Host "3. POST /teams - Crear equipo 1" -ForegroundColor Blue
$body1 = @{
    name = "Manchester United"
    country = "England"
} | ConvertTo-Json

$TEAM1 = (Invoke-WebRequest -Uri "$BASE_URL/teams" -Method Post -ContentType "application/json" -Body $body1).Content | ConvertFrom-Json
$TEAM1 | ConvertTo-Json | Write-Host
$TEAM1_ID = $TEAM1.id
Write-Host "Team 1 ID: $TEAM1_ID" -ForegroundColor Green
Write-Host ""

# 4. POST /teams - Crear segundo equipo
Write-Host "4. POST /teams - Crear equipo 2" -ForegroundColor Blue
$body2 = @{
    name = "Barcelona"
    country = "Spain"
} | ConvertTo-Json

$TEAM2 = (Invoke-WebRequest -Uri "$BASE_URL/teams" -Method Post -ContentType "application/json" -Body $body2).Content | ConvertFrom-Json
$TEAM2 | ConvertTo-Json | Write-Host
$TEAM2_ID = $TEAM2.id
Write-Host "Team 2 ID: $TEAM2_ID" -ForegroundColor Green
Write-Host ""

# 5. GET /teams/:id - Obtener un equipo por ID
Write-Host "5. GET /teams/:id - Obtener equipo por ID (ID: $TEAM1_ID)" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/teams/$TEAM1_ID" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""


# 6. PUT /teams/:id - Actualizar un equipo
Write-Host "6. PUT /teams/:id - Actualizar equipo (ID: $TEAM1_ID)" -ForegroundColor Blue
$updateBody = @{
    name = "Manchester United FC"
    country = "United Kingdom"
} | ConvertTo-Json

(Invoke-WebRequest -Uri "$BASE_URL/teams/$TEAM1_ID" -Method Put -ContentType "application/json" -Body $updateBody).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 7. POST /players - Crear jugador 1
Write-Host "7. POST /players - Crear jugador 1" -ForegroundColor Blue
$playerBody1 = @{
    name = "Cristiano Ronaldo"
    position = "Forward"
    teamId = $TEAM1_ID
} | ConvertTo-Json

$PLAYER1 = (Invoke-WebRequest -Uri "$BASE_URL/players" -Method Post -ContentType "application/json" -Body $playerBody1).Content | ConvertFrom-Json
$PLAYER1 | ConvertTo-Json | Write-Host
$PLAYER1_ID = $PLAYER1.id
Write-Host "Player 1 ID: $PLAYER1_ID" -ForegroundColor Green
Write-Host ""

# 8. POST /players - Crear jugador 2
Write-Host "8. POST /players - Crear jugador 2" -ForegroundColor Blue
$playerBody2 = @{
    name = "Bruno Fernandes"
    position = "Midfielder"
    teamId = $TEAM1_ID
} | ConvertTo-Json

$PLAYER2 = (Invoke-WebRequest -Uri "$BASE_URL/players" -Method Post -ContentType "application/json" -Body $playerBody2).Content | ConvertFrom-Json
$PLAYER2 | ConvertTo-Json | Write-Host
$PLAYER2_ID = $PLAYER2.id
Write-Host "Player 2 ID: $PLAYER2_ID" -ForegroundColor Green
Write-Host ""

# 9. POST /players - Crear jugador 3 (diferente equipo)
Write-Host "9. POST /players - Crear jugador 3" -ForegroundColor Blue
$playerBody3 = @{
    name = "Lionel Messi"
    position = "Forward"
    teamId = $TEAM2_ID
} | ConvertTo-Json

$PLAYER3 = (Invoke-WebRequest -Uri "$BASE_URL/players" -Method Post -ContentType "application/json" -Body $playerBody3).Content | ConvertFrom-Json
$PLAYER3 | ConvertTo-Json | Write-Host
$PLAYER3_ID = $PLAYER3.id
Write-Host "Player 3 ID: $PLAYER3_ID" -ForegroundColor Green
Write-Host ""

# 10. GET /players - Obtener todos los jugadores
Write-Host "10. GET /players - Obtener todos los jugadores" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/players" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 11. GET /players/:id - Obtener jugador por ID
Write-Host "11. GET /players/:id - Obtener jugador por ID (ID: $PLAYER1_ID)" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/players/$PLAYER1_ID" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 12. GET /teams/:id/players - Obtener jugadores de un equipo
Write-Host "12. GET /teams/:id/players - Obtener jugadores del equipo (ID: $TEAM1_ID)" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/teams/$TEAM1_ID/players" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 13. PUT /players/:id - Actualizar jugador
Write-Host "13. PUT /players/:id - Actualizar jugador (ID: $PLAYER1_ID)" -ForegroundColor Blue
$updatePlayerBody = @{
    name = "Cristiano Ronaldo"
    position = "Striker"
} | ConvertTo-Json

(Invoke-WebRequest -Uri "$BASE_URL/players/$PLAYER1_ID" -Method Put -ContentType "application/json" -Body $updatePlayerBody).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 14. DELETE /players/:id - Eliminar jugador
Write-Host "14. DELETE /players/:id - Eliminar jugador (ID: $PLAYER2_ID)" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/players/$PLAYER2_ID" -Method Delete).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 15. GET /players - Verificar que jugador fue eliminado
Write-Host "15. GET /players - Verificar jugadores después de eliminar" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/players" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 16. DELETE /teams/:id - Eliminar equipo
Write-Host "16. DELETE /teams/:id - Eliminar equipo (ID: $TEAM2_ID)" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/teams/$TEAM2_ID" -Method Delete).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

# 17. GET /teams - Verificar equipos restantes
Write-Host "17. GET /teams - Verificar equipos restantes" -ForegroundColor Blue
(Invoke-WebRequest -Uri "$BASE_URL/teams" -Method Get).Content | ConvertFrom-Json | ConvertTo-Json | Write-Host
Write-Host ""

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  PRUEBAS COMPLETADAS                                      ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
