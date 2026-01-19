import { IsString, IsNotEmpty, MinLength } from 'class-validator';

export class CreateTeamDto {
  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  name!: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(1)
  country!: string;
}

export class UpdateTeamDto {
  @IsString()
  @MinLength(1)
  name?: string;

  @IsString()
  @MinLength(1)
  country?: string;
}
