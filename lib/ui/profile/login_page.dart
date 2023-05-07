import 'package:expenses/data/remote/auth_repository.dart';
import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/data/remote/user/login_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Авторизация'),
        previousPageTitle: 'Регистрация',
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Добро пожаловать!',
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                  ),
                ),
                const SizedBox(height: 64),
                CupertinoTextField(
                  placeholder: 'Почта',
                  padding: const EdgeInsets.all(16),
                  controller: _loginController,
                ),
                const SizedBox(height: 24),
                CupertinoTextField(
                  placeholder: 'Пароль',
                  padding: const EdgeInsets.all(16),
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 24),
                CupertinoButton.filled(
                  child: const Text('Войти'),
                  onPressed: () {
                    _login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    final login = _loginController.text;
    final password = _passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      return;
    }

    context
        .read<ExpensesClient>()
        .getUserService()
        .login(LoginRequest(login: login, password: password))
        .then((value) {
      if (value.body?.token != null) {
        context.read<AuthRepository>().setToken(value.body!.token);
        Navigator.of(context).pop();
      }
    });
  }
}
