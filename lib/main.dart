import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/provider/restaurant_detail_provider.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/widget/detail_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => RestaurantDetailProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: MyHomePage(
            title: 'Flutter Demo Home Page',
            controller: TextEditingController(),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    Provider.of<RestaurantDetailProvider>(context, listen: false)
        .eitherFailureOrRestaurantDetail(value: "rqdv5juczeskfw1e867");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            DetailComponent() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
