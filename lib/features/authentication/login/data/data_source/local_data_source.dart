import 'package:injectable/injectable.dart';

abstract class LocalDataSource {}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl();
}
