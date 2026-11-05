import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //image
        Image.asset('assets/images/dimsum.png'),

        //detail
        Column(
          children: [
            Text('Dimsum original'),

            Row(
              children: [
                SvgPicture.asset('assets/icons/PiMoneyWavy.svg'),
                Text('Rp12.000'),
              ],
            ),

            Row(
              children: [
                SvgPicture.asset('assets/icons/SlBookOpen.svg'),
                Text('Dimsum original 3 pcs'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
