import 'package:users_contacts/data/models/contact_model.dart';

abstract class GetContactsState {}

class GetContactsInitial extends GetContactsState {}

class GetContactsLoading extends GetContactsState {}

class GetContactsSuccess extends GetContactsState {
  List<ContactModel> contactModel;

  GetContactsSuccess({
    required this.contactModel,
  });
}
