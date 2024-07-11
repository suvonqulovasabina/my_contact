import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_contact/home/_bloc/home_bloc.dart';
import 'package:my_contact/my_contact.dart';

import '../ContactData/contact_data.dart';
import '../home/home.dart';
import 'add_bloc/add_bloc.dart';

class Add extends StatefulWidget {
  final int index;
  const Add({super.key, required this.index});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    show();
  }

  void show() async {
    await FirebaseFirestore.instance.collection('contacts').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: BlocConsumer<AddBloc, AddState>(
        listener: (context, state) {
          if (state.openHome) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => HomeBloc()..add(EventLoadGetAllContact()),
                          child: const Home(),
                        )));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Positioned(
                    top: 50,
                    child: Image.asset(
                      'assets/images/adding.png',
                      width: 150,
                      height: 200,
                    )),
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.grey, width: 1.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextField(
                              style:
                                  const TextStyle(fontSize: 20, color: Colors.grey),
                              decoration: InputDecoration(
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                  hintText: 'Name',
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.clear,
                                          size: 12,
                                          color: Colors.white,
                                        )),
                                  )),
                              controller: nameController,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.grey, width: 1.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.grey),
                              decoration: InputDecoration(
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                  hintText: 'Phone',
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.clear,
                                          size: 12,
                                          color: Colors.white,
                                        )),
                                  )),
                              controller: numberController,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 48.0,
                        ),
                        GestureDetector(
                          onTap: () async {
                            //ContactData newContact = ContactData( nameController.text, number: numberController.text);
                            MyContact myData = MyContact(
                                nameController.text,
                               numberController.text);
                            print(myData.phone);

                            try {
                              context
                                  .read<AddBloc>()
                                  .add(AddEvent(data: myData,index: widget.index));
                              Fluttertoast.showToast(
                                msg: "Contact added successfully!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              // Optionally navigate back to the Home screen

/*
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>


                                          BlocProvider(create: (context)=>HomeBloc(),
                                      child: Home())))*/

                              Navigator.pop(context);
                              // Assuming you want to go back after adding
                            } catch (error) {
                              Fluttertoast.showToast(
                                msg: "Failed to add contact: $error",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              print(error); // Log the error for debugging
                            }
                            nameController.clear();
                            numberController.clear();
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xFFEA5757)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: Center(
                                  child: Text(
                                'Add',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                      ],
                    )),

                // Expanded(
                //     flex: 1,
                //     child: Container(
                //     ))
              ],
            ),
          );
        },
      ),
    );
  }
}

// Future<void> addContact(ContactData contact)async{
//   await FirebaseFirestore.instance.collection('contacts').doc().set({'name': contact.name, 'phone': contact.number} as Map<String, dynamic>);
//
