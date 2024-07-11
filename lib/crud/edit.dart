import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contact/home/_bloc/home_bloc.dart';
import 'package:my_contact/my_contact.dart';

import '../ContactData/contact_data.dart';
import '../home/home.dart';
import 'edit_bloc/edit_bloc.dart';

class EditScreen extends StatefulWidget {
  final MyContact contactData;
  final int index;

  EditScreen({required this.contactData, required this.index});

  @override
  State<EditScreen> createState() => _EditState();
}

class _EditState extends State<EditScreen> {
  late TextEditingController nameController;
  late TextEditingController numberController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.contactData.name);
    numberController = TextEditingController(text: widget.contactData.phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditBloc, EditState>(
      listener: (context, state) {
        print('bloc consumer was invoked -> $state');
       if(state is EditState){
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
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Positioned(
                    top: 50,
                    child: Image.asset(
                      'assets/images/editing.png',
                      width: 150,
                      height: 200,
                    )),
                const SizedBox(height: 100),
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
                                  hintText: 'Username',
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                  hintText: 'Password',
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

                        const SizedBox(height: 24,),

                        GestureDetector(
                          onTap: () {
                            MyContact contactData=
                            MyContact( nameController.text,
                                 numberController.text);
                            context
                                .read<EditBloc>()
                                .add(EditEvent(data: contactData,index: widget.index));
                            //contactData.save();
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: const Color(0xFFEA5757)),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: Center(
                                  child: Text(
                                'Update',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )),
                            ),
                          ),
                        ),

                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
