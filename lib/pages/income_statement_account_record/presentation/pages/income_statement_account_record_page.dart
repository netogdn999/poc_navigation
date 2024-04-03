import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:finance/private/src/category1/model/category1_fetch_model.dart';
import 'package:finance/private/src/category2/model/category2_fetch_model.dart';
import 'package:finance/private/src/income_statement_account_type/model/income_statement_account_type_fetch_model.dart';
import 'package:finance/private/src/institution/model/institution_fetch_model.dart';
import 'package:finance/private/src/institution_group/model/institution_group_fetch_model.dart';
import 'package:finance/private/utils/data_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/income_statement_account_record_bloc.dart';

class IncomeStatementAccountRecordPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String title;

  IncomeStatementAccountRecordPage({
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
        child: BlocConsumer<IncomeStatementAccountRecordBloc, IncomeStatementAccountRecordState>(
          listener: (_, state) {
            if(state.status == Status.success) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Conta de resultado adicionado")));
              formKey.currentState?.reset();
            }
          },
          builder: (context, state) {
            return switch (state.status) {
              Status.initial =>  Container(),
              Status.loading =>  const Center(child: CircularProgressIndicator()),
              Status.error =>  Center(child: Text(state.error!.description)),
              _ => FormRecord(
                formKey: formKey,
                groups: state.institutionGroup,
                institutions: state.institutions,
                types: state.types,
                categories1: state.categories1,
                categories2: state.categories2,
                registering: state.status == Status.registering,
                fetchingCategories2: state.status == Status.loadingCategories2,
                fetchingTypes: state.status == Status.loadingTypes,
                fetchingInstitutions: state.status == Status.loadingInstitution,
              )
            };
          },
        ),
      ),
    );
  }
}

class FormRecord extends StatefulWidget {
  final List<InstitutionGroupFetchModel> groups;
  final List<InstitutionFetchModel> institutions;
  final List<Category1FetchModel> categories1;
  final List<Category2FetchModel> categories2;
  final List<IncomeStatementAccountTypeFetchModel> types;
  final GlobalKey<FormState> formKey;
  final bool registering;
  final bool fetchingCategories2;
  final bool fetchingTypes;
  final bool fetchingInstitutions;

  const FormRecord({
    super.key,
    required this.formKey,
    required this.groups,
    required this.institutions,
    required this.categories1,
    required this.categories2,
    required this.types,
    this.registering = false,
    this.fetchingCategories2 = false,
    this.fetchingTypes = false,
    this.fetchingInstitutions = false,
  });

  @override
  State<FormRecord> createState() => _FormRecordState();
}

class _FormRecordState extends State<FormRecord> {
  int? idInstitutionSelected;
  int? idTypeSelected;
  DateTime? selectedDate;
  double? value;

  final GlobalKey<FormFieldState> typesKey = GlobalKey();
  final GlobalKey<FormFieldState> categories2Key = GlobalKey();
  final GlobalKey<FormFieldState> institutionKey = GlobalKey();
  final GlobalKey<FormFieldState> dateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(children: [
          DropdownButtonFormField<int>(
            borderRadius: BorderRadius.circular(
              AppSizes.defaultInputDecorationRadius.radius,
            ),
            decoration: const InputDecoration(
              label: Text("Grupo de instituição"),
            ),
            items: widget.groups.map<DropdownMenuItem<int>>((group) {
              return DropdownMenuItem<int>(
                value: group.id,
                child: Text(group.name),
              );
            }).toList(),
            validator: (value) {
              if(value == null) {
                return AppStrings.institutionGroupNotSelected.value;
              }
              return null;
            },
            onChanged: (value) {
              if (value != null) {
                institutionKey.currentState?.reset();
                context.read<IncomeStatementAccountRecordBloc>().add(FetchInstitution(value));
              }
            },
          ),
          SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
          Row(children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                key: institutionKey,
                borderRadius: BorderRadius.circular(
                  AppSizes.defaultInputDecorationRadius.radius,
                ),
                decoration: const InputDecoration(
                  label: Text("Instituição"),
                ),
                items: widget.institutions.map<DropdownMenuItem<int>>((institution) {
                  return DropdownMenuItem<int>(
                    value: institution.id,
                    child: Text(institution.name),
                  );
                }).toList(),
                validator: (value) {
                  if(value == null) {
                    return AppStrings.institutionNotSelected.value;
                  }
                  return null;
                },
                onChanged: (value) {
                  idInstitutionSelected = value;
                },
              ),
            ),
            if (widget.fetchingInstitutions)
              const Center(child: CircularProgressIndicator())
          ]),
          SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
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
              if (value != null) {
                categories2Key.currentState?.reset();
                typesKey.currentState?.reset();
                context.read<IncomeStatementAccountRecordBloc>().add(FetchCategories2(value));
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
                    typesKey.currentState?.reset();
                    return AppStrings.categoryNotSelected.value;
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value != null) {
                    context.read<IncomeStatementAccountRecordBloc>().add(LoadTypes(value));
                  }
                },
              ),
            ),
            if (widget.fetchingCategories2)
              const Center(child: CircularProgressIndicator())
          ]),
          SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
          Row(children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                key: typesKey,
                borderRadius: BorderRadius.circular(
                  AppSizes.defaultInputDecorationRadius.radius,
                ),
                decoration: const InputDecoration(
                  label: Text("Tipo"),
                ),
                items: widget.types.map<DropdownMenuItem<int>>((type) {
                  return DropdownMenuItem<int>(
                    value: type.id,
                    child: Text(type.name),
                  );
                }).toList(),
                validator: (value) {
                  if(value == null) {
                    return AppStrings.typeNotSelected.value;
                  }
                  return null;
                },
                onChanged: (value) {
                  idTypeSelected = value;
                },
              ),
            ),
            if (widget.fetchingTypes)
              const Center(child: CircularProgressIndicator())
          ]),
          SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
          FormField<DateTime>(
            builder: (fieldState) {
              return InkWell(
                borderRadius: BorderRadius.circular(
                  AppSizes.defaultInputDecorationRadius.radius,
                ),
                onTap: () => _onDatePickerClicked(context, fieldState),
                child: IgnorePointer(
                  child: TextFormField(
                    key: dateKey,
                    decoration: const InputDecoration(
                      hintText: "dd/mm/aaaa",
                    ),
                    controller: TextEditingController()
                      ..text = fieldState.value?.toStringBr() ?? "",
                    readOnly: true,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return AppStrings.dateEmpty.value;
                      }
                      return null;
                    },
                  ),
                ),
              );
            },
            validator: (_) {
              final valid = dateKey.currentState?.validate() ?? false;
              if (!valid) {
                return AppStrings.dateEmpty.value;
              }
              return null;
            },
          ),
          SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Valor"),
            ),
            initialValue: currencyFormatBr(0),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9]*[-]?")),
              CurrencyPtBrInputFormatter(),
            ],
            keyboardType: TextInputType.number,
            validator: (value) {
              if(value != null) {
                final double? result = currencytoDouble(value);
                if (result == null || result <= 0) {
                  return AppStrings.valueZeroOrUnderZero.value;
                }
              }
              return null;
            },
            onChanged: (result) {
              value = currencytoDouble(result);
            },
          ),
          FilledButton(
            onPressed: !widget.registering ? () {
              if (widget.formKey.currentState?.validate() ?? false) {
                context.read<IncomeStatementAccountRecordBloc>().add(RegisterIncomeStatementAccount(
                  institutionId: idInstitutionSelected!,
                  controlDate: selectedDate!,
                  value: value!,
                  typeId: idTypeSelected!,
                ));
              }
            } : null,
            child: widget.registering
            ? const CircularProgressIndicator()
            : Text(AppStrings.register.value),
          )
        ]),
      ),
    );
  }

  Future<void> _onDatePickerClicked(
    BuildContext context,
    FormFieldState<DateTime> fieldState,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale("pt", "BR"),
    );

    selectedDate = date;
    fieldState.didChange(date);
  }
}
