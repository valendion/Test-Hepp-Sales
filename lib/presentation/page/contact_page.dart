import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_happ_sales/presentation/controller/contact_controller.dart';

class ContactPage extends ConsumerWidget {
  static String routeName = '/contactPage';
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contactController = ref.watch(contactControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: contactController.when(
                    data: (data) {
                      List<Widget> texts = data
                          .map((e) => Text(e.contactName.toString()))
                          .toList();
                      return Column(
                        children: texts,
                      );
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
