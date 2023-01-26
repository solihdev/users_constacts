import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_contacts_with_bloc/cubit/get_contacts/get_contacts_state.dart';
import 'package:user_contacts_with_bloc/data/models/contact_model.dart';
import 'package:user_contacts_with_bloc/data/repositories/contacts_repo.dart';

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

  deleteContact(int id) async {
    await contactsRepo.deleteContact(id);
    var result = await contactsRepo.getContact();
    emit(GetContactsSuccess(contactModel: result.map((e) => ContactModel.fromJson(e)).toList(),));
  }
}
