import 'package:expenses/data/remote/auth_repository.dart';
import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/data/remote/user/login_request.dart';
import 'package:expenses/ui/profile/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Регистрация'),
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
                    'Создайте аккаунт',
                    style:
                    CupertinoTheme
                        .of(context)
                        .textTheme
                        .textStyle
                        .copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 64),
                CupertinoTextField(
                  controller: _loginController,
                  placeholder: 'Почта',
                  padding: const EdgeInsets.all(16),
                ),
                const SizedBox(height: 24),
                CupertinoTextField(
                  controller: _passwordController,
                  placeholder: 'Пароль',
                  padding: const EdgeInsets.all(16),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                CupertinoButton.filled(
                  child: const Text('Создать аккаунт'),
                  onPressed: () {
                    _register();
                  },
                ),
                const SizedBox(height: 12),
                CupertinoButton(
                  child: Text(
                    "Уже есть аккаунт?",
                    style:
                    CupertinoTheme
                        .of(context)
                        .textTheme
                        .textStyle
                        .copyWith(
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        CupertinoPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    final login = _loginController.text;
    final password = _passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      // TODO show error
      return;
    }

    context
        .read<ExpensesClient>()
        .getUserService()
        .register(LoginRequest(login: login, password: password))
        .then((value) {
      if (value.body?.token != null) {
        context.read<AuthRepository>().setToken(value.body!.token);
      } else {
        print(value.error);
      }
    });
  }
}
