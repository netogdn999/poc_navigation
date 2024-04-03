import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:finance/private/src/income_statement_account/model/income_statement_account_model.dart';
import 'package:finance/private/utils/data_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/list_income_statement_account_bloc.dart';

class ListIncomeStatementAccountPage extends StatelessWidget {
  final String title;

  const ListIncomeStatementAccountPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: BlocBuilder<ListIncomeStatementAccountBloc, ListIncomeStatementAccountState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial: return Container();
            case Status.loading: return const Center(child: CircularProgressIndicator());
            case Status.error: return Center(child: Text(state.error!.description));
            case Status.fetchAllData: {
              if(state.incomeStatementAccounts.isEmpty) {
                return Center(child: Text(AppStrings.nothingToShown.value));
              }
              return IncomeStatementAccountListTypes(itens: state.incomeStatementAccountsGroupedByType);
            }
          }
        },
      ),
    );
  }
}

class IncomeStatementAccountListTypes extends StatelessWidget {
  final Map<String, List<IncomeStatementAccountModel>> itens;
  const IncomeStatementAccountListTypes({super.key, required this.itens});

  @override
  Widget build(BuildContext context) {
    final itemList = itens.entries.toList();
    return SingleChildScrollView(
      child: ListView.separated(
        itemCount: itemList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final entry = itemList[index];
          return ExpansionTile(
            title: Text(entry.key),
            children: entry.value.map<Widget>((item) {
              return ListTile(
                title: Text(item.controlDate.toStringBr()),
              ); 
            }).toList(),
          );
        },
        separatorBuilder: (_, __) => Divider(
          height: AppSizes.defaultListTileDiverIndent.vertical,
          indent: AppSizes.defaultListTileDiverIndent.horizontal,
        ),
      ),
    );
  }
}
