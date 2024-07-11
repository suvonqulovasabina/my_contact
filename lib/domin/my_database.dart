import 'package:my_contact/ContactData/contact_data.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class MyDatabase {
  static int version = 1;
  static String dbName = 'MyContact';

  Future<Database> _getDb() async {
    return await openDatabase(join(await getDatabasesPath(), dbName),
        version: version,
        singleInstance: true,
        onCreate: (db, version) async => db.execute(
            'CREATE TABLE Contacts (id INTEGER NOT NULL, name TEXT NOT NULL, phone TEXT NOT NULL, PRIMARY KEY(id AUTOINCREMENT))'));
  }

  Future<void> addContact(ContactData data) async {
    final db = await _getDb();
    db.insert('Contacts', data.toJson());
  }

  Future<void> updateContact(ContactData data) async {
    final db = await _getDb();
    await db.update(
      'Contacts',
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  void delete(int id) async {
    final db = await _getDb();
    db.delete('Contacts', where: 'id =?', whereArgs: [id]);
  }

  Future<List<ContactData>> getAllContact() async {
    final db = await _getDb();
    final map = await db.query('Contacts');
    return List.generate(
        map.length, (index) => ContactData.fromJson(map[index]));
  }
}
