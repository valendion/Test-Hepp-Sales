import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_happ_sales/domain/contact.dart';

class ContactDb {
  final String databaseContact = 'Contact.db';
  final String tableContact = 'Contact';
  final String columnContactID = 'ContactID';
  final String columnContactName = 'ContactName';
  final String columnAccountName = 'AccountName';
  Database? db;

  Future open() async {
    Directory documentoryDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentoryDirectory.path, databaseContact);

    db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
CREATE TABLE $tableContact(
  $columnContactID INTEGER PRIMARY KEY AUTOINCREMENT,
  $columnContactName TEXT NOT NULL,
  $columnAccountName TEXT NOT NULL
)
''');
    });
  }

  Future close() async {
    if (db!.isOpen) {
      db!.close();
    }
  }

  Future<int> insert(Contact contact) async {
    var query = await db!.insert(tableContact, contact.toMap());
    return query;
  }

  Future<List<Contact>> getAll() async {
    var contacts = await db!.rawQuery('SELECT * FROM $tableContact');
    return contacts.map((e) => Contact.fromMap(e)).toList();
  }
}

final contactDbProvider = Provider<ContactDb>((ref) {
  return ContactDb();
});

final getAllContactProvider = FutureProvider<List<Contact>>((ref) async {
  var contactDb = ref.read(contactDbProvider);
  return await contactDb.getAll();
});
