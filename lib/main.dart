import 'package:flutter/material.dart';
import 'package:reewer_app/core/router/router.dart';
import 'package:reewer_app/presentation/authorization_pages/login_page.dart';
import 'package:reewer_app/shared/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        primaryColor: AppColors.white,
      ),
      home: LoginPage(),
    );
  }
}
