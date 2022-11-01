import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta_app/app/widgets/app_scaffold.dart';
import 'package:meta_app/presentation/Resources/color_manager.dart';
import 'package:meta_app/presentation/Resources/font_manager.dart';
import 'package:meta_app/presentation/Resources/style_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: ColoredBox(
          color: Color(0xff78C223),
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff9FD560),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 40,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'META',
                          style: getBoldTextStyle(
                              color: ColorManager.dark, fontSize: 40),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Welcome back!',
                          style: getSemiBoldTextStyle(
                              color: ColorManager.white,
                              fontSize: FontSizeManager.s20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'login to continue',
                          style: getMediumTextStyle(
                            color: ColorManager.white,
                            fontSize: FontSizeManager.s14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
