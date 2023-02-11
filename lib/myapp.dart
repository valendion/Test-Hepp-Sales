import 'package:flutter/material.dart';
import 'package:test_happ_sales/utils/routes.dart';

import 'presentation/page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Hap Sales',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
