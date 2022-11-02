import 'package:flutter/material.dart';
import 'package:meta_app/presentation/Resources/color_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/presentation/Resources/style_manager.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/home/coin_section.dart';

class HomeDetailContainer extends StatelessWidget {
  const HomeDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: ColorManager.bodyLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color(0xffDDF8BD),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Send',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color(0xffDDF8BD),
                      ),
                      child: const Icon(
                        Icons.call_received_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Recieved',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coins',
                style: getBoldTextStyle(color: ColorManager.dark, fontSize: 30),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ))
            ],
          ),
          const CoinListView(),
        ],
      ),
    );
  }
}
