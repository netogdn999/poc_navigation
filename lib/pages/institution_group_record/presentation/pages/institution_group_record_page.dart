import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/institution_group_record_bloc.dart';

class InstitutionGroupRecordPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String title;

  InstitutionGroupRecordPage({
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
        child: BlocConsumer<InstitutionGroupRecordBloc, InstitutionGroupRecordState>(
          listener: (_, state) {
            if(state.status == Status.registered) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Grupo de instituições adicionado")));
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
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
          onPressed: !widget.registering ? () {
            if (widget.formKey.currentState?.validate() ?? false) {
              context.read<InstitutionGroupRecordBloc>().add(RegisterInstitutionGroup(
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
