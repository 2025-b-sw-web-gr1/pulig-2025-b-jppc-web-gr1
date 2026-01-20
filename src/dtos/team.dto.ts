import { IsString, IsNotEmpty, MinLength } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateTeamDto {
  @ApiProperty({
    example: 'Barcelona FC',
    description: 'Nombre del equipo',
  })
  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  name!: string;

  @ApiProperty({
    example: 'España',
    description: 'País del equipo',
  })
  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  country!: string;
}

export class UpdateTeamDto {
  @ApiProperty({
    example: 'Real Madrid',
    description: 'Nombre del equipo',
    required: false,
  })
  @IsString()
  @MinLength(1)
  name?: string;

  @ApiProperty({
    example: 'España',
    description: 'País del equipo',
    required: false,
  })
  @IsString()
  @MinLength(1)
  country?: string;
}
