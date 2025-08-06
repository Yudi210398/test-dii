import { Body, Controller, Post } from '@nestjs/common';
import { LoginDto } from './dto-Login/login.dto';
import { LoginService } from './login.service';

@Controller('login')
export class LoginController {
  constructor(private serviceLogin: LoginService) {}

  @Post()
  async loginValidate(@Body() data: LoginDto) {
    return this.serviceLogin.loginValidate(data);
  }
}
