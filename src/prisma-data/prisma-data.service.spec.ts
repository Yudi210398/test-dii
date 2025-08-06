import { Test, TestingModule } from '@nestjs/testing';
import { PrismaDataService } from './prisma-data.service';

describe('PrismaDataService', () => {
  let service: PrismaDataService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PrismaDataService],
    }).compile();

    service = module.get<PrismaDataService>(PrismaDataService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
