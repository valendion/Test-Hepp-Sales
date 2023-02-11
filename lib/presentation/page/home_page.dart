import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/contact_controller.dart';
import 'contact_page.dart';

class HomePage extends StatefulHookConsumerWidget {
  static String routeName = '/';
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var contactController = ref.watch(contactControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 4,
        shadowColor: Theme.of(context).shadowColor,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  var result = await ref
                      .read(contactControllerProvider.notifier)
                      .postContact();
                  if (result.isLeft()) {
                    if (!mounted) return;
                    Navigator.pushNamed(context, ContactPage.routeName);
                  } else {
                    debugPrint(
                        'Failed ${contactController.asError?.error.toString()}');
                  }
                },
                child: const Text('Navigate to Contact')),
          )
        ],
      )),
    );
  }
}
