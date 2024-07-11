class ContactData{

  final  int? id;
  final String name;
  final String phone;

  ContactData({this.id,required this.name,required this.phone});

  factory ContactData.fromJson(Map<String, dynamic> json) {
    return ContactData(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }


  Map<String,dynamic> toJson()=> {
        'id':id,
        'name':name,
        'phone':phone
      };

}