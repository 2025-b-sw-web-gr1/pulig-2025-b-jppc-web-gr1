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
import { PlayersService } from '../services/players.service';
import { CreatePlayerDto, UpdatePlayerDto } from '../dtos/player.dto';
import { Player } from '../entities/player.entity';

@Controller('players')
export class PlayersController {
  constructor(private readonly playersService: PlayersService) {}

  @Get()
  async findAll(): Promise<Player[]> {
    return this.playersService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id', ParseIntPipe) id: number): Promise<Player> {
    return this.playersService.findOne(id);
  }

  @Post()
  async create(
    @Body(ValidationPipe) createPlayerDto: CreatePlayerDto,
  ): Promise<Player> {
    return this.playersService.create(createPlayerDto);
  }

  @Put(':id')
  async update(
    @Param('id', ParseIntPipe) id: number,
    @Body(ValidationPipe) updatePlayerDto: UpdatePlayerDto,
  ): Promise<Player> {
    return this.playersService.update(id, updatePlayerDto);
  }

  @Delete(':id')
  async remove(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<{ message: string }> {
    return this.playersService.remove(id);
  }
}

