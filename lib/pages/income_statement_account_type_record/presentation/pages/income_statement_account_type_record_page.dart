import 'package:finance/private/core/constants/colors.dart';
import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:finance/private/src/category1/model/category1_fetch_model.dart';
import 'package:finance/private/src/category2/model/category2_fetch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/income_statement_account_type_bloc.dart';

class IncomeStatementAccountTypeRecordPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String title;

  IncomeStatementAccountTypeRecordPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.defaultPagePadding.top,
          horizontal: AppSizes.defaultPagePadding.left,
        ),
        child: BlocConsumer<IncomeStatementAccountTypeBloc, IncomeStatementAccountTypeState>(
          listener: (_, state) {
            if(state.status == Status.registered) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Tipo de conta de resultado adicionado")));
              formKey.currentState?.reset();
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case Status.initial: return Container();
              case Status.loading: return const Center(child: CircularProgressIndicator());
              case Status.error: return Center(child: Text(state.error!.description));
              case Status.loadingCategories2:
              case Status.loaddedCategories:
              case Status.registering:
              case Status.registered:
                return FormRecord(
                  formKey: formKey,
                  categories1: state.categories1,
                  categories2: state.categories2,
                  registering: state.status == Status.registering,
                  fetchingCategory2: state.status == Status.loadingCategories2,
                );
            }
          },
        ),
      ),
    );
  }
}

class FormRecord extends StatefulWidget {
  final List<Category1FetchModel> categories1;
  final List<Category2FetchModel> categories2;
  final GlobalKey<FormState> formKey;
  final bool registering;
  final bool fetchingCategory2;

  const FormRecord({
    super.key,
    required this.formKey,
    required this.categories1,
    required this.categories2,
    this.fetchingCategory2 = false,
    this.registering = false,
  });

  @override
  State<FormRecord> createState() => _FormRecordState();
}

class _FormRecordState extends State<FormRecord> {
  int? category2IdSelected;
  String? name;
  bool isExpense = true;

  final GlobalKey<FormFieldState> categories2Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(children: [
        DropdownButtonFormField<int>(
          borderRadius: BorderRadius.circular(
            AppSizes.defaultInputDecorationRadius.radius,
          ),
          decoration: const InputDecoration(
            label: Text("Categoria 1"),
          ),
          items: widget.categories1.map<DropdownMenuItem<int>>((category) {
            return DropdownMenuItem<int>(
              value: category.id,
              child: Text(category.name),
            );
          }).toList(),
          validator: (value) {
            if(value == null) {
              return AppStrings.categoryNotSelected.value;
            }
            return null;
          },
          onChanged: (value) {
            if(value != null) {
              categories2Key.currentState?.reset();
              context.read<IncomeStatementAccountTypeBloc>().add(FetchCategories2(value));
            }
          },
        ),
        SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
        Row(children: [
          Expanded(
            child: DropdownButtonFormField<int>(
              key: categories2Key,
              borderRadius: BorderRadius.circular(
                AppSizes.defaultInputDecorationRadius.radius,
              ),
              decoration: const InputDecoration(
                label: Text("Categoria 2"),
              ),
              items: widget.categories2.map<DropdownMenuItem<int>>((category) {
                return DropdownMenuItem<int>(
                  value: category.id,
                  child: Text(category.name),
                );
              }).toList(),
              validator: (value) {
                if(value == null) {
                  return AppStrings.categoryNotSelected.value;
                }
                return null;
              },
              onChanged: (value) {
                category2IdSelected = value;
              },
            ),
          ),
          if(widget.fetchingCategory2) 
            const Center(child: CircularProgressIndicator()),
        ]),
        SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
        TextFormField(
          decoration: const InputDecoration(
            label: Text("Nome do tipo"),
          ),
          validator: (value) {
            if(value == null || value.isEmpty) {
              return AppStrings.nameIncomeStatementAccountTypeEmpty.value;
            }
            return null;
          },
          onChanged: (result) {
            name = result;
          },
        ),
        SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RadioListTile<bool>(
                value: true,
                title: const Text("Despesa"),
                tileColor: AppColors.white.color,
                groupValue: isExpense,
                onChanged: (value) {
                  setState(() => isExpense = value ?? true);
                },
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                value: false,
                title: const Text("Receita"),
                tileColor: AppColors.white.color,
                groupValue: isExpense,
                onChanged: (value) {
                  setState(() => isExpense = value ?? false);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
        FilledButton(
          onPressed: !widget.registering ? () {
            if (widget.formKey.currentState?.validate() ?? false) {
              context.read<IncomeStatementAccountTypeBloc>().add(RegisterTyper(
                category2Id: category2IdSelected!,
                name: name!,
                isExpense: isExpense,
              ));
            }
          } : null,
          child: widget.registering
          ? const CircularProgressIndicator()
          : Text(AppStrings.register.value),
        )
      ]),
    );
  }
}
