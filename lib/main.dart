import 'package:flutter/material.dart';
import 'package:nourish_app/widgets/app_text_field.dart';

import 'package:provider/provider.dart';

import 'router.dart';
import 'providers.dart';

void main() {
  runApp( MaterialApp(home:ProfileInfoScreen())/*MyApp()*/);
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'Nourish App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: router,
      ),
    );
  }
}*/
