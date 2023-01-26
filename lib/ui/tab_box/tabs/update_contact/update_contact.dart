import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_contacts_with_bloc/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:user_contacts_with_bloc/cubit/get_contacts/get_contacts_cubit.dart';
import 'package:user_contacts_with_bloc/data/models/contact_model.dart';

class UpdateContactPage extends StatelessWidget {
  const UpdateContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsBloc, ContactsState>(
      builder: (context, state) {
        List<ContactModel> contacts = state.contacts;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Contact Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                TextFormField(
                  // controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                TextField(
                  // controller: numberController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ContactsBloc>(context).add(
                        UpdateContact(contact: ContactModel(
                          name: '',
                          number: '',
                          createdAt: '',

                        ))
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
