import { Module } from '@nestjs/common';
import { LoginModule } from './login/login.module';
import { PrismaDataModule } from './prisma-data/prisma-data.module';

@Module({
  imports: [LoginModule, PrismaDataModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
