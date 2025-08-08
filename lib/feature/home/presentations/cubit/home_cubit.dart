import 'package:bloc/bloc.dart';
import 'package:deeplinking_project/feature/home/data/models/product_model.dart';
import 'package:deeplinking_project/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());
    final result = await homeRepo.getProducts();
    result.fold((error) => emit(HomeError(message: error)), (products) => emit(HomeSuccess(products: products)));
  }

  Future<void> getProductById(String id) async {
    emit(HomeProductByIdLoading());
    final result = await homeRepo.getProductById(id);
    result.fold(
      (error) => emit(HomeProductByIdError(message: error)),
      (product) => emit(HomeProductById(product: product)),
    );
  }
}
