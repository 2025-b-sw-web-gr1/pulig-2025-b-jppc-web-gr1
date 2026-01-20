import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Put,
  Delete,
  ValidationPipe,
  ParseIntPipe,
} from '@nestjs/common';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiBody,
} from '@nestjs/swagger';
import { PlayersService } from '../services/players.service';
import { CreatePlayerDto, UpdatePlayerDto } from '../dtos/player.dto';
import { Player } from '../entities/player.entity';

@ApiTags('players')
@Controller('players')
export class PlayersController {
  constructor(private readonly playersService: PlayersService) {}

  @Get()
  @ApiOperation({ summary: 'Obtener todos los jugadores' })
  @ApiResponse({
    status: 200,
    description: 'Lista de jugadores obtenida correctamente',
    type: [Player],
  })
  async findAll(): Promise<Player[]> {
    return this.playersService.findAll();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Obtener un jugador por ID' })
  @ApiParam({ name: 'id', type: 'number', description: 'ID del jugador' })
  @ApiResponse({
    status: 200,
    description: 'Jugador encontrado',
    type: Player,
  })
  @ApiResponse({ status: 404, description: 'Jugador no encontrado' })
  async findOne(@Param('id', ParseIntPipe) id: number): Promise<Player> {
    return this.playersService.findOne(id);
  }

  @Post()
  @ApiOperation({ summary: 'Crear un nuevo jugador' })
  @ApiBody({ type: CreatePlayerDto })
  @ApiResponse({
    status: 201,
    description: 'Jugador creado correctamente',
    type: Player,
  })
  async create(
    @Body(ValidationPipe) createPlayerDto: CreatePlayerDto,
  ): Promise<Player> {
    return this.playersService.create(createPlayerDto);
  }

  @Put(':id')
  @ApiOperation({ summary: 'Actualizar un jugador' })
  @ApiParam({ name: 'id', type: 'number', description: 'ID del jugador' })
  @ApiBody({ type: UpdatePlayerDto })
  @ApiResponse({
    status: 200,
    description: 'Jugador actualizado correctamente',
    type: Player,
  })
  @ApiResponse({ status: 404, description: 'Jugador no encontrado' })
  async update(
    @Param('id', ParseIntPipe) id: number,
    @Body(ValidationPipe) updatePlayerDto: UpdatePlayerDto,
  ): Promise<Player> {
    return this.playersService.update(id, updatePlayerDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Eliminar un jugador' })
  @ApiParam({ name: 'id', type: 'number', description: 'ID del jugador' })
  @ApiResponse({
    status: 200,
    description: 'Jugador eliminado correctamente',
  })
  @ApiResponse({ status: 404, description: 'Jugador no encontrado' })
  async remove(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<{ message: string }> {
    return this.playersService.remove(id);
  }
}
