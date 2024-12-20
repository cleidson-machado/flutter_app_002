// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_app_002/app/childcare_vacancy_finder_routes_app.dart';
import 'package:flutter_app_002/app/feature/a_start/start_page_view.dart';
import 'package:flutter_app_002/app/feature/b_search_start_form/search_start_form_view_copy.dart';
import 'package:flutter_app_002/app/view/childcare_list.dart';
import 'package:flutter_app_002/app/view/childcare_root_page.dart';
import 'package:flutter_app_002/app/view/childcare_vacancy_order_form.dart';

//THIS GUY DEFINES A BASIC THEME FOR ALL APP AND REDIRECT TO THE MAIN PAGE..

class ChildcareVacancyFinderApp extends StatelessWidget {
  const ChildcareVacancyFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: const CardTheme(color: Colors.white10),
        useMaterial3: true,
      ),
      routes: {
        RoutesLib.HOME: (context) => const ChildcareRootPage(),
        RoutesLib.ORDER_VACANCY_FORM: (context) =>
            const ChildcareVacancyOrderForm(),
        RoutesLib.CARDS_LIST_VIEW_START: (context) => const StartPageView(),
        RoutesLib.SEARCH_COMBOS_VIEW_FORM: (context) =>
            const SearchStartFormView(),
        RoutesLib.CARDS_LIST_VIEW_TEST1: (context) => const ChildcareList(),
      },
    );
  }
}
