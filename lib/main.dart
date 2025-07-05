import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_data_transfer/providers/cart_provider.dart';
import 'package:provider_data_transfer/providers/product_provider.dart';
import 'package:provider_data_transfer/screens/splash.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
         ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      home: SplashScreen(),
    );
  }
}
