import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                color: Colors.yellowAccent,
              ),
            )));
  }
}
