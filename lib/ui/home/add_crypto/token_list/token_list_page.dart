import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/data/remote/token_list/get_token_list_response.dart';
import 'package:expenses/data/remote/token_list_search/search_token_list_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'token_list.dart';

class TokenListPage extends StatefulWidget {
  const TokenListPage({Key? key}) : super(key: key);

  @override
  State<TokenListPage> createState() => _TokenListPageState();
}

class _TokenListPageState extends State<TokenListPage> {
  String _searchQuery = "";

  Future<Response<GetTokenListResponse>>? _tokenList;

  void _sendSearchRequest() {
    if (_searchQuery.isEmpty) {
      return;
    }

    setState(() {
      _tokenList = context
          .read<ExpensesClient>()
          .getCryptoService()
          .searchTokens(SearchCryptoRequest(query: _searchQuery));
    });
  }

  @override
  void initState() {
    super.initState();
    _tokenList = context.read<ExpensesClient>().getCryptoService().getTokens();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Выбор монеты"),
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
                  onSubmitted: (value) {
                    _sendSearchRequest();
                  },
                ),
              ),
              automaticallyImplyLeading: false,
              automaticallyImplyMiddle: false,
              transitionBetweenRoutes: false,
              heroTag: "search",
            ),
            Expanded(
              child: FutureBuilder<Response<GetTokenListResponse>>(
                future: _tokenList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    if (snapshot.data?.body?.tokens == null ||
                        snapshot.data!.body!.tokens!.isEmpty) {
                      return Text(snapshot.data.toString());
                    }
                    return TokenList(snapshot.data!.body!.tokens!);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
