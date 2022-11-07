import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/widgets/app_scaffold.dart';
import 'package:meta_app/domian/providers/auth_provider.dart';
import 'package:meta_app/app/Resources/color_manager.dart';

import 'package:meta_app/app/Resources/style_manager.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/home/detail_container.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/home/end_drawer.dart';
import 'package:meta_app/presentation/views/login/login_page.dart';

import '../../../Resources/font_manager.dart';

class Homepage extends ConsumerWidget {
  Homepage({super.key});
  final GlobalKey<ScaffoldState> _drawerOpener = GlobalKey<ScaffoldState>();
  final double bal = 5490.34;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final authUser = ref.watch(authStateChangeProvider);
    return Scaffold(
      key: _drawerOpener,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff78C223),
        ),
      ),
      endDrawer: const AppEndDrawer(),
      body: Container(
        color: const Color(0xff78C223),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: const Color(0xff78C223),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        if (authUser.value == null)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                            },
                            child: Text(
                              'Login/Register',
                              style: getBoldTextStyle(
                                  color: ColorManager.dark,
                                  fontSize: FontSizeManager.s18),
                            ),
                          ),
                        Expanded(child: Container()),
                        IconButton(
                          onPressed: () {
                            _drawerOpener.currentState!.openEndDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Balance:',
                            style: getBoldTextStyle(
                                color: ColorManager.dark, fontSize: 20),
                            children: [
                              TextSpan(
                                text: ' \$ $bal',
                                style: getBoldTextStyle(
                                    color: ColorManager.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: ColorManager.white),
                            child: Text(
                              'Fund',
                              style: getSemiBoldTextStyle(
                                  color: ColorManager.topPrimary, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            const Expanded(child: HomeDetailContainer()),
          ],
        ),
      ),
    );
  }
}
