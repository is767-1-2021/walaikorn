// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:team_app/deal_page.dart';
// import 'package:team_app/firstpage.dart';
// import 'package:team_app/model/deal_model2.dart';
// import 'package:team_app/model/user_model2.dart';
// import 'package:team_app/services/deal_services.dart';
// import 'model/deal_model.dart';
// import 'dart:js';

// class JoinDeal extends StatefulWidget {
//   final Deal deal;
//   final DealDB dealDB;
//   /*สร้าง key ให้กับ ๋deal ของ Joindeal*/
//   const JoinDeal({Key? key, required this.deal, required this.dealDB}) : super(key: key);

//   @override
//   _JoinDealState createState() => _JoinDealState();
// }

// class _JoinDealState extends State<JoinDeal> {

//   @override
//   void initState() {
//     var ds = FirebaseServices();
//     var jList = ds.getJointListFromFirebase(
//       context.read<UserModel>().uid,context.read<DealModel>().dealID);
//     jList.then((value) {
//       context.read<DealModel>().jointList = value;
//     });

//     super.initState();
//   }
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       /*กดได้ครั้งเดียว*/
//       if (_counter < widget.deal.member) {
//         _counter += 1;
//       } else {
//         _counter += 0;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Join Deal'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Table(
//               children: [
//                 TableRow(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Host',
//                         style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Deal',
//                         style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 TableRow(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.center,
//                       child: Image.asset('image/profile.png', width: 100),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         widget.deal.title,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ],
//                 ),
//                 TableRow(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         widget.deal.createdUser,
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         '',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text('Deal Detail',
//                   style:TextStyle(
//                     fontSize: 18, 
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 widget.deal.caption,
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             Table(
//               children: [
//                 TableRow(
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.all(20),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Location',
//                         style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(20),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         widget.deal.place,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Table(
//               children: [
//                 TableRow(
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.all(20),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Joiner',
//                         style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(20),
//                       alignment: Alignment.centerLeft,
//                       child:
//                         Consumer<DealModel>(builder:
//                           (BuildContext context, value, Widget? child) {
//                         List<JointDB> jList = [];
//                         jList = value.joint! as List<JointDB>;
//                         int _allNoti = value.joint!.toList().length;

//                         return Text('$_allNoti', 
//                           style: TextStyle(fontSize: 20)
//                         );
//                       }),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(20),
//                       alignment: Alignment.centerLeft,
//                       child: Text(widget.deal.member.toString(),
//                         style: TextStyle(fontSize: 20)
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             // Table(
//             //   children: [
//             //     TableRow(
//             //       children: <Widget>[
//             //         Container(
//             //           padding: EdgeInsets.all(20),
//             //           alignment: Alignment.centerLeft,
//             //           child: Text(
//             //             'Category',
//             //             style: TextStyle(
//             //                 fontSize: 18, fontWeight: FontWeight.bold),
//             //           ),
//             //         ),
//             //         Container(
//             //           padding: EdgeInsets.all(20),
//             //           alignment: Alignment.centerLeft,
//             //           child: Consumer<CreatedDealModel>(
//             //             builder: (context, value, child) {
//             //               return Text(
//             //                 '${value.category}',
//             //                 style: TextStyle(fontSize: 20),
//             //               );
//             //             },
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.deepPurple,
//         onPressed: () async  {
//           // QuerySnapshot snapshot = await FirebaseFirestore.instance
//           //   .collection('group_deals')
//           //   .doc(context.read<DealModel>().dealID)
//           //   .collection("joint_members")
//           //   .where('joint_uid', isEqualTo: context.read<UserModel>().uid)
//           //   .get();

//           // List<JointDB> dupJointList;
//           // dupJointList = snapshot.docs.map((element) {
//           //   return JointDB(
//           //     jointID: element.id,
//           //     jointUID: element['joint_uid'],
//           //     jointName: element['joint_fullname'],
//           //     jointPhone: element['joint_phoneNo'],
//           //     jointEmail: element['joint_email'],
//           //     jointImage: element['joint_image'],
//           //   );
//           // }).toList();
//           // QuerySnapshot qs = await FirebaseFirestore.instance
//           //   .collection('group_deals')
//           //   .doc(widget.deal!.dealID)
//           //   .collection("joint_members")
//           //   .get();

//           // List<JointDB> joinerList;
//           // joinerList = qs.docs.map((element) {
//           //   return JointDB(
//           //     jointID: element.id,
//           //     jointUID: element['joint_uid'],
//           //     jointName: element['joint_fullname'],
//           //     jointPhone: element['joint_phoneNo'],
//           //     jointEmail: element['joint_email'],
//           //     jointImage: element['joint_image'],
//           //   );
//           // }).toList();

//           // var joint = JointDB(
//           //   jointUID: context.read<UserModel>().uid,
//           //   jointName: context.read<UserModel>().fullname,
//           //   jointEmail: context.read<UserModel>().email,
//           //   jointPhone: context.read<UserModel>().phoneNo,
//           //   jointImage: context.read<UserModel>().image,
//           // );
//           //  if (joinerList.length >= widget.deal!.member!) {
//           //   print(
//           //       'This Deal is closed!!! ${joinerList.length} in ${widget.deal!.member!}');
//           // } else if (context.read<UserModel>().uid == widget.deal!.uid) {
//           //   print('You are Host!!!');
//           // } else if (dupJointList.isNotEmpty) {
//           //   print('You have joint already!!! ${dupJointList.length}');
//           //   return;
//           // } else {
//           //   context.read<DealModel>().joinDeal(joint);

//           //   User? user = FirebaseAuth.instance.currentUser;

//           //   DocumentReference ref = await FirebaseFirestore.instance
//           //       .collection('group_deals')
//           //       .doc(widget.deal!.dealID)
//           //       .collection("joint_members")
//           //       .add({
//           //     'joint_uid': user!.uid,
//           //     'joint_image':
//           //         'https://firebasestorage.googleapis.com/v0/b/is-project01.appspot.com/o/user_image%2Fuser03.png?alt=media&token=9b32b994-d8f1-4982-8145-e8b890d3ccbc',
//           //     'joint_fullname': joint.jointName,
//           //     'joint_email': joint.jointEmail,
//           //     'joint_phoneNo': joint.jointPhone,
//           //   });

//           //   setState(() {
//           //     var ds = FirebaseServices();
//           //     var jList = ds.getJointListFromFirebase(
//           //         context.read<UserModel>().uid, widget.deal!.dealID);
//           //     jList.then((value) {
//           //       context.read<DealModel>().jointList = value;
//           //     });
//           //   });
//           //   print(ref.id);
//           //   print(context.read<UserModel>().uid);
//         //  }
//         //  _showDialog();
//         },

//        child: Text('Join'),
       
//       ),
     
//     );
//   }
//   // void _showDialog() {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: new Text('Join Deal'),
//   //         content: new Text('Join deal success'),
//   //         actions: <Widget>[
//   //           new ElevatedButton(
//   //             style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
//   //             child: new Text("OK"),
//   //             onPressed: () {
//   //               Navigator.pop(context);
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
// }