
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contact/crud/edit_bloc/edit_bloc.dart';
import 'package:my_contact/home/_bloc/home_bloc.dart';
import 'package:my_contact/my_contact.dart';

import 'ContactData/contact_data.dart';
import 'crud/edit.dart';
import 'domin/repository.dart';
import 'domin/repository_2.dart';

Widget itemContact(
    BuildContext context,
    String image,
    MyContact data,
    int index,
    List<MyContact> contacts,
    ) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        children: [
          ClipOval(
            child: Image.asset(
              image,
              width: 42,
              height: 42,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  data.phone,
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                )
              ],
            ),
          ),
          const Spacer(),
          PopupMenuButton(
              color: Colors.white,
              icon: Image.asset(
                'assets/images/three.png',
                width: 22,
                height: 22,
              ),
              onSelected: (value) {
                if (value == 'Edit') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => EditBloc(),
                        child: EditScreen(contactData:data, index: index),
                      ),
                    ),
                  );
                } else if (value == 'Delete') {
                  Repository2 rb2=Repository2();
                  rb2.delete(data.key);

                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'Edit',
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const PopupMenuItem(
                  value: 'Delete',
                  child: Text(
                    'Delete',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ]),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Container(height: 1, width: double.infinity, color: Colors.grey),
    ],
  );
}

 _showDialog(BuildContext context, ContactData data, int index)  {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocConsumer<HomeBloc, HomeStateScreen>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/delete.png',
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Delete Contact',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFEA5757)),
                  child: IconButton(
                    // Clear icon button
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () => context,
                  ),
                )
              ],
            ),
            content: Text(
              'Do you want to delete  ${data.name}?',
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  context.read<HomeBloc>().add(Delete(id: data.id ?? 0));
                }, // Delete
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFEA5757)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 24, right: 24.0),
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )),
              ),
            ],
          );
        },
      );
    },
  );
}
