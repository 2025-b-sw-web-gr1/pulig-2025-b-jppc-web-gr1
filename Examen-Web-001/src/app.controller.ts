import { Controller, Get } from '@nestjs/common';

@Controller('api')
export class AppController {
  @Get('info')
  getInfo(): object {
    return {
      message: 'Bienvenido al API del Examen 02',
      endpoints: {
        teams: '/teams',
        players: '/players',
      },
    };
  }
}
