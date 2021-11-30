
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/services/deal_services.dart';
import 'controllers/deal_controller.dart';
import 'model/deal_model.dart';

class DealDetail2 extends StatefulWidget {
  final Deal ds;
  final DealController controller;

  const DealDetail2({Key? key, required this.ds, required this.controller})
      : super(key: key);


  @override
  _DealDetail2State createState() => _DealDetail2State();
}

class _DealDetail2State extends State<DealDetail2> {
  List<Joiner> joiners = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    _getJoiners();
    // var ds = DealService();
    // var jList = ds.getJointListFromFirebase(
    //     context.read<UserModel>().uid, widget.deal!.dealID);
    // jList.then((value) {
    //   context.read<DealModel>().jointList = value;
    // });

    super.initState();
    // widget.controller.onSync.listen((bool syncState) => setState(() {
    //       isLoading = syncState;
    //     }));
  }

  void _getJoiners() async {
    User? user = FirebaseAuth.instance.currentUser;
    Services fs = FirebaseServices();

    var newJoiners = await fs.getJoiners(user!.uid);
    setState(() {
      joiners = newJoiners;
    });
  }
  void _updateDeals(String uid, bool isClosed) async {
    await widget.controller.updateDeals(uid, isClosed);
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < widget.ds.member) {
        _counter += 1;
      } else {
        _counter += 0;
      }
    });
  }

  int joinerNo = 0;
  void  _joined() {
    setState(() {
      if (joinerNo < widget.ds.member) {
        joinerNo +=1;
      } else {
        joinerNo += 0;  
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deal Detail'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: widget.ds.isClosed == false
                        ? Colors.yellow[300]
                        : Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    widget.ds.isClosed == false
                        ? const Text(
                            'Deal Status :',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            'Deal Status :',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    const SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.ds.isClosed == false
                            ? const Icon(Icons.timelapse)
                            : const Icon(Icons.check_circle,
                                color: Colors.white),
                        const SizedBox(width: 10),
                        widget.ds.isClosed == false
                            ? const Text(
                                'Pending...',
                                style: TextStyle(fontSize: 18),
                              )
                            : const Text(
                                'Closed',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.circular(10)),
                child: Table(
                  //border: TableBorder.all(),
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(6)
                  },
                  children: [
                    TableRow(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Deal',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            widget.ds.title,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Detail',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            widget.ds.caption,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Location',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.location_pin),
                              Text(
                                widget.ds.place,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Joiner',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Text('$_counter',
                                  style: const TextStyle(fontSize: 16)),
                              Text(
                                ' / ${widget.ds.member.toString()}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Category',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                widget.ds.category == 'Food & Beverage'
                                    ? Icons.restaurant_rounded
                                    : widget.ds.category == 'Entertainment'
                                        ? Icons.music_note
                                        : widget.ds.category == 'Travel'
                                            ? Icons.travel_explore
                                            : widget.ds.category == 'Groceries'
                                                ? Icons.shopping_basket
                                                : widget.ds.category == 'Other'
                                                    ? Icons.ac_unit
                                                    : Icons.ac_unit,
                                //size: 35,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.ds.category,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('group_users')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('image/profile.png', width: 55),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.ds.createdUser,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(5)),
                                    width: 45,
                                    height: 20,
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Host',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.phone_iphone_rounded,
                                    size: 30,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.message,
                                    size: 30,
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
                  }),

              // StreamBuilder<QuerySnapshot>(
              //     stream: FirebaseFirestore.instance
              //         .collection('group_deals')
              //         .doc()
              //         .collection('joint_members')
              //         .snapshots(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.hasError) {
              //         return Text('Something went wrong');
              //       }
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Center(child: CircularProgressIndicator());
              //       }
              //       return SizedBox(
              //         height: MediaQuery.of(context).size.height * 0.45,
              //         child: ListView.builder(
              //             physics: const NeverScrollableScrollPhysics(),
              //             itemCount: joiners.isNotEmpty ? joiners.length : 0,
              //             itemBuilder: (context, index) {
              //               Joiner js = joiners[index];
              //               User? user = FirebaseAuth.instance.currentUser;

              //               if (joiners.isNotEmpty) {
              //                 print('Joiner: ${joiners.length}');
              //                 return Padding(
              //                   padding:
              //                       const EdgeInsets.only(top: 5, bottom: 10),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Row(
              //                         children: [
              //                           Image.asset('image/profile.png',
              //                               width: 55),
              //                           const SizedBox(
              //                             width: 15,
              //                           ),
              //                           Column(
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.start,
              //                             children: <Widget>[
              //                               Text(
              //                                 js.jointName,
              //                                 style: const TextStyle(
              //                                     fontSize: 16,
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                               const SizedBox(
              //                                 height: 5,
              //                               ),
              //                               Container(
              //                                 decoration: BoxDecoration(
              //                                     color: Colors.grey[300],
              //                                     borderRadius:
              //                                         BorderRadius.circular(5)),
              //                                 width: 45,
              //                                 height: 20,
              //                                 child: const Align(
              //                                   alignment: Alignment.center,
              //                                   child: Text(
              //                                     'Joiner',
              //                                     style: TextStyle(
              //                                         fontSize: 12,
              //                                         fontWeight:
              //                                             FontWeight.bold),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                       Row(
              //                         children: [
              //                           IconButton(
              //                               onPressed: () {},
              //                               icon: const Icon(
              //                                 Icons.phone_iphone_rounded,
              //                                 size: 30,
              //                               )),
              //                           IconButton(
              //                               onPressed: () {},
              //                               icon: const Icon(
              //                                 Icons.message,
              //                                 size: 30,
              //                               )),
              //                           js.jointUID == user!.uid
              //                               ? IconButton(
              //                                   onPressed: () {
              //                                     setState(() {
              //                                       //// DELETE FROM FIREBASE ////
              //                                       var ds = FirebaseServices();
              //                                       ds.deleteJoiner(
              //                                           widget.ds.uid,
              //                                           js.jointID);

              //                                       //// DELETE FROM MODEL ////
              //                                       joiners.removeAt(index);

              //                                       ScaffoldMessenger.of(
              //                                               context)
              //                                           .showSnackBar(
              //                                         const SnackBar(
              //                                           content: Text(
              //                                             '  Join is cancelled!',
              //                                             style: TextStyle(
              //                                                 fontSize: 15),
              //                                           ),
              //                                           duration: Duration(
              //                                               seconds: 5),
              //                                           behavior:
              //                                               SnackBarBehavior
              //                                                   .fixed,
              //                                         ),
              //                                       );
              //                                     });
              //                                   },
              //                                   icon: Icon(
              //                                     Icons.delete_forever,
              //                                     size: 30,
              //                                     color: Colors.red[700],
              //                                   ))
              //                               : const SizedBox(),
              //                         ],
              //                       )
              //                     ],
              //                   ),
              //                 );
              //               } else {
              //                 return const Padding(
              //                   padding: EdgeInsets.only(top: 50),
              //                   child: Text('No Joiner Now'),
              //                 );
              //               }
              //             }),
              //       );
              //     })

              // Consumer<DealModel>(
              //     builder: (BuildContext context, value, Widget? child) {
              //   List<JointDB> jList = [];
              //   jList = value.joint! as List<JointDB>;

              //   if (value.joint == null) {
              //     return Center(
              //       child: Column(
              //         children: const [
              //           CircularProgressIndicator(),
              //           Text('Loading . . .')
              //         ],
              //       ),
              //     );
              //   } else if (jList.isEmpty) {
              //     return const Padding(
              //       padding: EdgeInsets.only(top: 50),
              //       child: Text('No Joiner Now'),
              //     );
              //   } else {
              //     int _allNoti = value.joint!.toList().length;

              //     return SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.45,
              //       child: ListView.builder(
              //           physics: const NeverScrollableScrollPhysics(),
              //           itemCount: jList.length,
              //           itemBuilder: (context, index) {
              //             JointDB join = jList[index];
              //             User? user = FirebaseAuth.instance.currentUser;

              //             return Padding(
              //               padding: const EdgeInsets.only(top: 5, bottom: 10),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Row(
              //                     children: [
              //                       Image.asset('assets/profile.png',
              //                           width: 55),
              //                       const SizedBox(
              //                         width: 15,
              //                       ),
              //                       Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: <Widget>[
              //                           Text(
              //                             '${join.jointName}',
              //                             style: const TextStyle(
              //                                 fontSize: 16,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                           const SizedBox(
              //                             height: 5,
              //                           ),
              //                           Container(
              //                             decoration: BoxDecoration(
              //                                 color: Colors.grey[300],
              //                                 borderRadius:
              //                                     BorderRadius.circular(5)),
              //                             width: 45,
              //                             height: 20,
              //                             child: const Align(
              //                               alignment: Alignment.center,
              //                               child: Text(
              //                                 'Joiner',
              //                                 style: TextStyle(
              //                                     fontSize: 12,
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                   Row(
              //                     children: [
              //                       IconButton(
              //                           onPressed: () {},
              //                           icon: const Icon(
              //                             Icons.phone_iphone_rounded,
              //                             size: 30,
              //                           )),
              //                       IconButton(
              //                           onPressed: () {},
              //                           icon: const Icon(
              //                             Icons.message,
              //                             size: 30,
              //                           )),
              //                       join.jointUID == user!.uid
              //                           ? IconButton(
              //                               onPressed: () {
              //                                 setState(() {
              //                                   //// DELETE FROM FIREBASE ////
              //                                   var ds = DealService();
              //                                   ds.deleteJoiner(
              //                                       widget.deal.dealID,
              //                                       join.jointID);

              //                                   //// DELETE FROM MODEL ////
              //                                   jList.removeAt(index);

              //                                   ScaffoldMessenger.of(context)
              //                                       .showSnackBar(
              //                                     const SnackBar(
              //                                       content: Text(
              //                                         '  Join is cancelled!',
              //                                         style: TextStyle(
              //                                             fontSize: 15),
              //                                       ),
              //                                       duration:
              //                                           Duration(seconds: 5),
              //                                       behavior:
              //                                           SnackBarBehavior.fixed,
              //                                     ),
              //                                   );
              //                                 });
              //                               },
              //                               icon: Icon(
              //                                 Icons.delete_forever,
              //                                 size: 30,
              //                                 color: Colors.red[700],
              //                               ))
              //                           : const SizedBox(),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             );
              //           }),
              //     );
              //   }
              // })
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        onPressed: () async {
          _joined();  
          if (joinerNo < widget.ds.member) {
            FirebaseFirestore.instance
            .collection('group_deals')
            .doc()
            .collection('joint_members')
            .add({'joint_no': FieldValue.increment(1)});
          } else {
          FirebaseFirestore.instance.collection('joint_members')
          .doc()
          .update({'joint_no': FieldValue.increment(-1)});
          }
        },
        

          ////////// Query duplicated joiner in this deal //////////
          // QuerySnapshot snapshot = await FirebaseFirestore.instance
          //     .collection('group_deals')
          //     .doc(widget.deal.dealID)
          //     .collection("joint_members")
          //     .where('joint_uid', isEqualTo: context.read<UserModel>().uid)
          //     .get();

          // List<JointDB> dupJointList;
          // dupJointList = snapshot.docs.map((element) {
          //   return JointDB(
          //     jointID: element.id,
          //     jointUID: element['joint_uid'],
          //     jointName: element['joint_fullname'],
          //     jointPhone: element['joint_phoneNo'],
          //     jointEmail: element['joint_email'],
          //     jointImage: element['joint_image'],
          //   );
          // }).toList();

          // ////////// Query all joiner in this deal //////////
          // QuerySnapshot qs = await FirebaseFirestore.instance
          //     .collection('group_deals')
          //     .doc(widget.deal.dealID)
          //     .collection("joint_members")
          //     .get();

          // List<JointDB> joinerList;
          // joinerList = qs.docs.map((element) {
          //   return JointDB(
          //     jointID: element.id,
          //     jointUID: element['joint_uid'],
          //     jointName: element['joint_fullname'],
          //     jointPhone: element['joint_phoneNo'],
          //     jointEmail: element['joint_email'],
          //     jointImage: element['joint_image'],
          //   );
          // }).toList();

          // if (joinerList.length >= widget.deal.member!) {
          //   print(
          //       'This Deal is closed!!! ${joinerList.length} in ${widget.deal.member!}');
          // } else if (context.read<UserModel>().uid == widget.deal.uid) {
          //   print('You are Host!!!');
          // } else if (dupJointList.isNotEmpty) {
          //   print('You have joint already!!! ${dupJointList.length}');
          //   return;
          // } else {
          //   context.read<DealModel>().joinDeal(joint);

          // try {
          //   User? user = FirebaseAuth.instance.currentUser;

          //   await FirebaseFirestore.instance
          //       .collection('group_deals')
          //       .doc()
          //       .collection("joint_members")
          //       .add({
          //     'joint_uid': user!.uid,
          //     'joint_image':
          //         'https://firebasestorage.googleapis.com/v0/b/is-project01.appspot.com/o/user_image%2Fuser03.png?alt=media&token=9b32b994-d8f1-4982-8145-e8b890d3ccbc',
          //     'joint_fullname': widget.ds.createdUser,
          //     'joint_email': user.email,
          //     'joint_phoneNo': user.phoneNumber,
          //   });
          // } on FirebaseException catch (e) {
          //   print('Registration Error #1');
          //   print(e);
          //   return;
          // } catch (e) {
          //   print('Registration Error #2');
          //   print(e);
          //   return;
          // }

          //   setState(() {
          //     var ds = DealService();
          //     var jList = ds.getJointListFromFirebase(
          //         context.read<UserModel>().uid, widget.deal.dealID);
          //     jList.then((value) {
          //       context.read<DealModel>().jointList = value;
          //     });
          //   });
          //   print(ref.id);
          //   print(context.read<UserModel>().uid);
          // }

          // DealService ds = DealService();
          // ds.joinDeal(joint);

          // Navigator.pop(context);
        
        child: const Text('Join'),
      ),
    );
  }
}