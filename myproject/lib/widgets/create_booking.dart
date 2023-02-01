import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});

  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final locateController = TextEditingController();

  addBooking(String fullname, String location, String address) async {
    String productId = Uuid().v1();
    await FirebaseFirestore.instance
        .collection('bookings')
        .doc(productId)
        .set({
          'full_name': fullname,
          'address': address,
          'location': location,
          'product id': productId
        })
        .then((value) => print("User Added"))
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Booking page'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            validator: (val) {
              if (val!.isEmpty) {
                return 'please enter your name';
              }
              return null;
            },
            decoration: InputDecoration(hintText: 'name'),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return 'please provide address';
              }
              return null;
            },
            controller: addressController,
            decoration: InputDecoration(hintText: 'address'),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return 'please add location';
              }
              return null;
            },
            controller: locateController,
            decoration: InputDecoration(hintText: 'location'),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                addBooking(
                  nameController.text.trim(),
                  locateController.text.trim(),
                  addressController.text.trim(),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: Text(
                'Book now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
