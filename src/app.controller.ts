import { Controller, Get } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';

@ApiTags('api')
@Controller('api')
export class AppController {
  @Get('info')
  @ApiOperation({ summary: 'Información de la API' })
  @ApiResponse({ status: 200, description: 'Información de bienvenida' })
  getInfo(): object {
    return {
      message: 'Bienvenido al API del Proyecto 001 - Swagger',
      endpoints: {
        teams: '/teams',
        players: '/players',
        swagger: '/api',
      },
    };
  }
}
