import 'package:cloud_firestore/cloud_firestore.dart';

class Deal {
  final String caption;
  final String category;
  final DateTime createdDateTime;
  final String createdUser;
  final int member;
  final String place;
  final String title;
  final String uid;
  bool isClosed;


  /*constructor */
  Deal(this.caption, this.category, this.createdDateTime, this.createdUser,
      this.member, this.place, this.title, this.uid, this.isClosed);

  /*โยนค่าจาก json เป็น map object*/
  factory Deal.fromJson(
    Map<String, dynamic> json,
  ) {
    return Deal(
      json['caption'] as String,
      json['category'] as String,
      json['createdDateTime'].toDate() as DateTime,
      json['createdUser'] as String,
      json['member'] as int,
      json['place'] as String,
      json['title'] as String,
      json['uid'] as String,
      json['isClosed'] as bool,
    );
  }
}

class AllDeals {
  final List<Deal> deals;
  AllDeals(this.deals);

  factory AllDeals.fromJson(List<dynamic> json) {
    List<Deal> deals;

    deals = json.map((index) => Deal.fromJson(index)).toList();

    return AllDeals(deals);
  }

  factory AllDeals.fromSnapshot(QuerySnapshot s) {
    List<Deal> deals = s.docs.map((DocumentSnapshot ds) {
      return Deal.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllDeals(deals);
  }
}