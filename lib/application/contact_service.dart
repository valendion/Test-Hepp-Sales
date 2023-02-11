import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repository/contact_repository.dart';
import '../domain/contact.dart';

class ContactService {
  ContactService(this.ref);
  final Ref ref;

  Future<Either<List<Contact>, Failure>> postUser() {
    return ref.watch(contactRepositoryProvider).postContact();
  }
}

final contactServiceProvider = Provider<ContactService>((ref) {
  return ContactService(ref);
});
