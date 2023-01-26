import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_contacts_with_bloc/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:user_contacts_with_bloc/bloc/get_contacts/get_contacts_cubit.dart';
import 'package:user_contacts_with_bloc/data/models/contact_model.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsBloc, ContactsState>(
      builder: (context, state) {
        List<ContactModel> contacts = state.contacts;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Contact Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ContactsBloc>(context).add(
                        AddContact(
                          contact: ContactModel(
                            name: nameController.text,
                            number: numberController.text,
                            createdAt: DateTime.now().toString(),
                          ),
                        ),
                      );
                    },
                    child: const Text("Add Contact"))
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == ContactStatus.contactAdded ||
            state.status == ContactStatus.contactDeleted ||
            state.status == ContactStatus.contactUpdated) {
          BlocProvider.of<GetContactCubit>(context).fetchContacts();
        }
      },
    );
  }
}
