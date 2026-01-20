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
import { TeamsService } from '../services/teams.service';
import { PlayersService } from '../services/players.service';
import { CreateTeamDto, UpdateTeamDto } from '../dtos/team.dto';
import { Team } from '../entities/team.entity';
import { Player } from '../entities/player.entity';

@ApiTags('teams')
@Controller('teams')
export class TeamsController {
  constructor(
    private readonly teamsService: TeamsService,
    private readonly playersService: PlayersService,
  ) {}

  @Get()
  @ApiOperation({ summary: 'Obtener todos los equipos' })
  @ApiResponse({
    status: 200,
    description: 'Lista de equipos obtenida correctamente',
    type: [Team],
  })
  async findAll(): Promise<Team[]> {
    return this.teamsService.findAll();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Obtener un equipo por ID' })
  @ApiParam({ name: 'id', type: 'number', description: 'ID del equipo' })
  @ApiResponse({
    status: 200,
    description: 'Equipo encontrado',
    type: Team,
  })
  @ApiResponse({ status: 404, description: 'Equipo no encontrado' })
  async findOne(@Param('id', ParseIntPipe) id: number): Promise<Team> {
    return this.teamsService.findOne(id);
  }

  @Get(':id/players')
  @ApiOperation({ summary: 'Obtener jugadores de un equipo específico' })
  @ApiParam({ name: 'id', type: 'number', description: 'ID del equipo' })
  @ApiResponse({
    status: 200,
    description: 'Lista de jugadores del equipo',
    type: [Player],
  })
  @ApiResponse({ status: 404, description: 'Equipo no encontrado' })
  async findTeamPlayers(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<Player[]> {
    // Verify team exists first
    await this.teamsService.findOne(id);
    return this.playersService.findByTeam(id);
  }

  @Post()
  @ApiOperation({ summary: 'Crear un nuevo equipo' })
  @ApiBody({ type: CreateTeamDto })
  @ApiResponse({
    status: 201,
    description: 'Equipo creado correctamente',
    type: Team,
  })
  async create(
    @Body(ValidationPipe) createTeamDto: CreateTeamDto,
  ): Promise<Team> {
    return this.teamsService.create(createTeamDto);
  }

  @Put(':id')
  @ApiOperation({ summary: 'Actualizar un equipo' })
  @ApiParam({ name: 'id', type: 'number', description: 'ID del equipo' })
  @ApiBody({ type: UpdateTeamDto })
  @ApiResponse({
    status: 200,
    description: 'Equipo actualizado correctamente',
    type: Team,
  })
  @ApiResponse({ status: 404, description: 'Equipo no encontrado' })
  async update(
    @Param('id', ParseIntPipe) id: number,
    @Body(ValidationPipe) updateTeamDto: UpdateTeamDto,
  ): Promise<Team> {
    return this.teamsService.update(id, updateTeamDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Eliminar un equipo' })
  @ApiParam({ name: 'id', type: 'number', description: 'ID del equipo' })
  @ApiResponse({
    status: 200,
    description: 'Equipo eliminado correctamente',
  })
  @ApiResponse({ status: 404, description: 'Equipo no encontrado' })
  async remove(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<{ message: string }> {
    return this.teamsService.remove(id);
  }
}
