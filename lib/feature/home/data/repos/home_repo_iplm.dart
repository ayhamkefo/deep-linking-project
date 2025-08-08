import 'package:dartz/dartz.dart';
import 'package:deeplinking_project/core/services/api/api_services.dart';
import 'package:deeplinking_project/core/services/api/urls.dart';
import 'package:deeplinking_project/feature/home/data/models/product_model.dart';
import 'package:deeplinking_project/feature/home/data/repos/home_repo.dart';

class HomeRepoIplm implements HomeRepo {
  final ApiServices apiServices;
  HomeRepoIplm(this.apiServices);
  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final response = await apiServices.get(endPoint: Urls.products);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = response.data;
        final List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
        return Right(products);
      }
      return Left("ops there is an error, pleas try later");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductModel>> getProductById(String id) async {
    try {
      final response = await apiServices.get(endPoint: "${Urls.products}/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final ProductModel product = ProductModel.fromJson(response.data);
        return Right(product);
      }
      return Left("ops there is an error, pleas try later");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
