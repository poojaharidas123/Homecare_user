import 'package:flutter/material.dart';
import 'package:homecare_user/ui/screen/home_screen.dart';
import 'package:homecare_user/ui/screen/login_screen.dart';
import 'package:homecare_user/values/values.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://gjjjonnhnpplkfatnabs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdqampvbm5obnBwbGtmYXRuYWJzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4MTkyMzM0NCwiZXhwIjoxOTk3NDk5MzQ0fQ.ZGBX6YVdK8vdQjtCqnrcOgJ6O6hu38dN0l1DM4piUEg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          iconColor: primaryColor,
          prefixIconColor: primaryColor,
          suffixIconColor: primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        scaffoldBackgroundColor: secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
