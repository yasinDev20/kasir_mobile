import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_mobile/config/routes/route_paths.dart';

class TransactionItem extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RoutePaths.transactionDetail);
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(
                      'TRX-001',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      '09:15 · 3 produk',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),

                Text('Rp125.000', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Transaction detail
Widget _buildTransactionDetail({required ThemeData theme}) {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemCount: 20 + 1,
    separatorBuilder: (context, index) => const SizedBox(height: 12),
    itemBuilder: (context, index) {
      if (index == 20) {
        return Align(
          alignment: Alignment.centerRight,
          child: FilledButton(onPressed: () {}, child: const Text('Selesai')),
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dimsum mentai', style: theme.textTheme.bodyMedium),
              Text('5 x Rp12.000', style: theme.textTheme.bodyMedium),
            ],
          ),
          const Text('Rp12.000'),
        ],
      );
    },
  );
}
