
import 'package:final_app/controller.dart';
import 'package:final_app/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'model.dart';



class  HistoryPage extends StatefulWidget {
  
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  late final Services services;
  late final HistoryController controller;
  List<History> historys = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    services = HistoryServices();
    controller = HistoryController(services);
    controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
    getHistorys();
  }

  void getHistorys() async {
    var newHistory = await controller.fecthHistory();

    setState(() {
      historys = newHistory;
    });
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: historys.length,
        itemBuilder: (BuildContext context, index) {
        History newHistory = historys[index];
          return ListTile(
            title: Text(newHistory.history + "="),
            subtitle: Text(newHistory.result)
          );
        }
      )
    );
  }
}
        
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.centerRight,
//                 padding: EdgeInsets.all(20.0),
//                 child: Consumer<History>(
//                   builder: (context, form, child) {
//                     return Text(context.read<History>().result.toString() ,
//                       style: TextStyle(fontSize: (20)),
//                     );
//                   },
//                 ),
//               ),
//                 Container(
//                 alignment: Alignment.centerRight,
//                 padding: EdgeInsets.all(25.0),
//                 child: Consumer<History>(
//                   builder: (context, form, child) {
//                     return Text(context.read<AllHistorys>().historys.toString(),
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
