import 'package:kasir_mobile/config/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kasir_mobile/core/constant/Icon_assets.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      // BlocListener<AuthBloc, AuthState>(
      //   listener: (context, state) {
      //     if (state.authEntity == null) {
      //       context.goNamed(RouteNames.login);
      //     }
      //     if (state.status == AuthStatus.failure) {
      //       ShowFeedback.showSnackbar(
      //         isFailure: true,
      //         context: context,
      //         text: state.failure?.message,
      //       );
      //     }
      //   },
      //   child: SelectionArea(child: SafeArea(child: child)),
      // ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex(context),
        onDestinationSelected: (int index) => _onItemTapped(index, context),

        backgroundColor: Colors.white,

        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(IconAssets.cashier),
            label: "Kasir",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(IconAssets.summary),
            label: "Rangkuman",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(IconAssets.addProduct),
            label: "Tambah produk",
          ),
        ],
      ),
    );
  }

  static int _selectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location == RoutePaths.home) {
      return 0;
    }
    if (location.startsWith(RoutePaths.salesSummary)) {
      return 1;
    }
    if (location.startsWith(RoutePaths.addProduct)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(RoutePaths.home);
      case 1:
        GoRouter.of(context).go(RoutePaths.salesSummary);
      case 2:
        GoRouter.of(context).go(RoutePaths.addProduct);
    }
  }
}
