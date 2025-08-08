import 'package:deeplinking_project/core/deep_linking/deep_link_handler.dart';
import 'package:deeplinking_project/core/routing/app_router.dart';
import 'package:deeplinking_project/core/services/git_it/services_locater.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocatorServices();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    DeepLinkHandler(AppRouter.router);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
