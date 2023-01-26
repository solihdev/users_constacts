import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/bloc/get_contacts/get_contacts_state.dart';
import 'package:users_contacts/data/models/contact_model.dart';
import 'package:users_contacts/data/repositories/contacts_repo.dart';

class GetContactCubit extends Cubit<GetContactsState> {
  final ContactsRepo contactsRepo;

  GetContactCubit({required this.contactsRepo}) : super(GetContactsInitial());

  fetchContacts() async {
    emit(GetContactsLoading());
    var cachedUserContact = await contactsRepo.getContact();
    emit(
      GetContactsSuccess(
        contactModel:
            cachedUserContact.map((e) => ContactModel.fromJson(e)).toList(),
      ),
    );
  }
}
