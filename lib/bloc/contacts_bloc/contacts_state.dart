part of 'contacts_bloc.dart';

class ContactsState extends Equatable {
  final ContactStatus status;
  final String statusText;
  final List<ContactModel> contacts;

  const ContactsState({
    required this.status,
    required this.statusText,
    required this.contacts,
  });

  ContactsState copyWith({
    ContactStatus? status,
    String? statusText,
    List<ContactModel>? contacts,
  }) =>
      ContactsState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        contacts: contacts ?? this.contacts,
      );

  @override
  List<Object?> get props => [status, statusText, contacts];
}

enum ContactStatus {
  loading,
  pure,
  contactAdded,
  contactUpdated,
  contactDeleted,
}
