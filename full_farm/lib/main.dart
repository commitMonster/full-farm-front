import 'package:flutter/material.dart';
import 'package:full_farm/features/auth/presentation/pages/auth_page.dart';
import 'package:full_farm/features/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() async{
  await di.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.sl<AuthProvider>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage()
    );
  }
}
