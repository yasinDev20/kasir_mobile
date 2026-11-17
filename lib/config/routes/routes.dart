import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_mobile/config/routes/app_shell.dart';
import 'package:kasir_mobile/config/routes/route_paths.dart';
import 'package:kasir_mobile/features/products/presentation/pages/product_detail_page.dart';
import 'package:kasir_mobile/features/products/presentation/pages/transaction_detail.dart';
import 'package:kasir_mobile/features/products/presentation/pages/transaction_page.dart';
import 'package:kasir_mobile/features/sales_summary/presentation/pages/sales_summary_page.dart';

class MyRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.productDetail,
        name: RoutePaths.productDetail,
        builder: (BuildContext context, GoRouterState state) {
          return const ProductDetailPage(pageMode: Mode.edit);
        },
      ),

      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: RoutePaths.home,
            name: RoutePaths.home,

            builder: (BuildContext context, GoRouterState state) {
              return const TransactionPage();
            },
          ),

          GoRoute(
            path: RoutePaths.salesSummary,
            name: RoutePaths.salesSummary,
            builder: (context, state) {
              return SalesSummaryPage();
            },
            routes: [
              GoRoute(
                path: RoutePaths.transactionDetail,
                name: RoutePaths.transactionDetail,
                builder: (context, state) => TransactionDetail(),
              ),
            ],
          ),

          GoRoute(
            path: RoutePaths.addProduct,
            name: RoutePaths.addProduct,
            builder: (context, state) {
              return ProductDetailPage(pageMode: Mode.add);
            },
          ),
        ],
      ),
    ],
  );
}
