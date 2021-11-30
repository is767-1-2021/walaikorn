

import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';


abstract class Services {
  Future<List<History>> getHistorys();
  //Future<String> addHistory(String history, String result, Timestamp pressedTime);
}

class HistoryServices extends Services {
  
  @override
  Future<List<History>> getHistorys() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('result_history')
      .get();

    AllHistorys historys = AllHistorys.fromSnapshot(snapshot);
    return historys.historys;
       
  
  }
  
}


// class CalculatorService {
//   Future<List<CalculatorModel>> getHistoryFromFirebase() async {
//     QuerySnapshot snapshot =
//       await FirebaseFirestore.instance.collection('calculator').get();

//     CalsModel historys = CalsModel.fromSnapshot(snapshot);
//     return historys.historys;
//   }

//   addHistoryToFirebase(String calculation, String result) async {
//     final historyRef = FirebaseFirestore.instance
//         .collection('calculator')
//         .withConverter<CalculatorModel>(
//             fromFirestore: (snapshot, _) =>
//                 CalculatorModel.fromJson(snapshot.data()!),
//             toFirestore: (history, _) => history.toJson());

//     await historyRef.add(CalculatorModel( history, output));
//   }
// }