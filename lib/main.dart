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

class HomePage extends StatefulWidget {
  late Widget? widget;
  HomePage({this.widget});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Lonyehan"),
              accountEmail: Text("lonyehan@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("L"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () => {context.go('/')},
            )
          ],
        ),
      ),
      body: widget.widget,
    );
  }
}
