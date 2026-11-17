import 'package:flutter/material.dart';

enum Mode { edit, add }

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.pageMode});
  final Mode pageMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageMode == Mode.add ? 'Tambah produk' : 'Edit produk'),
      ),
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

                if (pageMode == Mode.add)
                  FilledButton(onPressed: () {}, child: Text('Tambahkan')),

                if (pageMode == Mode.edit)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red),
                        ),
                        child: Text('Hapus'),
                      ),
                      FilledButton(onPressed: () {}, child: Text('Edit')),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
