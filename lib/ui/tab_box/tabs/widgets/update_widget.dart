import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_contacts_with_bloc/cubit/get_contacts/get_contacts_cubit.dart';
import 'package:user_contacts_with_bloc/data/models/contact_model.dart';

class UpdateContactDialog extends StatelessWidget {
  ContactModel contactModel;

  UpdateContactDialog({required this.contactModel, Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              context.read<GetContactCubit>().updateContact(
                ContactModel(
                  id: contactModel.id,
                  name: name.text,
                  number: number.text,
                  createdAt: DateTime.now().toString(),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text("Update")),
      ],
      content: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Update Contact"),
            TextField(
              controller: name,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: contactModel.name,
              ),
            ),
            TextField(
              controller: number,
              decoration: InputDecoration(
                hintText: contactModel.number,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
