

import 'package:final_app/controller.dart';
import 'package:final_app/model.dart';
import 'package:final_app/service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator.dart';
import 'history.dart';
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   var histories = await HistoryController().fetchHistories();

//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (context) => HistoriesModel(histories))
//     ],
//     child: MyApp(),
 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 

  var services = HistoryServices();
  var historys = await HistoryController(services).fecthHistory();
  


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AllHistorys(historys),
          
        ),
     
      ],
      child: MyApp()
    ),
  );
}
//  var histories = await HistoryController().fetchHistories();

//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (context) => HistoriesModel(histories))
//     ],
//     child: MyApp(),
//   ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({Key? key}) : super(key: key);

 
  
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text('Calculator',
                style: TextStyle(fontSize: 20)
              )
            ),
            Tab(
              child: Text('History',
                style: TextStyle(fontSize: 20)
              )
            )
          ],
        ),
      ),
      body: TabBarView(
      controller: _tabController,
        children: [
          CalculatorPage(),
          HistoryPage(),
        ],
      ),
    );
  }
}