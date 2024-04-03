import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/category1_record_bloc.dart';

class Category1RecordPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String title;

  Category1RecordPage({
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
        child: BlocConsumer<Category1RecordBloc, Category1RecordState>(
          listener: (_, state) {
            if(state.status == Status.registered) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Categoria 1 adicionada")));
              formKey.currentState?.reset();
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case Status.error: return Center(child: Text(state.error!.description));
              case Status.initial:
              case Status.registering:
              case Status.registered:
                return FormRecord(
                  formKey: formKey,
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
  final GlobalKey<FormState> formKey;
  final bool registering;

  const FormRecord({super.key, required this.formKey, this.registering = false});

  @override
  State<FormRecord> createState() => _FormRecordState();
}

class _FormRecordState extends State<FormRecord> {
  String? name;
  bool enableButton = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: widget.formKey,
      onChanged: () {
        setState(() => enableButton = widget.formKey.currentState?.validate() ?? false);
      },
      child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            label: Text("Nome"),
          ),
          validator: (value) {
            if(value == null) {
              return AppStrings.category1RecordTitle.value;
            }
            return null;
          },
          onChanged: (result) {
            name = result;
          },
        ),
        FilledButton(
          onPressed: enableButton && !widget.registering ? () {
            context.read<Category1RecordBloc>().add(RegisterCategory1(
              name: name!,
            ));
          } : null,
          child: widget.registering
          ? const CircularProgressIndicator()
          : Text(AppStrings.register.value),
        )
      ]),
    );
  }
}
