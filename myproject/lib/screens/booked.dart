import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myproject/screens/home_screen.dart';
import 'package:uuid/uuid.dart';

class Booked extends StatelessWidget {
  const Booked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bookings').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return BookedUi(
                    snap: snapshot.data!.docs[index].data(),
                  );
                },
              );
          }
        },
      ),
    );
  }
}

class BookedUi extends StatefulWidget {
  final snap;
  const BookedUi({super.key, required this.snap});

  @override
  State<BookedUi> createState() => _BookedUiState();
}

class _BookedUiState extends State<BookedUi> {
  CollectionReference bookDb =
      FirebaseFirestore.instance.collection('bookings');
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController location = TextEditingController();
    TextEditingController address = TextEditingController();

    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Name: "),
                        Text(widget.snap['full_name']),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("Address: "),
                        Text(widget.snap['address']),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Delete "),
                                content:
                                    Text("Are you sure you want to delete? "),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Successfully deleted")));
                                        await FirebaseFirestore.instance
                                            .collection('bookings')
                                            .doc(widget.snap['product id'])
                                            .delete();
                                      },
                                      child: Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("No"))
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete)),
                    TextButton(
                        onPressed: () {
                          // _name = widget.snap['full_name'];
                          // location = widget.snap['location'];
                          // address = widget.snap['address'];

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Update details"),
                                actions: [
                                  TextField(
                                    controller: _name
                                      ..text = widget.snap['full_name'],
                                    decoration:
                                        InputDecoration(hintText: "Name: "),
                                  ),
                                  TextField(
                                    controller: address
                                      ..text = widget.snap['address'],
                                    decoration:
                                        InputDecoration(hintText: "Address: "),
                                  ),
                                  TextField(
                                    controller: location
                                      ..text = widget.snap['location'],
                                    decoration:
                                        InputDecoration(hintText: "Location: "),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        String productId = Uuid().v1();
                                        FirebaseFirestore.instance
                                            .collection('bookings')
                                            .doc(productId)
                                            .set({
                                              'full_name': _name,
                                              'address': address,
                                              'location': location,
                                              'product id': productId
                                            })
                                            .then(
                                                (value) => print("User Added"))
                                            .catchError(
                                              (error) => print(
                                                  "Failed to add user: $error"),
                                            );
                                      },
                                      child: Text("Done")),
                                  TextButton(
                                      onPressed: () async {
                                        await bookDb
                                            .doc(widget.snap['product id'])
                                            .update({
                                          'full_name': _name.text,
                                          'address': address.text,
                                          'location': location.text,
                                        });
                                      },
                                      child: Text("Update"))
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Update")),
                  ],
                )
              ],
            )));
  }
}
