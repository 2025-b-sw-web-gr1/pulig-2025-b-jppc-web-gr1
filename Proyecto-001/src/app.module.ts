import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { Team } from './entities/team.entity';
import { Player } from './entities/player.entity';
import { TeamsModule } from './modules/teams.module';
import { PlayersModule } from './modules/players.module';
import { AppController } from './app.controller';

@Module({
  imports: [
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', 'public'),
    }),
    TypeOrmModule.forRoot({
      type: 'sqlite',
      database: 'db.sqlite',
      entities: [Team, Player],
      synchronize: true,
    }),
    TeamsModule,
    PlayersModule,
  ],
  controllers: [AppController],
})
export class AppModule {}
