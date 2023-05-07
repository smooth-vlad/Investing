import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/auth_repository.dart';
import 'package:expenses/data/remote/crypto/get_crypto_response.dart';
import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/ui/home/add_crypto/add_crypto_page.dart';
import 'package:expenses/ui/home/crypto/crypto_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final title = 'Главная';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedSegment = 0;

  Future<Response<GetCryptoResponse>>? cryptoList;

  @override
  void initState() {
    loadCryptoList();
    super.initState();
  }

  void loadCryptoList() {
    cryptoList = context.read<ExpensesClient>().getCryptoService().getCrypto();
  }

  void refresh() {
    setState(() {
      loadCryptoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
        trailing: context.watch<AuthRepository>().token == null
            ? null
            : GestureDetector(
                child: const Icon(CupertinoIcons.add),
                onTap: () {
                  Navigator.of(context)
                      .push(
                        CupertinoPageRoute(
                          builder: (context) => const AddCryptoPage(),
                        ),
                      )
                      .whenComplete(() => refresh());
                },
              ),
        border: null,
      ),
      child: SafeArea(
        child: context.watch<AuthRepository>().token == null
            ? const Center(child: Text("Вы не авторизовались"))
            : _buildHomeContents(),
      ),
    );
  }

  Widget _buildCryptoList(Future<Response<GetCryptoResponse>>? cryptoList) {
    return FutureBuilder<Response<GetCryptoResponse>>(
      future: cryptoList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.body?.crypto == null ||
              snapshot.data!.body!.crypto.isEmpty) {
            return const Center(child: Text("No crypto"));
          }
          return CryptoList(
            snapshot.data!.body!.crypto,
            onRefresh: () {
              refresh();
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return const CupertinoActivityIndicator();
      },
    );
  }

  _buildHomeContents() {
    final Map<int, Widget> segments = {
      0: Text(
        'Криптовалюта',
        style: CupertinoTheme.of(context).textTheme.textStyle,
      ),
      1: Text(
        'Акции',
        style: CupertinoTheme.of(context).textTheme.textStyle,
      ),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoNavigationBar(
          middle: CupertinoSlidingSegmentedControl<int>(
            children: segments,
            onValueChanged: (value) {
              setState(() {
                if (value != null) {
                  _selectedSegment = value;
                }
              });
            },
            groupValue: _selectedSegment,
          ),
          transitionBetweenRoutes: false,
          automaticallyImplyLeading: false,
          automaticallyImplyMiddle: false,
        ),
        Expanded(
          child: CupertinoTabView(
            builder: (BuildContext context) {
              switch (_selectedSegment) {
                case 0:
                  return _buildCryptoList(cryptoList);
                case 1:
                  return const Placeholder();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
