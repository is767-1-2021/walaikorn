import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class History {

  double num1 = 0.0;
  double num2 = 0.0;
  String history = '';
  String result = '';
  String operation = '';
  Timestamp pressedTime;

  History(this.num1, this.num2,this.history,this.result, this.operation, this.pressedTime);

  factory History.FormJson(
    Map<String, dynamic> json,
  ) {
    return History(
      json['num1'] as double,
      json['num2'] as double,
      json['history'] as String,
      json['result'] as String,
      json['operation'] as String,
      json['pressedTime'] as Timestamp,
      
    ); 
  }
}

  // factory HistoryModel.toJson(Map<String, dynamic> json) {
  //   return HistoryModel(json['calculation'], json['result'], json['timestamp']);
  // }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'calculation': calculation,
  //     'result': result,
  //     'timestamp': timestamp,
  //   };
  // }
  // List<History> HistoryFromSnapShot(QuerySnapshot s) {
  //   List<History> historys = s.docs
  //     .map((e) => History.fromJson(e.data() as Map<String, dynamic>))
  //     .toList();
  //   return historys;
  // }

  // List<CalculatorModel> historysFromSnapShot(QuerySnapshot s) {
  //   List<CalculatorModel> historys = s.docs
  //       .map((e) => CalculatorModel.fromJson(e.data() as Map<String, dynamic>))
  //       .toList();

  //   return historys;
  // }


class AllHistorys extends ChangeNotifier {
  List<History> historys = [];

  get getHistorys => this.historys;

  set setHistorys(histors) {
    this.historys = historys;
    notifyListeners();
  }

  get result => this.result;

  set result(value) {
    this.result = value;
    notifyListeners();
  }
  get history => this.history;

  set history(value) {
    this.result = value;
    notifyListeners();
  }

 
  AllHistorys(this.historys);
  
  factory AllHistorys.fromJson(List<dynamic> json) {
    List<History> historys;

    historys = json.map((index) => History.FormJson(index)).toList();

    return AllHistorys(historys);
}
  factory AllHistorys.fromSnapshot(QuerySnapshot s) {
    List<History> historys = s.docs.map((DocumentSnapshot ds) {
      return History.FormJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllHistorys(historys);
  }
}
