import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_happ_sales/data/repository/contact_repository.dart';

import '../../domain/contact.dart';

final contactControllerProvider =
    StateNotifierProvider<ContactController, AsyncValue<List<Contact>>>((ref) {
  final contactRepository = ref.watch(contactRepositoryProvider);
  return ContactController(contactRepository);
});

class ContactController extends StateNotifier<AsyncValue<List<Contact>>> {
  ContactController(this._contactRepository, [AsyncValue<List<Contact>>? state])
      : super(state ?? const AsyncValue.data([]));

  final ContactRepository _contactRepository;

  Future<Either<List<Contact>, Failure>> postContact() async {
    state = const AsyncValue.loading();

    final result = await _contactRepository.postContact();

    result.fold(
        (success) => state = AsyncValue.data(success),
        (failure) =>
            state = AsyncValue.error(failure.message, StackTrace.current));

    return result;
  }
}
