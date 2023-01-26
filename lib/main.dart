import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_contacts_with_bloc/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:user_contacts_with_bloc/bloc/get_contacts/get_contacts_cubit.dart';
import 'package:user_contacts_with_bloc/data/repositories/contacts_repo.dart';
import 'ui/tab_box/tab_box.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ContactsBloc(
        contactsRepo: ContactsRepo(),
      ),
    ),
    BlocProvider(
      create: (context) => GetContactCubit(
        contactsRepo: ContactsRepo(),
      )..fetchContacts(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabScreen(),
    );
  }
}
