import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
    }),
  );

  app.enableCors();

  // Configuración de Swagger
  const config = new DocumentBuilder()
    .setTitle('API de Equipos y Jugadores')
    .setDescription('Documentación de endpoints RESTful con Swagger (OpenAPI)')
    .setVersion('1.0')
    .addTag('teams', 'Operaciones relacionadas con equipos')
    .addTag('players', 'Operaciones relacionadas con jugadores')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  const port = process.env.PORT || 3000;
  await app.listen(port);
  console.log(`Server is running on http://localhost:${port}`);
  console.log(`API Documentation: http://localhost:${port}/api`);
}
bootstrap();
