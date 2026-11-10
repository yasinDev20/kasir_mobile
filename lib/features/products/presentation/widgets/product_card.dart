import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    //Edit
                    Align(
                      alignment: AlignmentGeometry.topEnd,
                      child: IconButton.filledTonal(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ),
                    //Product name
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Dimsum mentai', style: Theme.of(context)
                      .textTheme.labelLarge,),
                    ),
                
                    //Textfield
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    //Add Button
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Tambah produk'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 12,
          children: [
            //image
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: Image.asset('assets/images/dimsum.png'),
            ),

            //detail
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    'Dimsum original',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset('assets/icons/PiMoneyWavy.svg'),
                      Flexible(
                        child: Text(
                          'Rp12.000',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
