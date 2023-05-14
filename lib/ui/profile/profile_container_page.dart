import 'package:expenses/data/remote/auth_repository.dart';
import 'package:expenses/ui/profile/profile_page.dart';
import 'package:expenses/ui/profile/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfileContainerPage extends StatefulWidget {
  const ProfileContainerPage({Key? key}) : super(key: key);

  @override
  State<ProfileContainerPage> createState() => _ProfileContainerPageState();
}

class _ProfileContainerPageState extends State<ProfileContainerPage> {
  @override
  Widget build(BuildContext context) {
    return context.watch<AuthRepository>().token == null
        ? const RegisterPage()
        : const ProfilePage();
  }
}
