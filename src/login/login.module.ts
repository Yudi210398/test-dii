import { Module } from '@nestjs/common';
import { LoginController } from './login.controller';
import { LoginService } from './login.service';
import { PrismaDataModule } from 'src/prisma-data/prisma-data.module';

@Module({
  imports: [PrismaDataModule],
  controllers: [LoginController],
  providers: [LoginService],
})
export class LoginModule {}
