import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Player } from '../entities/player.entity';
import { CreatePlayerDto, UpdatePlayerDto } from '../dtos/player.dto';

@Injectable()
export class PlayersService {
  constructor(
    @InjectRepository(Player)
    private playersRepository: Repository<Player>,
  ) {}

  async findAll(): Promise<Player[]> {
    return this.playersRepository.find({ relations: ['team'] });
  }

  async findOne(id: number): Promise<Player> {
    const player = await this.playersRepository.findOne({
      where: { id },
      relations: ['team'],
    });
    if (!player) {
      throw new NotFoundException(`Player with ID ${id} not found`);
    }
    return player;
  }

  async findByTeam(teamId: number): Promise<Player[]> {
    return this.playersRepository.find({
      where: { teamId },
      relations: ['team'],
    });
  }

  async create(createPlayerDto: CreatePlayerDto): Promise<Player> {
    const player = this.playersRepository.create(createPlayerDto);
    return this.playersRepository.save(player);
  }

  async update(id: number, updatePlayerDto: UpdatePlayerDto): Promise<Player> {
    await this.findOne(id);
    await this.playersRepository.update(id, updatePlayerDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<{ message: string }> {
    await this.findOne(id);
    await this.playersRepository.delete(id);
    return { message: `Player with ID ${id} has been deleted` };
  }
}
