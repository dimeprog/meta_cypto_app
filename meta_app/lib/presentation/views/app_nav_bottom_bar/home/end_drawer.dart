import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta_app/app/Resources/color_manager.dart';
import 'package:meta_app/app/Resources/style_manager.dart';

class AppEndDrawer extends StatelessWidget {
  const AppEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                textColor: Colors.black,
                leading: const Icon(
                  Icons.settings,
                ),
                title: Text(
                  'Account Settings',
                  style:
                      getBoldTextStyle(color: ColorManager.dark, fontSize: 15),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.bar_chart,
                ),
                title: Text(
                  'Market',
                  style:
                      getBoldTextStyle(color: ColorManager.dark, fontSize: 15),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, );
                },
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on_sharp),
                title: Text(
                  'Payments',
                  style:
                      getBoldTextStyle(color: ColorManager.dark, fontSize: 15),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, );
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: Text(
                  'Transactions History',
                  style:
                      getBoldTextStyle(color: ColorManager.dark, fontSize: 15),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, '/t');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
