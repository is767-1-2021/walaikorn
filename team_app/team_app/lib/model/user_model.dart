import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*local model*/
// class UserModel extends ChangeNotifier {
//   String? _docId;
//   String? _fullname;
//   String? _email;
//   String? _password;
//   String? _confirmPassword;
//   String? _phoneNo;
//   String? _image =
//       "https://firebasestorage.googleapis.com/v0/b/is-project01.appspot.com/o/user_image%2Fuser03.png?alt=media&token=9b32b994-d8f1-4982-8145-e8b890d3ccbc";
//   String? _uid;
//   bool? _isLoggedIn = false;

//   List<UserData> _userList = [];
//   UserData? _userData;

//   Map<String, dynamic> toJson() => {
//         'id': _docId,
//         'fullname': _fullname,
//         'email': _email,
//         'phoneNo': _phoneNo,
//         'image': _image,
//         'uid': _uid,
//         'isLoggedIn': isLoggedIn,
//       };

//   get fullname => this._fullname;

//   set fullname(value) {
//     this._fullname = value;
//     notifyListeners();
//   }

//   get phoneNo => this._phoneNo;

//   set phoneNo(value) {
//     this._phoneNo = value;
//     notifyListeners();
//   }

//   get email => this._email;

//   set email(value) {
//     this._email = value;
//     notifyListeners();
//   }

//   get password => this._password;

//   set password(value) {
//     this._password = value;
//     notifyListeners();
//   }

//   get confirmPassword => this._confirmPassword;

//   set confirmPassword(value) {
//     this._confirmPassword = value;
//     notifyListeners();
//   }

//   get image => this._image;

//   set image(value) {
//     this._image = value;
//     notifyListeners();
//   }

//   get uid => this._uid;

//   set uid(value) {
//     this._uid = value;
//     notifyListeners();
//   }

//   get isLoggedIn => this._isLoggedIn;

//   set isLoggedIn(value) {
//     this.isLoggedIn = value;
//     notifyListeners();
//   }
// }

// /*สร้าง class เพื่อเก็บ List ของ User*/
// class UserData {
//   String? fullname;
//   String? email;
//   String? password;
//   String? confirmPassword;
//   String? phoneNo;
//   String? image;
//   String? uid;
//   bool? isLoggedIn;

//   UserData(
//       {this.fullname,
//       this.email,
//       this.password,
//       this.confirmPassword,
//       this.phoneNo,
//       this.image,
//       this.uid,
//       this.isLoggedIn});
// }

class UserData {
  String fullname;
  String email;
  String password;
  String confirmPassword;
  String phoneNo;
  String image;
  String uid;
  bool isLoggedIn;

  UserData(this.fullname, this.email, this.password, this.confirmPassword,
      this.phoneNo, this.image, this.uid, this.isLoggedIn);

  /*โยนค่าจาก json เป็น map object*/
  factory UserData.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserData(
      json['fullname'] as String,
      json['email'] as String,
      json['password'] as String,
      json['confirmPassword'] as String,
      json['phoneNo'] as String,
      json['image'] as String,
      json['uid'] as String,
      json['isLoggedIn'] as bool,
    );
  }
}

class AllUsers {
  final List<UserData> users;
  AllUsers(this.users);

  factory AllUsers.fromJson(List<dynamic> json) {
    List<UserData> users;

    users = json.map((index) => UserData.fromJson(index)).toList();

    return AllUsers(users);
  }

  factory AllUsers.fromSnapshot(QuerySnapshot s) {
    List<UserData> users = s.docs.map((DocumentSnapshot ds) {
      return UserData.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllUsers(users);
  }
}