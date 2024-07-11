// class ContactData {
//   final String docId;
//   final String name;
//   final String number;
//
//   ContactData({required this.docId, required this.name, required this.number});
//
// // firebasedan json formatda kelayotkan streamni bizning data classimiz fieldlariga convert qilinyapti
//   factory ContactData.fromJson(Map<String, dynamic> json, String docId) {
//    return ContactData( docId: docId,name: json['name']??'Unknown', number: json['phone']??'Unknown');
//   }
//       // bu yerda huddiki extensionga o'xshab ketyapti, oz ichiga string dynamic olib userdaa qaytaryapti
//       // bu yerda shu onvert bolishi korsatilgan  : hullas yangi Contact data tipida onbject yaratiladi, uni maydonlariga
//   //firebasedan kegan jsonni biriktirib beradi
//
//   Map<String, dynamic> toJson() {
//     return {'name': name, 'number': number};
//   }

// This method converts a ContactData object back into a JSON map.
// It creates a new map and adds key-value pairs for name and number,
// using their respective values from the ContactData object.


//}
