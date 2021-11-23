import 'package:cloud_firestore/cloud_firestore.dart';

class Deal {
  String uid;
  String title;
  String caption;
  String place;
  int member;
  String category;
  String createdUser;
  DateTime createdDateTime;
  bool isClosed;
  bool isFav = false;

  Deal(
    this.uid,
    this.title,
    this.caption,
    this.place,
    this.member,
    this.category,
    this.createdUser,
    this.createdDateTime,
    this.isClosed,
    this.isFav,
  );

  factory Deal.fromJson(
    Map<String, dynamic> json,
  ) {
    return Deal(
      json['uid'] as String,
      json['title'] as String,
      json['caption'] as String,
      json['place'] as String,
      json['member'] as int,
      json['category'] as String,
      json['createdUser'] as String,
      json['createdDateTime'].toDate() as DateTime,
      json['isClosed'] as bool,
      json['isFav'] as bool,
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

class Joiner {
  String jointID;
  String jointUID;
  String jointName;
  String jointPhone;
  String jointEmail;
  String jointImage;
  int JoinerNo;

  Joiner(
    this.jointID,
    this.jointUID,
    this.jointName,
    this.jointPhone,
    this.jointEmail,
    this.jointImage,
    this.JoinerNo,
  );

  factory Joiner.fromJson(
    Map<String, dynamic> json,
  ) {
    return Joiner(
      json['jointID'] as String,
      json['joint_uid'] as String,
      json['joint_fullname'] as String,
      json['joint_email'] as String,
      json['joint_phoneNo'] as String,
      json['joint_image'] as String,
      json['joint_no'] as int,
    );
  }
}

class AllJoiners {
  final List<Joiner> joiners;
  AllJoiners(this.joiners);

  factory AllJoiners.fromJson(List<dynamic> json) {
    List<Joiner> joiners;

    joiners = json.map((index) => Joiner.fromJson(index)).toList();

    return AllJoiners(joiners);
  }

  factory AllJoiners.fromSnapshot(QuerySnapshot s) {
    List<Joiner> joiners = s.docs.map((DocumentSnapshot ds) {
      return Joiner.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllJoiners(joiners);
  }
}