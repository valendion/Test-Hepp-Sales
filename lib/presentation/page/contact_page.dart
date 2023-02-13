import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_happ_sales/presentation/controller/contact_controller.dart';

import '../../data/repository/contact_db.dart';

class ContactPage extends ConsumerWidget {
  static String routeName = '/contactPage';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contactDb = ref.read(contactDbProvider);
    var getAll = ref.watch(getAllContactProvider);
    contactDb.open;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: getAll.when(
                    data: (data) {
                      contactDb.close();

                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: ((context, index) {
                            var contact = data[index];
                            return Card(
                              child: ListTile(
                                leading: Text(contact.contactName[0]),
                                title: Text(contact.contactName),
                                subtitle: Text(contact.accountName),
                              ),
                            );
                          }));
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
