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
import { TeamsService } from '../services/teams.service';
import { PlayersService } from '../services/players.service';
import { CreateTeamDto, UpdateTeamDto } from '../dtos/team.dto';
import { Team } from '../entities/team.entity';
import { Player } from '../entities/player.entity';

@Controller('teams')
export class TeamsController {
  constructor(
    private readonly teamsService: TeamsService,
    private readonly playersService: PlayersService,
  ) {}

  @Get()
  async findAll(): Promise<Team[]> {
    return this.teamsService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id', ParseIntPipe) id: number): Promise<Team> {
    return this.teamsService.findOne(id);
  }

  @Get(':id/players')
  async findTeamPlayers(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<Player[]> {
    // Verify team exists first
    await this.teamsService.findOne(id);
    return this.playersService.findByTeam(id);
  }

  @Post()
  async create(
    @Body(ValidationPipe) createTeamDto: CreateTeamDto,
  ): Promise<Team> {
    return this.teamsService.create(createTeamDto);
  }

  @Put(':id')
  async update(
    @Param('id', ParseIntPipe) id: number,
    @Body(ValidationPipe) updateTeamDto: UpdateTeamDto,
  ): Promise<Team> {
    return this.teamsService.update(id, updateTeamDto);
  }

  @Delete(':id')
  async remove(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<{ message: string }> {
    return this.teamsService.remove(id);
  }
}
