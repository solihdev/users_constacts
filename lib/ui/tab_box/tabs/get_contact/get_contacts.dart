import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_contacts_with_bloc/cubit/get_contacts/get_contacts_cubit.dart';
import 'package:user_contacts_with_bloc/cubit/get_contacts/get_contacts_state.dart';
import 'package:user_contacts_with_bloc/ui/tab_box/tabs/widgets/update_widget.dart';

class GetContactsScreen extends StatelessWidget {
  const GetContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Contacts"),
      ),
      body: BlocBuilder<GetContactCubit, GetContactsState>(
        builder: (context, state) {
          if (state is GetContactsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetContactsSuccess) {
            return ListView(
              children: List.generate(state.contactModel.length, (index) {
                var item = state.contactModel[index];
                return ListTile(
                  onLongPress: () {
                    launchUrl(
                      Uri.parse("tel://${item.number}"),
                    );
                  },
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) =>
                          UpdateContactDialog(contactModel: item),
                    );
                  },
                  title: Text(item.name),
                  subtitle: Text(item.number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<GetContactCubit>().deleteContact(item.id!);
                    },
                  ),
                );
              }),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
