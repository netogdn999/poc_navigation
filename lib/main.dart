import 'package:finance/private/core/constants/theme.dart';
import 'package:finance/private/navigation/navigation_delegate.dart';
import 'package:finance/private/navigation/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: FinanceTheme.data,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      routerDelegate: NavigationDelegate(
        state: NavigationStateImpl()
      ),
    );
  }
}