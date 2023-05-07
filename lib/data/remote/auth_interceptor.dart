import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthInterceptor extends RequestInterceptor {
  final BuildContext context;

  AuthInterceptor(this.context);

  @override
  FutureOr<Request> onRequest(Request request) async {
    final authRepository = context.read<AuthRepository>();

    final modifiedRequest = request.copyWith(
      headers: {
        ...request.headers,
        'Authorization': authRepository.token ?? ""
      },
    );
    return modifiedRequest;
  }
}
