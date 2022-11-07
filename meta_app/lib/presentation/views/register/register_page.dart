import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/presentation/views/login/login_page.dart';

import '../../../app/widgets/app_scaffold.dart';
import '../../../app/widgets/app_textfield.dart';
import '../../../app/widgets/custom_widget.dart';
import '../../../app/Resources/color_manager.dart';
import '../../../app/Resources/font_manager.dart';
import '../../../app/Resources/style_manager.dart';
import '../../view_models/auth_contoller.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    emailController.dispose();
    passwordController.clear();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawer: Container(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [ColorManager.bottomPrimary, ColorManager.topPrimary],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: ListView(
          children: [
            Center(
              child: Column(children: [
                Column(
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
                      'Sign Up',
                      style: getSemiBoldTextStyle(
                          color: ColorManager.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign up and Start trading',
                      style: getMediumTextStyle(
                        color: ColorManager.white,
                        fontSize: FontSizeManager.s18,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    AppTextField(
                        controller: emailController, hintText: 'Email'),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                        controller: passwordController, hintText: 'Password'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: ColorManager.dark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      elevation: 5,
                      height: 50,
                      width: 300,
                      onPressed: () {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          ref
                              .read(authControllerProvider.notifier)
                              .signUpWithEmailAndPassword(emailController.text,
                                  passwordController.text, context);
                        }
                      },
                      text: 'Log In',
                      color: const Color(0xff58c713),
                      childColor: ColorManager.white,
                      fontSize: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'OR',
                      style: getBoldTextStyle(
                          color: ColorManager.dark, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      elevation: 5,
                      height: 50,
                      width: 300,
                      onPressed: () {},
                      text: 'Contiune with Google',
                      color: ColorManager.white,
                      childColor: ColorManager.dark,
                      fontSize: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
