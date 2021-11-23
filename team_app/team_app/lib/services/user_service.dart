import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/model/deal_model.dart';

abstract class Services {
  Future<List<Deal>> getDeals();
  Future<String> addDeal(Deal value);
}

class FirebaseServices extends Services {
  @override
  Future<List<Deal>> getDeals() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_deals').get();

    AllDeals deals = AllDeals.fromSnapshot(snapshot);
    return deals.deals;
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
}