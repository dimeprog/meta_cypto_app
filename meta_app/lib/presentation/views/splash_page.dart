import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/widgets/app_scaffold.dart';
import 'package:meta_app/presentation/Resources/color_manager.dart';
import 'package:meta_app/presentation/views/home/home_page.dart';
import 'package:meta_app/presentation/views/login/login_page.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  Timer? _timer;
  @override
  void initState() {
    _loadSplash();
    super.initState();
  }

  _loadSplash() {
    Timer _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Homepage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawer: Container(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorManager.primary,
            ColorManager.lightGreen,
            ColorManager.primary
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          child: const Center(
            child: Text(
              'META',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
