import { Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
@Injectable()
export class PrismaDataService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    await this.$connect()
      .then(async () => {
        console.log(`konek database`);
      })
      .catch((err) => console.log(err));
  }
}
