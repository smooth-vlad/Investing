import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/message_response.dart';
import 'package:expenses/data/remote/user/login_request.dart';
import 'package:expenses/data/remote/user/login_response.dart';

part 'user_service.chopper.dart';

@ChopperApi(baseUrl: '/api/user')
abstract class UserService extends ChopperService {
  @Post(path: "login")
  Future<Response<LoginResponse>> login(@Body() LoginRequest body);

  @Post(path: "register")
  Future<Response<LoginResponse>> register(@Body() LoginRequest body);

  static UserService create([ChopperClient? client]) => _$UserService(client);
}
