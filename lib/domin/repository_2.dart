import 'package:hive/hive.dart';
import 'package:my_contact/my_contact.dart';

import 'package:path_provider/path_provider.dart';

class Repository2 {
  final box = Hive.box('contact');

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(MyContactAdapter());
    await Hive.openBox('contact');
  }

  static void addElement(MyContact element, int key) {
    final box = Hive.box('contact');
    box.put(key, element);
  }

  static void clearBox() {
    final box = Hive.box('contact');
    box.clear();
  }

  static dynamic getElement(dynamic key) {
    final box = Hive.box('contact');
    return box.get(key, defaultValue: "NULL");
  }

  void updateElement(int key, MyContact element) {
    
    final box = Hive.box('contact');
    box.put(key, element);
  }

  static void addElement1(dynamic element) {
    final box = Hive.box('contact');
    box.add(element);
  }

  static void update(MyContact element) {
    final box = Hive.box('contact');
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i) == element) {
        box.putAt(i, element);
      }
    }
  }

  List<MyContact> getAllValues() {
    return box.values.cast<MyContact>().toList();
  }

  void delete(int key) {
    final box = Hive.box('contact');
    box.delete(key);
  }

   updet(MyContact myContact) {
    myContact.save();
  }

  void addStudent(MyContact myContact) {
    box.add(myContact);
  }

  static void updateStudent(MyContact myContact) {
    myContact.save();
  }
}
