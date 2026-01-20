import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Team } from '../entities/team.entity';
import { TeamsService } from '../services/teams.service';
import { TeamsController } from '../controllers/teams.controller';
import { PlayersService } from '../services/players.service';
import { Player } from '../entities/player.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Team, Player])],
  providers: [TeamsService, PlayersService],
  controllers: [TeamsController],
})
export class TeamsModule {}
