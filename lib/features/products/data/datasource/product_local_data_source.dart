import 'package:injectable/injectable.dart';

abstract class ProductLocalDataSource {}

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  ProductLocalDataSourceImpl();
}
