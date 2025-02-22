import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/core/usecases/base_usecase.dart';
import 'package:demo_flutter_app/features/products/domain/models/product.dart';
import 'package:demo_flutter_app/features/products/domain/usecases/products_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsUsecase usecase;
  ProductsBloc(this.usecase) : super(const _Initial()) {
    on<_GetAllProducts>((event, emit) async {
      emit(const _Loading());
      final failureOrSuccess = await usecase.call(NoParams());
      failureOrSuccess.fold(
        (failure) => emit(ProductsState.failure(failure)),
        (products) => emit(ProductsState.success(products)),
      );
    });
  }
}
