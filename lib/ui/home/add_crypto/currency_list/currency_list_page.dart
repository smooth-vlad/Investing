import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/currency/get_currency_list_response.dart';
import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/data/remote/token_list/get_token_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'currency_list.dart';

class CurrencyListPage extends StatefulWidget {
  const CurrencyListPage({Key? key}) : super(key: key);

  @override
  State<CurrencyListPage> createState() => _CurrencyListPageState();
}

class _CurrencyListPageState extends State<CurrencyListPage> {
  String _searchQuery = "";

  Future<Response<GetCurrencyListResponse>>? currencyList;

  @override
  void initState() {
    super.initState();
    currencyList =
        context.read<ExpensesClient>().getCryptoService().getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Выбор валюты"),
        previousPageTitle: "Добавление",
        border: null,
      ),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoNavigationBar(
              middle: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CupertinoSearchTextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              automaticallyImplyLeading: false,
              automaticallyImplyMiddle: false,
              transitionBetweenRoutes: false,
              heroTag: "search",
            ),
            Expanded(
              child: FutureBuilder<Response<GetCurrencyListResponse>>(
                future: currencyList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.body?.currencies == null ||
                        snapshot.data!.body!.currencies!.isEmpty) {
                      return Text(snapshot.data.toString());
                    }
                    return CurrencyList(snapshot.data!.body!.currencies!,
                        filter: _searchQuery);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CupertinoActivityIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
