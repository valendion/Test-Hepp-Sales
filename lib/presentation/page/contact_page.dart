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
                      List<Widget> texts = data
                          .map((e) => Text(e.accountName.toString()))
                          .toList();

                      return Column(
                        children: texts,
                      );
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
