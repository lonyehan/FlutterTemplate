// ignore_for_file: equal_keys_in_map

// package
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:my_first_flutter_app/sagas/index.dart';
import 'package:my_first_flutter_app/store/store.dart';
import 'package:redux/redux.dart';

void main() {
  final ConfigureStore store = ConfigureStore(null);
  store.run(rootSaga);

  runApp(StoreProvider(
    store: store.store as Store<dynamic>,
    child: App(),
  ));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
