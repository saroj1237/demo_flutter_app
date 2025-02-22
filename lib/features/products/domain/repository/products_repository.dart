import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/features/products/domain/models/product.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductsRepository {
  Future<Either<Failure,List<Product>>> getAllProducts();
}
