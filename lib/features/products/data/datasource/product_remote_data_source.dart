import 'package:demo_flutter_app/core/network/api_service.dart';
import 'package:demo_flutter_app/core/network/api_urls.dart';
import 'package:demo_flutter_app/features/products/domain/models/product.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      final response = await apiService.get(ApiUrls.getAllProudcts);
      final data = response.data['products'] as Iterable;
      final products = List<Product>.from(
        data.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList(),
      );
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
