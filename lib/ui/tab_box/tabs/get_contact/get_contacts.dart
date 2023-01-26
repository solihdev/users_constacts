import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/bloc/get_contacts/get_contacts_cubit.dart';
import 'package:users_contacts/bloc/get_contacts/get_contacts_state.dart';

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
          if(state is GetContactsLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is GetContactsSuccess){
            return ListView(
              children: List.generate(state.contactModel.length, (index) {
                var item= state.contactModel[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.number),
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
