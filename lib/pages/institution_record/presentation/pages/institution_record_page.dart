import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:finance/private/src/institution_group/model/institution_group_fetch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/institution_record_bloc.dart';

class InstitutionRecordPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String title;

  InstitutionRecordPage({
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
        child: BlocConsumer<InstitutionRecordBloc, InstitutionRecordState>(
          listener: (_, state) {
            if(state.status == Status.registered) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Instituição adicionada")));
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
                  groups: state.groups,
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
  final List<InstitutionGroupFetchModel> groups;
  final GlobalKey<FormState> formKey;
  final bool registering;

  const FormRecord({super.key, required this.formKey, required this.groups, this.registering = false});

  @override
  State<FormRecord> createState() => _FormRecordState();
}

class _FormRecordState extends State<FormRecord> {
  int? groupIdSelected;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(children: [
        if(widget.groups.isNotEmpty) ... [
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
              groupIdSelected = value;
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
              context.read<InstitutionRecordBloc>().add(RegisterInstitution(
                institutionGroupId: groupIdSelected!,
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
