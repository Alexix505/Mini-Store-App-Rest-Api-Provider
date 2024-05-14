import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_store_app_with_restapi_and_provider/const/global_colors.dart';

import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: lightScaffoldColor,
        primaryColor: lightCardColor,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: lightIconsColor,
          ),
          backgroundColor: lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: lightTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: lightIconsColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,
        ),
        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Example swatch
          backgroundColor: lightBackgroudColor,
        ).copyWith(
          secondary: lightIconsColor,
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
