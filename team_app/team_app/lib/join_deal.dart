import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/deal_page.dart';
import 'package:team_app/firstpage.dart';
import 'package:team_app/model/deal_model2.dart';
import 'package:team_app/model/user_model2.dart';
import 'package:team_app/services/deal_services.dart';
import 'model/deal_model.dart';

class JoinDeal extends StatefulWidget {
  final DealDB? deal;
  /*สร้าง key ให้กับ ๋deal ของ Joindeal*/
  const JoinDeal({Key? key, this.deal}) : super(key: key);

  @override
  _JoinDealState createState() => _JoinDealState();
}

class _JoinDealState extends State<JoinDeal> {
  bool? _isDisabled;

  void initsate() {
    var ds = FirebaseServices();
    var jointlist = ds.getJointlistFromFirebase (
      context.read<DealModel>().uid, widget.deal!.dealID);
    jointlist.then((value) {
      context.read<DealModel>().jointList = value;
    });
    _isDisabled = false;

    super.initState();
  }
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      /*กดได้ครั้งเดียว*/
      if (_counter < widget.deal!.member!) {
        _counter += 1;
      } else {
        _counter += 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Deal'),
      ),
      body: Center(
        child: Column(
          children: [
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Host',
                        style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Deal',
                        style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('image/profile.png', width: 100),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.deal!.title!,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.deal!.createdUser!,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Deal Detail',
                  style:TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.deal!.caption!,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.deal!.place!,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Joiner',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child:
                          Text('$_counter /', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(widget.deal!.member.toString(),
                        style: TextStyle(fontSize: 20)
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Table(
            //   children: [
            //     TableRow(
            //       children: <Widget>[
            //         Container(
            //           padding: EdgeInsets.all(20),
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             'Category',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(20),
            //           alignment: Alignment.centerLeft,
            //           child: Consumer<CreatedDealModel>(
            //             builder: (context, value, child) {
            //               return Text(
            //                 '${value.category}',
            //                 style: TextStyle(fontSize: 20),
            //               );
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        onPressed: () async {
          QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('group_deal')
            .doc(widget.deal!.dealID!)
            .collection("joint_members")
            .where('join_uid', isEqualTo: context.read<UserModel>().uid)
            .get();

          List<JointDB> copyJointList;
          copyJointList = snapshot.docs.map((element) {
            return JointDB(
              jointID: element.id,
              jointUID: element['joint_uid'],
              jointName: element['joint_fullname'],
              jointPhone: element['joint_phoneNo'],
              jointEmail: element['joint_email'],
              jointImage: element['joint_image'],
            );
          }).toList();
          
          _showDialog();
        },

        child: Text('Join'),
       
      ),
     
    );
  }
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Join Deal'),
          content: new Text('Join deal success'),
          actions: <Widget>[
            new ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              child: new Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}