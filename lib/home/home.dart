import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contact/ContactData/contact_data.dart';
import 'package:my_contact/crud/add_bloc/add_bloc.dart';
import 'package:my_contact/home/_bloc/home_bloc.dart';
import 'package:my_contact/my_contact.dart';

import '../crud/add.dart';
import '../item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  var contactStet = 0;

  Stream<List<ContactData>> contactStream() => FirebaseFirestore.instance
      .collection('contacts')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((e) => ContactData.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(AddContact());
        },
        child: Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFEA5757)),
          child: Image.asset(
            'assets/images/plus.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              const Text(
                'My Contacts',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/logout.png',
                width: 32,
                height: 32,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: BlocConsumer<HomeBloc, HomeStateScreen>(
          listener: (context, state) {
            if (state.add == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => AddBloc(),
                            child: Add(index: contactStet + 1),
                          )));
            }
          },
          builder: (context, state) {
            if (state.data != null) {
              contactStet = state.data!.length;
            }
            List<MyContact> n = state.data ?? [];
            return ListView.separated(
              itemCount: contactStet,
              itemBuilder: (context, index) {
                MyContact contact = n[index];
                return InkWell(
                  onTap: () {},
                  child: itemContact(context, 'assets/images/register.png',
                      contact, index + 1, n),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
