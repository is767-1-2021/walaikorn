

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/model/deal_model.dart';
import 'package:team_app/model/deal_model2.dart';

abstract class Services {
  Future<List<Deal>> getDeals();
  Future<String> addDeal(Deal value);
  Future<List<DealDB>> getFromFirebase(String? uid);
  Future<List<JointDB>> getJointListFromFirebase( String? uid, String? dealID);
  Future<List<Joiner>> getJoiners(id);
  Future<void> updateDeals(String uid, bool isClosed);
   Future<void> deleteJoiner(String? dealID, String? jointID);
}

class FirebaseServices extends Services {
  @override
  Future<List<Deal>> getDeals() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_deals').get();

    AllDeals deals = AllDeals.fromSnapshot(snapshot);
    return deals.deals;
  }
  Future<List<DealDB>> getFromFirebase(String? uid) async {
    print('getFromFirebase $uid');
    QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('group_deals').get();
    List<DealDB> dealList;
    dealList = snapshot.docs.map((element) {
      return DealDB(
        dealID: element.id,
        uid: element['uid'],
        title: element['title'],
        caption: element['caption'],
        place: element['place'],
        member: element['member'],
        category: element['category'],
        createdUser: element['createdUser'],
        createdDateTime: element['createdDateTime'].toDate(),
        isClosed: element['isClosed'],
      );
    }).toList();

    return dealList;
  }
  Future<String> addDeal(Deal value) async {
    DocumentReference ref =
        await FirebaseFirestore.instance.collection('group_deals').add({
      'uid': value.uid,
      'title': value.title,
      'caption': value.caption,
      'place': value.place,
      'member': value.member,
      'category': value.category,
      'createdUser': value.createdUser,
      'createdDateTime': value.createdDateTime,
      'isClosed': value.isClosed
    });

    return ref.id;
  }
  Future<List<DealDB>> getFromFirebaseWithUID(String? uid) async {
    print('getFromFirebaseWithUID $uid');
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('group_deals')
        .where('uid', isEqualTo: uid)
        .get();

    List<DealDB> dealList;
    dealList = snapshot.docs.map((element) {
      return DealDB(
          dealID: element.id,
          uid: element['uid'],
          title: element['title'],
          caption: element['caption'],
          place: element['place'],
          member: element['member'],
          category: element['category'],
          createdUser: element['createdUser'],
          createdDateTime: element['createdDateTime'].toDate(),
        isClosed: element['isClosed'],
      );
    }).toList();

    return dealList;
  }
  Future<List<JointDB>> getJointListFromFirebase(String? uid, String? dealID) async {
    print('getJointListFromFirebase $uid $dealID');
    QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('group_deals')
      .doc(dealID)
      .collection("joint_members")
      .get();

    List<JointDB> jointList;
    jointList = snapshot.docs.map((element) {
      return JointDB(
        jointID: element.id,
        jointUID: element['joint_uid'],
        jointName: element['joint_fullname'],
        jointPhone: element['joint_phoneNo'],
        jointEmail: element['joint_email'],
        jointImage: element['joint_image'],
      );
    }).toList();
    print(jointList.length);
    return jointList;
  }
  @override
  Future<List<Joiner>> getJoiners(id) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('group_deals')
        .doc(id)
        .collection('joint_members')
        .get();

    AllJoiners joiners = AllJoiners.fromSnapshot(snapshot);
    return joiners.joiners;
  }
  @override
  Future<void> updateDeals(String uid, bool isClosed) async {
    CollectionReference _ref =
        await FirebaseFirestore.instance.collection('group_deals');
    FirebaseFirestore.instance
        .collection('group_deals')
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _ref
            .doc(doc.id)
            .update({'isClosed': isClosed})
            .then((value) => print("Deals Updated"))
            .catchError((error) => print("Failed to update Deals : $error"));
      });
    });
  }
   @override
  Future<void> deleteJoiner(String? dealID, String? jointID) async {
    await FirebaseFirestore.instance
        .collection('group_deals')
        .doc(dealID)
        .collection("joint_members")
        .doc(jointID)
        .delete()
        .then(
            (context) => print("RefJoint: $jointID is deleted from Firebase"));
  }
}