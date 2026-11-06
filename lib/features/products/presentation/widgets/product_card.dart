import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 12,
        children: [
          //image
          Image.asset('assets/images/dimsum.png'),

          //detail
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'Dimsum original',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                Row(
                  spacing: 10,
                  children: [
                    SvgPicture.asset('assets/icons/PiMoneyWavy.svg'),
                    Text(
                      'Rp12.000',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),

                Row(
                  spacing: 10,
                  children: [
                    SvgPicture.asset('assets/icons/SlBookOpen.svg'),
                    Flexible(
                      child: Text(
                        'Dimsum original 3 pcs dengan saus sachet',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
