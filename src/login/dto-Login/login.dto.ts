import { IsNotEmpty } from 'class-validator';

export class LoginDto {
  @IsNotEmpty({ message: 'username Tidak Boleh kosong,' })
  username: string;

  @IsNotEmpty({ message: 'username Tidak Boleh kosong,' })
  password: string;
}
