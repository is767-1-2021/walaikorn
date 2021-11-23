import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class DealModel extends ChangeNotifier {
  String? _dealID;
  String? _category;
  String? _title;
  String? _caption;
  String? _place;
  int? _member;
  String? _createdUser;
  DateTime? _createdDateTime;
  String? _uid;
  bool? _isClosed = false;

  List<DealDB>? _dealList = [];

  List<JointDB>? _jointList = [];

  get dealID => _dealID;
  set dealID(value) {
    _dealID = value;
    notifyListeners();
  }

  get category => _category;
  set category(value) {
    _category = value;
    notifyListeners();
  }

  get title => _title;
  set title(value) {
    _title = value;
    notifyListeners();
  }

  get caption => _caption;
  set caption(value) {
    _caption = value;
    notifyListeners();
  }

  get place => _place;
  set place(value) {
    _place = value;
    notifyListeners();
  }

  get member => _member;
  set member(value) {
    _member = value;
    notifyListeners();
  }

  get createdUser => _createdUser;
  set createdUser(value) {
    _createdUser = value;
    notifyListeners();
  }

  get createdDateTime => _createdDateTime;
  set createdDateTime(value) {
    _createdDateTime = value;
    notifyListeners();
  }

  get uid => _uid;
  set uid(value) {
    _uid = value;
    notifyListeners();
  }

  get isClosed => _isClosed;
  set isClosed(value) {
    _isClosed = value;
    notifyListeners();
  }

  addDeal(DealDB value) {
    _dealList!.add(value);
    notifyListeners();
  }

  List<dynamic>? get deal => _dealList;
  set dealList(List<dynamic> value) {
    _dealList = value as List<DealDB>;
    notifyListeners();
  }

  void updateDeal(String id, String newCaption) {
    var data = _dealList!.where((element) => element.dealID == id).first;
    data.caption = newCaption;
    notifyListeners();
  }

  void deleteDeal(String? value) {
    _dealList!.removeWhere((element) => element.dealID == value);
    notifyListeners();
    print('Deal Deleted from Model');
  }

  void joinDeal(JointDB value) {
    _jointList!.add(value);
    notifyListeners();
  }

  List<dynamic>? get joint => _jointList;
  set jointList(List<dynamic> value) {
    _jointList = value as List<JointDB>;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dealID'] = dealID;
    data['uid'] = uid;
    data['title'] = title;
    data['caption'] = caption;
    data['place'] = place;
    data['member'] = member;
    data['category'] = category;
    data['createdUser'] = createdUser;
    data['createdDateTime'] = createdDateTime;
    data['isClosed'] = isClosed;
    data['joint_members'] = joint;

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> joint = <String, dynamic>{};
      joint['jointID'] = dealID;
      joint['joint_uid'] = dealID;
      joint['joint_fullname'] = uid;
      joint['joint_email'] = title;
      joint['joint_phoneNo'] = caption;
      joint['joint_image'] = place;
      return joint;
    }

    return data;

    
    
  }
  
  
}

class DealDB {
  DealDB(
      {this.dealID,
      this.uid,
      this.title,
      this.caption,
      this.place,
      this.member,
      this.category,
      this.createdUser,
      this.createdDateTime,
      this.isClosed,
      this.joint});

  String? dealID;
  String? uid;
  String? title;
  String? caption;
  String? place;
  int? member;
  String? category;
  String? createdUser;
  DateTime? createdDateTime;
  bool? isClosed;
  List<JointDB>? joint;
}

class JointDB {
  JointDB(
      {this.jointID,
      this.jointUID,
      this.jointName,
      this.jointPhone,
      this.jointEmail,
      this.jointImage});

  String? jointID;
  String? jointUID;
  String? jointName;
  String? jointPhone;
  String? jointEmail;
  String? jointImage;
}