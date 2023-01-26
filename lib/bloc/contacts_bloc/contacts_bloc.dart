import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_contacts_with_bloc/data/models/contact_model.dart';
import 'package:user_contacts_with_bloc/data/repositories/contacts_repo.dart';
part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc({required this.contactsRepo})
      : super(const ContactsState(
          contacts: [],
          statusText: "",
          status: ContactStatus.pure,
        )) {
    on<AddContact>(_addContact);
    on<UpdateContact>(_updateContact);
    on<DeleteContact>(_deleteContact);
  }

  final ContactsRepo contactsRepo;

  _addContact(AddContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactStatus.loading));
    var newContact = await contactsRepo.addContact(event.contact);

    if (newContact.id != null) {
      emit(state.copyWith(status: ContactStatus.contactAdded));
    }
  }

  _updateContact(UpdateContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactStatus.loading));
    await contactsRepo.updateContact(event.contact);
    emit(state.copyWith(status: ContactStatus.contactUpdated));
  }

  _deleteContact(DeleteContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactStatus.loading));
    var deleteId = await contactsRepo.deleteContact(event.contactId);
    if (deleteId != -1) {
      emit(state.copyWith(status: ContactStatus.contactDeleted));
    }
  }
}
