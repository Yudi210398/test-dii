import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { PrismaDataService } from 'src/prisma-data/prisma-data.service';
import { LoginDto } from './dto-Login/login.dto';

@Injectable()
export class LoginService {
  constructor(private prismaService: PrismaDataService) {}

  async loginValidate(dto: LoginDto) {
    const users = await this.prismaService.karyawan.findFirst({
      where: { username: dto.username },
    });

    if (!users)
      throw new HttpException('username salah', HttpStatus.UNAUTHORIZED);

    if (users.password === dto.password) {
      await this.prismaService.karyawan.update({
        where: { id: users.id },
        data: { status: 'active' },
      });
      return {
        login: 'active',
      };
    }

    throw new HttpException('password salah', HttpStatus.UNAUTHORIZED);
  }
}
