import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/config/app_router.dart';
import 'package:flutter_whats_clone/redux/store.dart';
import 'package:flutter_whats_clone/themes/dark_theme.dart';
import 'package:flutter_whats_clone/themes/light_theme.dart';
import 'package:flutter_whats_clone/widgets/pages/chat_page.dart';

class App extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'WhatsClone',
        theme: kAppLightTheme,
        darkTheme: kAppDarkTheme,
        initialRoute: ChatPage.routeName,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
