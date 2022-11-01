import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_app/presentation/Resources/style_manager.dart';

class CoinListView extends StatelessWidget {
  const CoinListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          itemBuilder: (context, index) => const CoinWidget()),
    );
  }
}

class CoinWidget extends StatelessWidget {
  const CoinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 200,
      height: 280,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Colors.grey,
            Colors.white54,
            Colors.grey,
            Colors.black,
          ],
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.amber,
            ),
            Text(
              'Bitcoin',
              style: getBoldTextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              '53,978',
              style: getMediumTextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              '+1.7',
              style: getMediumTextStyle(color: Colors.blue, fontSize: 12),
            ),
          ],
        ),
        const Icon(
          FontAwesomeIcons.chartLine,
          size: 50,
        )
      ]),
    );
  }
}
