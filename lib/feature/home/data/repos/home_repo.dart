import 'package:dartz/dartz.dart';
import 'package:deeplinking_project/feature/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, ProductModel>> getProductById(String id);
}
