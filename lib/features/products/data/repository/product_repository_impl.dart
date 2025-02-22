import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/core/exceptions/network_exceptions.dart';
import 'package:demo_flutter_app/features/products/data/datasource/product_remote_data_source.dart';
import 'package:demo_flutter_app/features/products/domain/models/product.dart';
import 'package:demo_flutter_app/features/products/domain/repository/products_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
class ProductRepositoryImpl implements ProductsRepository {
  ProductRepositoryImpl({required this.remoteDataSource});

  final ProductRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    // TODO: check internet connection and decide
    //    from where the products should be fetched->
    //    Either remote or local
    //   For now, no caching
    try {
      final products = await remoteDataSource.getAllProducts();
      // Save to local database
      return right(products);
    } catch (e) {
      return left(
        NetworkFailure(
          NetworkExceptions.getErrorMessage(
            NetworkExceptions.getException(e),
          ),
        ),
      );
    }
  }
}
