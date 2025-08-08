import 'package:deeplinking_project/core/services/git_it/services_locater.dart';
import 'package:deeplinking_project/core/utils/app_colors.dart';
import 'package:deeplinking_project/core/utils/styles.dart';
import 'package:deeplinking_project/core/widgets/custom_error_widget.dart';
import 'package:deeplinking_project/core/widgets/loading_widget.dart';
import 'package:deeplinking_project/feature/home/presentations/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: Styles.textStyle16.copyWith(color: AppColors.headingTextColor)),
        foregroundColor: AppColors.headingTextColor,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: getit.get<HomeCubit>()..getProductById(productId),
        builder: (context, state) {
          if (state is HomeProductById) {
            return Center(
              child: Text(state.product.name, style: Styles.textStyle16.copyWith(color: AppColors.headingTextColor)),
            );
          }
          if (state is HomeError) {
            return CustomErrorWidget(
              errorMessage: state.message,
              onRetry: () => getit.get<HomeCubit>()..getProductById(productId),
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}
