import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:finance/private/src/category1/model/category1_fetch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/category2_record_bloc.dart';

class Category2RecordPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String title;

  Category2RecordPage({
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
        child: BlocConsumer<Category2RecordBloc, Category2RecordState>(
          listener: (_, state) {
            if(state.status == Status.registered) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Categoria 2 adicionada")));
              formKey.currentState?.reset();
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case Status.initial: return Container();
              case Status.loading: return const Center(child: CircularProgressIndicator());
              case Status.error: return Center(child: Text(state.error!.description));
              case Status.loaded:
              case Status.registering:
              case Status.registered:
                return FormRecord(
                  formKey: formKey,
                  categories1: state.categories1,
                  registering: state.status == Status.registering,
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
  final GlobalKey<FormState> formKey;
  final bool registering;

  const FormRecord({super.key, required this.formKey, required this.categories1, this.registering = false});

  @override
  State<FormRecord> createState() => _FormRecordState();
}

class _FormRecordState extends State<FormRecord> {
  int? category1Selected;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(children: [
        if(widget.categories1.isNotEmpty) ... [
          DropdownButtonFormField<int>(
            borderRadius: BorderRadius.circular(
              AppSizes.defaultInputDecorationRadius.radius,
            ),
            decoration: const InputDecoration(
              label: Text("categoria 1"),
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
              category1Selected = value;
            },
          ),
          SizedBox(height: AppSizes.defaultFormFieldMargin.vertical),
        ],
        TextFormField(
          decoration: const InputDecoration(
            label: Text("Nome"),
          ),
          validator: (value) {
            if(value == null) {
              return AppStrings.nameEmpty.value;
            }
            return null;
          },
          onChanged: (result) {
            name = result;
          },
        ),
        FilledButton(
          onPressed: !widget.registering ? () {
            if(widget.formKey.currentState?.validate() ?? false) {
              context.read<Category2RecordBloc>().add(RegisterCategory2(
                category1Id: category1Selected!,
                name: name!,
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
