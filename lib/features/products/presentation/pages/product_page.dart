import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kasir_mobile/features/products/presentation/widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  bool isTransactionExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          spacing: 8,
          children: [
            // Transaction panel
            Container(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.surfaceContainerHighest,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo + info
                  Row(
                    spacing: 14,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: theme.colorScheme.primary),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/LuClipboardList.svg',
                        ),
                      ),

                      Column(
                        spacing: 8,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lihat Transaksi (10 item)',
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            '10 jenis produk',
                            style: theme.textTheme.bodySmall,
                          ),
                          Text('Rp150.000', style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),

                  // Dropdown button
                  IconButton.filledTonal(
                    icon: AnimatedRotation(
                      turns: isTransactionExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                    onPressed: () {
                      setState(() {
                        isTransactionExpanded = !isTransactionExpanded;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Animated content
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                reverseDuration: const Duration(milliseconds: 280),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      alignment: Alignment.topCenter,
                      child: child,
                    ),
                  );
                },
                child: isTransactionExpanded
                    ? _buildTransactionDetail(
                        key: const ValueKey('transaction'),
                        theme: theme,
                      )
                    : _buildProductGrid(key: const ValueKey('products')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Transaction detail
  Widget _buildTransactionDetail({required Key key, required ThemeData theme}) {
    return ListView.separated(
      key: key,
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

  // Product grid
  Widget _buildProductGrid({required Key key}) {
    return GridView.builder(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 240,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => const ProductCard(),
    );
  }
}
