import 'package:flutter/material.dart';
import 'package:meta_app/presentation/Resources/color_manager.dart';

class HomeDetailContainer extends StatelessWidget {
  const HomeDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.bodyLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
