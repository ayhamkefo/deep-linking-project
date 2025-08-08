part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductModel> products;
  const HomeSuccess({required this.products});
}

final class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});
}

final class HomeProductById extends HomeState {
  final ProductModel product;
  const HomeProductById({required this.product});
}

final class HomeProductByIdError extends HomeState {
  final String message;
  const HomeProductByIdError({required this.message});
}

final class HomeProductByIdLoading extends HomeState {}
