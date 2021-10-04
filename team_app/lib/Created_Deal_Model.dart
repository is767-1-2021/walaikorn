import 'package:flutter/cupertino.dart';

class CreatedDealModel extends ChangeNotifier{
  String? _dealtitle;
  String? _dealdescription;
  String? _location;
  int? _numberofpeople;
  String? _category;

  get dealtitle => this._dealtitle;

   set dealtitle( value) {
    this._dealtitle = value;
    notifyListeners();
  } 

  get dealdescription => this._dealdescription;

  set dealdescription( value) {
    this._dealdescription = value;
    notifyListeners();
  }

  get location => this._location;

  set location( value) {
    this._location = value;
    notifyListeners();
  }

  get numberofpeople => this._numberofpeople;

  set numberofpeople( value) {
    this._numberofpeople = value;
    notifyListeners();
  }

  get category => this._category;

  set category(value) {
    this._category = value;
    notifyListeners();
  }
}