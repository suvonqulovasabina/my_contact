import 'package:my_contact/ContactData/contact_data.dart';
import 'package:my_contact/domin/my_database.dart';

class Repository {
  MyDatabase db = MyDatabase();

  void addContact(ContactData data) {

    db.addContact(data);
  }

  void uppDate(ContactData data) {
    db.updateContact(data);

  }

  void delete(int id) {
    db.delete(id);
  }

  Future<List<ContactData>> getAllContact() {
    return db.getAllContact();
  }
}
