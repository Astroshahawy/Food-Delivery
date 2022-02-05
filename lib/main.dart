import 'package:flutter/material.dart';
import 'screens/cart_screen.dart';
import 'screens/restaurants_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
        appBarTheme: AppBarTheme().copyWith(
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        RestaurantsScreen.routeName: (context) => RestaurantsScreen(),
        CartScreen.routeName: (context) => CartScreen(),
      },
    );
  }
}
