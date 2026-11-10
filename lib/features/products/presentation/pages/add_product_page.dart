import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambahkan produk')),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 100,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    Icons.add_photo_alternate_rounded,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Harga',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Keterangan lainnya',
                    border: OutlineInputBorder(),
                  ),
                ),

                FilledButton(onPressed: () {}, child: Text('Tambahkan')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
