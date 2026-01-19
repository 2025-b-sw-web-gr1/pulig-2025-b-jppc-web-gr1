#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

BASE_URL="http://localhost:3000"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   PRUEBAS API - TEAMS & PLAYERS${NC}"
echo -e "${BLUE}================================${NC}\n"

# 1. Crear Teams
echo -e "${GREEN}1. Creando equipos...${NC}"

TEAM1=$(curl -s -X POST $BASE_URL/teams \
  -H "Content-Type: application/json" \
  -d '{"name": "Real Madrid", "country": "España"}')
echo "Real Madrid creado: $TEAM1"

TEAM2=$(curl -s -X POST $BASE_URL/teams \
  -H "Content-Type: application/json" \
  -d '{"name": "Barcelona", "country": "España"}')
echo "Barcelona creado: $TEAM2"

TEAM3=$(curl -s -X POST $BASE_URL/teams \
  -H "Content-Type: application/json" \
  -d '{"name": "Manchester United", "country": "Inglaterra"}')
echo "Manchester United creado: $TEAM3\n"

# 2. Obtener todos los equipos
echo -e "${GREEN}2. Obteniendo todos los equipos...${NC}"
curl -s -X GET $BASE_URL/teams | jq '.' | head -20
echo ""

# 3. Obtener un equipo específico
echo -e "${GREEN}3. Obteniendo equipo con ID 1...${NC}"
curl -s -X GET $BASE_URL/teams/1 | jq '.'
echo ""

# 4. Crear Players
echo -e "${GREEN}4. Creando jugadores...${NC}"

PLAYER1=$(curl -s -X POST $BASE_URL/players \
  -H "Content-Type: application/json" \
  -d '{"name": "Cristiano Ronaldo", "position": "Delantero", "teamId": 1}')
echo "Cristiano Ronaldo creado: $PLAYER1"

PLAYER2=$(curl -s -X POST $BASE_URL/players \
  -H "Content-Type: application/json" \
  -d '{"name": "Vinícius Júnior", "position": "Extremo", "teamId": 1}')
echo "Vinícius Júnior creado: $PLAYER2"

PLAYER3=$(curl -s -X POST $BASE_URL/players \
  -H "Content-Type: application/json" \
  -d '{"name": "Robert Lewandowski", "position": "Delantero", "teamId": 2}')
echo "Robert Lewandowski creado: $PLAYER3"

PLAYER4=$(curl -s -X POST $BASE_URL/players \
  -H "Content-Type: application/json" \
  -d '{"name": "Bruno Fernandes", "position": "Centrocampista", "teamId": 3}')
echo "Bruno Fernandes creado: $PLAYER4\n"

# 5. Obtener todos los jugadores
echo -e "${GREEN}5. Obteniendo todos los jugadores...${NC}"
curl -s -X GET $BASE_URL/players | jq '.'
echo ""

# 6. Obtener un jugador específico
echo -e "${GREEN}6. Obteniendo jugador con ID 1...${NC}"
curl -s -X GET $BASE_URL/players/1 | jq '.'
echo ""

# 7. Obtener jugadores de un equipo específico
echo -e "${GREEN}7. Obteniendo jugadores del equipo 1 (Real Madrid)...${NC}"
curl -s -X GET $BASE_URL/teams/1/players | jq '.'
echo ""

# 8. Actualizar un equipo
echo -e "${GREEN}8. Actualizando equipo...${NC}"
curl -s -X PUT $BASE_URL/teams/1 \
  -H "Content-Type: application/json" \
  -d '{"name": "Real Madrid CF"}' | jq '.'
echo ""

# 9. Actualizar un jugador
echo -e "${GREEN}9. Actualizando jugador...${NC}"
curl -s -X PUT $BASE_URL/players/1 \
  -H "Content-Type: application/json" \
  -d '{"position": "Extremo Derecho"}' | jq '.'
echo ""

# 10. Eliminar un jugador
echo -e "${GREEN}10. Eliminando jugador con ID 4...${NC}"
curl -s -X DELETE $BASE_URL/players/4 | jq '.'
echo ""

# 11. Verificar que el jugador fue eliminado
echo -e "${GREEN}11. Obteniendo todos los jugadores nuevamente...${NC}"
curl -s -X GET $BASE_URL/players | jq '.'
echo ""

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   FIN DE PRUEBAS${NC}"
echo -e "${BLUE}================================${NC}"
