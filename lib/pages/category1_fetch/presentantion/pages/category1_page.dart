import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_actions.dart';
import 'package:finance/private/src/category1/repository/mock/mock_category1_fetch_all_with_averagerepository.dart';
import 'package:finance/private/src/category1/repository/remote/remote_category1_fetch_all_with_average_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/category1_fetch_bloc.dart';
import '../../../../private/src/category1/repository/category1_repository_interface.dart';
import '../widgets/category_card.dart';

part '../../injection/injection_bottomsheet.dart';

class Category1Page extends StatelessWidget {
  const Category1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const _InjectionBottomSheet(
      child: Category1ContentPage(),
    );
  }
}

class Category1ContentPage extends StatelessWidget {

  const Category1ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Category1FetchBloc, Category1FetchState>(
      builder: (_, state) {
        return switch (state.status) {
          Status.inital => Container(),
          Status.loading => const Center(child: CircularProgressIndicator()),
          Status.error => Center(child: Text(state.error!.description)),
          Status.loadedData =>
            ListView.builder(
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryCard(
                  onItemClick: (category) {
                    NavigationAction.of(context).navigate(
                      BaseRoutes.category1Details, params: {
                      'category': category,
                    });
                  },
                  category: state.categories[index],
                );
              },
            )
        };
      },
    );
  }
}
