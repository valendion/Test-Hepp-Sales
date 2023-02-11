import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_happ_sales/application/contact_service.dart';
import 'package:test_happ_sales/data/repository/contact_repository.dart';

import '../../domain/contact.dart';

final contactControllerProvider =
    StateNotifierProvider<ContactController, AsyncValue<List<Contact>>>((ref) {
  final contactService = ref.watch(contactServiceProvider);
  return ContactController(contactService);
});

class ContactController extends StateNotifier<AsyncValue<List<Contact>>> {
  ContactController(this._contactService, [AsyncValue<List<Contact>>? state])
      : super(state ?? const AsyncValue.data([]));

  final ContactService _contactService;

  Future<Either<List<Contact>, Failure>> postContact() async {
    state = const AsyncValue.loading();

    final result = await _contactService.postUser();

    result.fold(
        (success) => state = AsyncValue.data(success),
        (failure) =>
            state = AsyncValue.error(failure.message, StackTrace.current));

    return result;
  }
}
