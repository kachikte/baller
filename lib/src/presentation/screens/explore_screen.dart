import 'package:baller/src/config/app_images.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: size.width,
              child: Image.asset(AppImages.explorePng),
            )
          ],
        ),
      ),
    );
  }
}
