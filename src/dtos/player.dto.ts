import { IsString, IsNotEmpty, IsNumber, MinLength } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreatePlayerDto {
  @ApiProperty({
    example: 'Lionel Messi',
    description: 'Nombre del jugador',
  })
  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  name!: string;

  @ApiProperty({
    example: 'Delantero',
    description: 'Posición del jugador',
  })
  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  position!: string;

  @ApiProperty({
    example: 1,
    description: 'ID del equipo',
  })
  @IsNumber()
  @IsNotEmpty()
  teamId!: number;
}

export class UpdatePlayerDto {
  @ApiProperty({
    example: 'Cristiano Ronaldo',
    description: 'Nombre del jugador',
    required: false,
  })
  @IsString()
  @MinLength(1)
  name?: string;

  @ApiProperty({
    example: 'Extremo',
    description: 'Posición del jugador',
    required: false,
  })
  @IsString()
  @MinLength(1)
  position?: string;

  @ApiProperty({
    example: 2,
    description: 'ID del equipo',
    required: false,
  })
  @IsNumber()
  teamId?: number;
}
