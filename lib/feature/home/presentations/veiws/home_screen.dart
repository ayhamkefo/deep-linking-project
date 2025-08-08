import 'package:deeplinking_project/core/services/git_it/services_locater.dart';
import 'package:deeplinking_project/core/services/share_linke/share_linke_services.dart';
import 'package:deeplinking_project/core/utils/app_colors.dart';
import 'package:deeplinking_project/core/utils/styles.dart';
import 'package:deeplinking_project/core/widgets/custom_error_widget.dart';
import 'package:deeplinking_project/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deeplinking_project/feature/home/presentations/cubit/home_cubit.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Styles.textStyle16.copyWith(color: AppColors.headingTextColor)),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: getit.get<HomeCubit>()..getProducts(),
        builder: (context, state) {
          if (state is HomeSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return GestureDetector(
                  onTap: () => GoRouter.of(context).push('/product/${product.id}'),
                  child: ListTile(
                    title: Text(product.name, style: Styles.textStyle16.copyWith(color: AppColors.headingTextColor)),
                    subtitle: Text(
                      product.price.toString(),
                      style: Styles.textStyle16.copyWith(color: AppColors.secondaryText),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        ShareService.shareProduct(product);
                      },
                      icon: Icon(Icons.share_rounded),
                      color: AppColors.headingTextColor,
                    ),
                  ),
                );
              },
            );
          }
          if (state is HomeError) {
            return CustomErrorWidget(errorMessage: state.message, onRetry: () => getit.get<HomeCubit>()..getProducts());
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}
