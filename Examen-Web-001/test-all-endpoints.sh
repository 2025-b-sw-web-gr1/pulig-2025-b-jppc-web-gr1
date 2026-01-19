#!/bin/bash

# Colors para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

BASE_URL="http://localhost:3001"

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  PRUEBAS DE ENDPOINTS - EXAMEN 02                         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# 1. GET / - Root endpoint
echo -e "${BLUE}1. GET / - Verificar servidor${NC}"
curl -s "${BASE_URL}/" | jq .
echo ""

# 2. GET /teams - Obtener todos los equipos
echo -e "${BLUE}2. GET /teams - Obtener todos los equipos${NC}"
curl -s "${BASE_URL}/teams" | jq .
echo ""

# 3. POST /teams - Crear un equipo
echo -e "${BLUE}3. POST /teams - Crear equipo 1${NC}"
TEAM1=$(curl -s -X POST "${BASE_URL}/teams" \
  -H "Content-Type: application/json" \
  -d '{"name":"Manchester United","country":"England"}')
echo "$TEAM1" | jq .
TEAM1_ID=$(echo "$TEAM1" | jq -r '.id')
echo -e "${GREEN}Team 1 ID: $TEAM1_ID${NC}"
echo ""

# 4. POST /teams - Crear segundo equipo
echo -e "${BLUE}4. POST /teams - Crear equipo 2${NC}"
TEAM2=$(curl -s -X POST "${BASE_URL}/teams" \
  -H "Content-Type: application/json" \
  -d '{"name":"Barcelona","country":"Spain"}')
echo "$TEAM2" | jq .
TEAM2_ID=$(echo "$TEAM2" | jq -r '.id')
echo -e "${GREEN}Team 2 ID: $TEAM2_ID${NC}"
echo ""

# 5. GET /teams/:id - Obtener un equipo por ID
echo -e "${BLUE}5. GET /teams/:id - Obtener equipo por ID (ID: $TEAM1_ID)${NC}"
curl -s "${BASE_URL}/teams/${TEAM1_ID}" | jq .
echo ""

# 6. PUT /teams/:id - Actualizar un equipo
echo -e "${BLUE}6. PUT /teams/:id - Actualizar equipo (ID: $TEAM1_ID)${NC}"
curl -s -X PUT "${BASE_URL}/teams/${TEAM1_ID}" \
  -H "Content-Type: application/json" \
  -d '{"name":"Manchester United FC","country":"United Kingdom"}' | jq .
echo ""

# 7. POST /players - Crear jugador 1
echo -e "${BLUE}7. POST /players - Crear jugador 1${NC}"
PLAYER1=$(curl -s -X POST "${BASE_URL}/players" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"Cristiano Ronaldo\",\"position\":\"Forward\",\"teamId\":${TEAM1_ID}}")
echo "$PLAYER1" | jq .
PLAYER1_ID=$(echo "$PLAYER1" | jq -r '.id')
echo -e "${GREEN}Player 1 ID: $PLAYER1_ID${NC}"
echo ""

# 8. POST /players - Crear jugador 2
echo -e "${BLUE}8. POST /players - Crear jugador 2${NC}"
PLAYER2=$(curl -s -X POST "${BASE_URL}/players" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"Bruno Fernandes\",\"position\":\"Midfielder\",\"teamId\":${TEAM1_ID}}")
echo "$PLAYER2" | jq .
PLAYER2_ID=$(echo "$PLAYER2" | jq -r '.id')
echo -e "${GREEN}Player 2 ID: $PLAYER2_ID${NC}"
echo ""

# 9. POST /players - Crear jugador 3 (diferente equipo)
echo -e "${BLUE}9. POST /players - Crear jugador 3${NC}"
PLAYER3=$(curl -s -X POST "${BASE_URL}/players" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"Lionel Messi\",\"position\":\"Forward\",\"teamId\":${TEAM2_ID}}")
echo "$PLAYER3" | jq .
PLAYER3_ID=$(echo "$PLAYER3" | jq -r '.id')
echo -e "${GREEN}Player 3 ID: $PLAYER3_ID${NC}"
echo ""

# 10. GET /players - Obtener todos los jugadores
echo -e "${BLUE}10. GET /players - Obtener todos los jugadores${NC}"
curl -s "${BASE_URL}/players" | jq .
echo ""

# 11. GET /players/:id - Obtener jugador por ID
echo -e "${BLUE}11. GET /players/:id - Obtener jugador por ID (ID: $PLAYER1_ID)${NC}"
curl -s "${BASE_URL}/players/${PLAYER1_ID}" | jq .
echo ""

# 12. GET /teams/:id/players - Obtener jugadores de un equipo
echo -e "${BLUE}12. GET /teams/:id/players - Obtener jugadores del equipo (ID: $TEAM1_ID)${NC}"
curl -s "${BASE_URL}/teams/${TEAM1_ID}/players" | jq .
echo ""

# 13. PUT /players/:id - Actualizar jugador
echo -e "${BLUE}13. PUT /players/:id - Actualizar jugador (ID: $PLAYER1_ID)${NC}"
curl -s -X PUT "${BASE_URL}/players/${PLAYER1_ID}" \
  -H "Content-Type: application/json" \
  -d '{"name":"Cristiano Ronaldo","position":"Striker"}' | jq .
echo ""

# 14. DELETE /players/:id - Eliminar jugador
echo -e "${BLUE}14. DELETE /players/:id - Eliminar jugador (ID: $PLAYER2_ID)${NC}"
curl -s -X DELETE "${BASE_URL}/players/${PLAYER2_ID}" | jq .
echo ""

# 15. GET /players - Verificar que jugador fue eliminado
echo -e "${BLUE}15. GET /players - Verificar jugadores después de eliminar${NC}"
curl -s "${BASE_URL}/players" | jq .
echo ""

# 16. DELETE /teams/:id - Eliminar equipo
echo -e "${BLUE}16. DELETE /teams/:id - Eliminar equipo (ID: $TEAM2_ID)${NC}"
curl -s -X DELETE "${BASE_URL}/teams/${TEAM2_ID}" | jq .
echo ""

# 17. GET /teams - Verificar equipos restantes
echo -e "${BLUE}17. GET /teams - Verificar equipos restantes${NC}"
curl -s "${BASE_URL}/teams" | jq .
echo ""

echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  PRUEBAS COMPLETADAS                                      ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
