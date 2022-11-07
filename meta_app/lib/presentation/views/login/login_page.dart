import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/widgets/app_scaffold.dart';
import 'package:meta_app/app/widgets/app_textfield.dart';
import 'package:meta_app/app/widgets/custom_widget.dart';
import 'package:meta_app/app/Resources/color_manager.dart';
import 'package:meta_app/app/Resources/font_manager.dart';
import 'package:meta_app/app/Resources/style_manager.dart';
import 'package:meta_app/presentation/view_models/auth_contoller.dart';
import 'package:meta_app/presentation/views/register/register_page.dart';
import '../../../app/Resources/dimensions.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

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
        color: const Color(0xff78C223),
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff9FD560),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
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
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: ColorManager.dark,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'META',
                              style: getBoldTextStyle(
                                  color: ColorManager.dark,
                                  fontSize: 40.appHeight(context)),
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
                              height: 60,
                            ),
                            AppTextField(
                                controller: emailController, hintText: 'Email'),
                            const SizedBox(
                              height: 20,
                            ),
                            AppTextField(
                                controller: passwordController,
                                hintText: 'Password'),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value: isChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      isChecked = val!;
                                    });
                                  },
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Remember me',
                                    style: TextStyle(
                                        color: ColorManager.dark,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(child: Container()),
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
                                      .loginWithEmailAndPassword(
                                          emailController.text,
                                          passwordController.text,
                                          context);
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  Text(
                                    "Don't have an Account?",
                                    style: TextStyle(
                                        color: ColorManager.dark,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Sign up',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
