import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Created_Deal_Model.dart';
import 'Join_deal.dart';
import 'create_deal.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create:(context) => CreatedDealModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Table(
              children: [
                TableRow(
                  children:<Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => CreateDeal(),
                          ),
                        );
                      },
                      icon:Icon(Icons.add)
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => JoinDeal(),
                          ),
                        );
                      }, 
                      icon:Icon(Icons.emoji_symbols_outlined)
                    ),
                  ],
                ),
                TableRow(
                  children:<Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text('Created'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child:  Text('Join deal'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
