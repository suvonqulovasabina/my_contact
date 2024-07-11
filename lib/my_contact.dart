import 'package:hive/hive.dart';
part 'my_contact.g.dart';

@HiveType(typeId: 0)
class MyContact extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  MyContact(this.name, this.phone);
}
