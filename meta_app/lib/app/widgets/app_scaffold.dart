import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget drawer;
  const AppScaffold({super.key, required this.body, required this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff78C223),
        ),
      ),
      drawer: drawer,
      body: Container(color: const Color(0xff78C223), child: body),
    );
  }
}
