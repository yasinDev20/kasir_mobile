import 'package:flutter/material.dart';
import 'package:kasir_mobile/features/products/presentation/widgets/selected_product.dart';

class TransactionDetail extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail transaksi')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            //Transaction
            ListView.separated(
              itemCount: 20,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return SelectedProduct();
              },
            ),
            //Total
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 12,
                children: [
                  Text(
                    'Harga : Rp. 90.000',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Item : 25',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Diskon : 10%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Produk : 5 jenis',
                    style: Theme.of(context).textTheme.bodyMedium,
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
