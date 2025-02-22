import 'package:demo_flutter_app/core/dependency_injection/injection.dart';
import 'package:demo_flutter_app/core/local_storage/local_storage.dart';
import 'package:demo_flutter_app/core/router/routing.dart';
import 'package:demo_flutter_app/features/authentication/login/presentation/pages/login_page.dart';
import 'package:demo_flutter_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:demo_flutter_app/features/products/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () async {
              final success =
                  await getIt.get<LocalStorage>().removeAccessToken();
              if (success && context.mounted) {
                context.go(AppRoutes.login);
              }
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (failure) => Text(failure.message),
            success: (products) {
              return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCardWidget(product: product);
                  });
            },
          );
        },
      ),
    );
  }
}
