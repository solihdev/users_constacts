part of'contacts_bloc.dart';

// @immutable

abstract class ContactsEvent{}

class UpdateContact extends ContactsEvent{
  final ContactModel contact;
  UpdateContact({required this.contact});
}

class AddContact extends ContactsEvent{
  final ContactModel contact;
  AddContact({required this.contact});
}

class DeleteContact extends ContactsEvent{
  final int contactId;
  DeleteContact({required this.contactId});
}