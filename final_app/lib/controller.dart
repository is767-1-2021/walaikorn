
import 'dart:async';
import 'package:final_app/model.dart';
import 'service.dart';

class HistoryController {
  final Services services;
   List<History> historys = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  HistoryController(this.services);

  Future<List<History>> fecthHistory() async {
    onSyncController.add(true);
    historys = await services.getHistorys();
    onSyncController.add(false);
    return historys;
  }

  // addHistory(String history, String result, Timestamp pressedTime) async {
  //   await services.addHistory(history, result, pressedTime);
  // }
}



// class Controller {
//   CalculatorService service = new CalculatorService();
//   List<HistoryModel> histories = [];

//   StreamController<bool> onSyncController = StreamController();
//   Stream<bool> get onSync => onSyncController.stream;

//   Future<List<HistoryModel>> fetchHistories() async {
//     onSyncController.add(true);
//     histories = await service.getHistoryFromFirebase();
//     histories.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//     onSyncController.add(false);
//     return histories;
//   }

//   addHistory(String calculation, String result) async {
//     await service.addHistoryToFirebase(calculation, result);
//   }
// }
