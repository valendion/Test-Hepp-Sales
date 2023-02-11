import 'package:flutter/material.dart';
import 'package:test_happ_sales/presentation/page/contact_page.dart';
import 'package:test_happ_sales/presentation/page/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  HomePage.routeName: (context) => const HomePage(),
  ContactPage.routeName: (context) => const ContactPage()
};
