import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String? _docId;
  String? _fullname;
  String? _gender;
  DateTime? _birthday;
  String? _phoneNo;
  String? _image;
  String? _password;
  String? _confirmPassword;
  String? _email;
  String? _uid;
  bool _isLoggedIn = false;
  List<UserDB> _userList = [];

  UserDB? _selectedUser;

  Map<String, dynamic> toJson() => {
        'id': _docId,
        'fullname': _fullname,
        'gender': _gender,
        'birthday': _birthday,
        'phoneNo': _phoneNo,
        'image': _image,
        'email': _email,
        'uid': _uid,
        'isLoggedIn': _isLoggedIn
      };

  reset() {
    _fullname = '';
    _gender = '';
    _birthday = null;
    _phoneNo = '';
    _password = '';
    _email = '';
    _isLoggedIn = false;
    notifyListeners();
  }

  String? get docId {
    return _docId;
  }

  set docId(String? val) {
    _docId = val;
    notifyListeners();
  }

  String? get fullname {
    return _fullname;
  }

  set fullname(String? val) {
    _fullname = val;
    notifyListeners();
  }

  String? get gender {
    return _gender;
  }

  set gender(String? val) {
    _gender = val;
    notifyListeners();
  }

  DateTime? get birthday {
    return _birthday;
  }

  set birthday(DateTime? val) {
    _birthday = val;
    notifyListeners();
  }

  String? get phoneNo {
    return _phoneNo;
  }

  set phoneNo(String? val) {
    _phoneNo = val;
    notifyListeners();
  }

  String? get image {
    return _image;
  }

  set image(String? val) {
    _image = val;
    notifyListeners();
  }

  String? get password {
    return _password;
  }

  set password(String? val) {
    _password = val;
    notifyListeners();
  }

  String? get confirmPassword {
    return _confirmPassword;
  }

  set confirmPassword(String? val) {
    _confirmPassword = val;
    notifyListeners();
  }

  String? get email {
    return _email;
  }

  set email(String? val) {
    _email = val;
    notifyListeners();
  }

  String? get uid {
    return _uid;
  }

  set uid(String? val) {
    _uid = val;
    notifyListeners();
  }

  bool? get isLoggedIn {
    return _isLoggedIn;
  }

  set isLoggedIn(bool? val) {
    _isLoggedIn = val!;
    notifyListeners();
  }

  List get user {
    return _userList;
  }

  set userList(List<dynamic> val) {
    _userList = val as List<UserDB>;
    notifyListeners();
  }

  UserDB? get selectedUser {
    return _selectedUser;
  }

  set selectedUser(UserDB? val) {
    _selectedUser = val;
    notifyListeners();
  }
}

class UserDB {
  UserDB(
      {this.fullname,
      this.gender,
      this.birthday,
      this.phoneNo,
      this.image,
      this.password,
      this.confirmPassword,
      this.email,
      this.uid,
      this.isLoggedIn});

  String? fullname;
  String? gender;
  DateTime? birthday;
  String? phoneNo;
  String? image;
  String? password;
  String? confirmPassword;
  String? email;
  String? uid;
  bool? isLoggedIn;
}