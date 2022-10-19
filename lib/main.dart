import 'package:flutter/material.dart';
import 'package:testing1212/pages/home.dart';
import 'package:testing1212/route_generator.dart';
import 'data/my_colors.dart';
import 'widget/my_text.dart';
import 'widget/navigation_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('TGH'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: HomePage(),
    );
  }
}
