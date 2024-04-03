import 'dart:async';

import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/exception.dart';
import 'package:finance/private/navigation/navigation_delegate.dart';
import 'package:finance/private/navigation/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_pages.dart';

void main() {

  FutureOr<void> loadMainPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        title: 'Flutter teste',
        routerDelegate: NavigationDelegate(
          state: NavigationStateImpl(
            builderPages: () => const {
              BaseRoutes.home: MockPageRouteOne(),
              BaseRoutes.typeRecord: MockPageRouteTwo(),
            })
        ),
      ),
    );
  }

  group(
    'On build navigation',
    () {

      testWidgets(
        'should load the homePage',
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final appBar = find.text('home page');
          expect(appBar, findsOneWidget);
        },
      );
    },
  );

  group(
    'On navigate forward',
    () {
      testWidgets(
        'should load a next page',
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final navigateButton = find.byType(TextButton);
          await tester.tap(navigateButton);
          await tester.pumpAndSettle();
          final appBar = find.text('Second Page');

          expect(appBar, findsOneWidget);
        },
      );

      testWidgets(
        'should load a third page if a second page is already loaded',
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final navigateButtonSecondPage = find.byType(TextButton);
          await tester.tap(navigateButtonSecondPage);
          await tester.pumpAndSettle();

          final navigateButtonThirdPage = find.byType(TextButton);
          await tester.tap(navigateButtonThirdPage);
          await tester.pumpAndSettle();
          final appBar = find.text('Third Page');

          expect(appBar, findsOneWidget);
        },
      );

      testWidgets(
        'should thrown a RouteNotFoundException if a route not be finded', 
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final navigateButton = find.byType(OutlinedButton);
          await tester.tap(navigateButton);
          await tester.pumpAndSettle();

          expectSync(tester.takeException(), isInstanceOf<RouteNotFoundException>());
        },
      );
    },
  );

  group(
    'On navigate backward', 
    () {
      testWidgets(
        'should load a page',
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final navigateButton = find.byType(TextButton);
          await tester.tap(navigateButton);
          await tester.pumpAndSettle();
          final appBarSecondPage = find.text('Second Page');

          expect(appBarSecondPage, findsOneWidget);

          await tester.pageBack();
          await tester.pumpAndSettle();

          final appBar = find.text('home page');
          expect(appBar, findsOneWidget);
        },
      );

      testWidgets(
        'shouldn\'t load a page if there is only one page in stack',
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final appBar = find.text('home page');
          expect(appBar, findsOneWidget);

          final dynamic backButton = tester.state(find.byType(WidgetsApp));
          await backButton.didPopRoute();
          await tester.pumpAndSettle();

          final otherAppBar = find.text('home page');
          expect(otherAppBar, findsOneWidget);
        },
      );
    },
  );

  group(
    'On navigate replace', 
    () {
      testWidgets(
        'should replace the current route to new route', 
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final replaceButton = find.byType(ElevatedButton);
          await tester.tap(replaceButton);
          await tester.pumpAndSettle();

          final appBar = find.text('Third Page');
          expect(appBar, findsOneWidget);
        },
      );

      testWidgets(
        'should thrown a RouteNotFoundException if a route not be finded', 
        (WidgetTester tester) async {
          await loadMainPage(tester);
          await tester.pumpAndSettle();

          final replaceButton = find.byType(FilledButton);
          await tester.tap(replaceButton);
          await tester.pumpAndSettle();

          expectSync(tester.takeException(), isInstanceOf<RouteNotFoundException>());
        },
      );
    },
  );
}