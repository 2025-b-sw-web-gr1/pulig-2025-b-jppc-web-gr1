import { IsString, IsNotEmpty, IsNumber, MinLength } from 'class-validator';

export class CreatePlayerDto {
  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  name!: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  position!: string;

  @IsNumber()
  @IsNotEmpty()
  teamId!: number;
}

export class UpdatePlayerDto {
  @IsString()
  @MinLength(1)
  name?: string;

  @IsString()
  @MinLength(1)
  position?: string;

  @IsNumber()
  teamId?: number;
}
