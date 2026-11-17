import 'package:flutter/material.dart';

class SelectedProduct extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Text
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dimsum mentai',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '5 x Rp12.000',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const Text('Rp12.000'),
            ],
          ),
        ),

        IconButton(
          onPressed: () {
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
    
                        //Product name
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Dimsum mentai',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),

                        //Textfield
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 16),
                        //Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             FilledButton(
                              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
                              child: const Text('Hapus'),
                              onPressed: () {},
                            ),
                            FilledButton(
                              child: const Text('Edit'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }
}
