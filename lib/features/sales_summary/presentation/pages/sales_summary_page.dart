import 'package:flutter/material.dart';
import 'package:kasir_mobile/features/products/presentation/widgets/transaction_Item.dart';

class SalesSummaryPage extends StatefulWidget {
  const new({super.key});

  @override
  State<SalesSummaryPage> createState() => _SalesSummaryPageState();
}

class _SalesSummaryPageState extends State<SalesSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        //title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rangkuman',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Ringkasan penjualan',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(size: 12, Icons.calendar_today),
                      Text(
                        'Hari ini',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
              IconButton.filled(
                icon: Icon(Icons.calendar_month),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(onTap: () {}, title: Text('Semua')),
                        ListTile(onTap: () {}, title: Text('Hari ini')),
                        ListTile(onTap: () {}, title: Text('Bulan ini')),
                        ListTile(onTap: () {}, title: Text('Tahun ini')),
                        ListTile(
                          onTap: () async {
                            final result = await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                              helpText: 'Pilih rentang tanggal',
                              fieldStartLabelText: 'Mulai',
                              fieldEndLabelText: 'Akhir',
                              cancelText: 'Batal',
                              confirmText: 'Terapkan',
                              saveText: 'Terapkan',
                            );
                          },
                          title: Text('Pilih tanggal'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //total
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total penjualan',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Rp1.250.000',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transaksi',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '24',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Produk terjual',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),

                        Text(
                          '58 item',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        //transaction history
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Riwayat transaksi',
                  style: Theme.of(context).textTheme.labelLarge,
                ),

                SizedBox(height: 16),

                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: 10,
                    itemBuilder: (context, index) => TransactionItem(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
