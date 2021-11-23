import 'dart:async';
import 'package:team_app/model/deal_model.dart';
import 'package:team_app/services/deal_services.dart';

class DealController {
  final Services services;
  List<Deal> deals = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  DealController(this.services);

  Future<List<Deal>> fectDeals() async {
    onSyncController.add(true);
    deals = await services.getDeals();
    onSyncController.add(false);
    return deals;
  }

  // Future<void> updateTodos(int id, bool completed) async {
  //   onSyncController.add(true);
  //   await services.updateTodos(id, completed);
  //   onSyncController.add(false);
  // }
}