import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/core/usecases/base_usecase.dart';
import 'package:demo_flutter_app/features/products/domain/models/product.dart';
import 'package:demo_flutter_app/features/products/domain/repository/products_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProductsUsecase implements UseCase<List<Product>, NoParams> {
  ProductsUsecase(this.repository);

  final ProductsRepository repository;
  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return repository.getAllProducts();
  }
}
