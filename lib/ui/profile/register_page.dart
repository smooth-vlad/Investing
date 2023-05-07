import 'package:expenses/ui/profile/login_page.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                const CupertinoTextField(
                  placeholder: 'Почта',
                  padding: EdgeInsets.all(16),
                ),
                const SizedBox(height: 24),
                const CupertinoTextField(
                  placeholder: 'Пароль',
                  padding: EdgeInsets.all(16),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                CupertinoButton.filled(
                  child: const Text('Создать аккаунт'),
                  onPressed: () {},
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
}
