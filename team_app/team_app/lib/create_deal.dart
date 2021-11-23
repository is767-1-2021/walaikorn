import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/model/deal_model.dart';
import 'package:team_app/model/user_model2.dart';
import 'package:team_app/services/deal_services.dart';

import 'deal_page.dart';
import 'model/deal_model2.dart';
import 'model/user_model.dart';

class CreateDeal extends StatelessWidget {
  // final DocumentSnapshot? dealData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Deal'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          child: NewDeal()),
    );
  }
}

class NewDeal extends StatefulWidget {
  @override
  _NewDealState createState() => _NewDealState();
}

class _NewDealState extends State<NewDeal> {
  final _dealdetail = GlobalKey<FormState>();
  String? _title;
  String? _caption;
  String? _place;
  int? _member;
  String? _category;
  DateTime? _createdDateTime = DateTime.now(); /*stamp เวลา ณ ตอนนี้*/
  String? _uid;
  String? _createdUser;
  bool? isClosed;
  bool? isFav;

  final items = [
    'Food & Beverage',
    'Entertainment',
    'Travel',
    'Groceries',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _dealdetail,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Deal Title',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'type your deal'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type Deal Title.';
              }

              return null;
            },
            onSaved: (value) {
              _title = value;
            },
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Deal Description',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'type something',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type Deal Description.';
              }

              return null;
            },
            onSaved: (value) {
              _caption = value;
            },
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Deal location',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Deal at ...',
                prefixIcon: Icon(Icons.location_on)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter location.';
              }

              return null;
            },
            onSaved: (value) {
              _place = value;
            },
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Number of people',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'How many people you are looking for...'
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter number of people.';
              }

              if (int.parse(value) < 0) {
                return 'Number not valid';
              }
            },
            onSaved: (value) {
              _member = int.parse(value!);
            },
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
              value: _category,
              isExpanded: true,
              items: items
                .map((label) => DropdownMenuItem(
                  child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  ),
                  value: label,
                )
              )
              .toList(),
              hint: Text('Choose category'),
              onChanged: (value) {
                setState(() {
                  _category = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please choose deal catergory.';
                }

                return null;
              },
              onSaved: (value) {
                _category = value;
              },
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 55,
            width: 300,
            child: ElevatedButton(
              onPressed: () async {
                var services = FirebaseServices();
                var controller = DealController(services);

                User? user = FirebaseAuth.instance.currentUser;

                if (_dealdetail.currentState!.validate()) {
                  _dealdetail.currentState!.save();

                  await FirebaseFirestore.instance
                    .collection('group_deals')
                    .add({
                      'createdUser': user!.email,
                      'createdDateTime': _createdDateTime,
                      'title': _title,
                      'category': _category,
                      'caption': _caption,
                      'place': _place,
                      'member': _member,
                      'uid': user.uid,
                      'isClosed': false,
                      'isFav': false,
                    });
                  /*ใส่ function addDeal*/
                  /*ใส่ snackbar โชว์ว่าอัพเดทไปแล้ว*/
                  // ScaffoldMessenger.of(context).showSnackBar(context: )
                  /*pushReplacement ให้ใส่หน้าใหม่เข้ามาแทน+รีเฟรชด้วย แทนหน้าเดิม*/
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DealPage(
                        controller: controller,
                      )
                    )
                  );
                }
              },
              child: Text(
                'Create',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
