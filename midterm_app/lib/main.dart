import 'package:flutter/material.dart';
import 'package:midterm_app/models/Create_deal_model.dart';
import 'package:midterm_app/pages/Contact_US.dart';
import 'package:midterm_app/pages/Created.dart';
import 'package:midterm_app/pages/FQA.dart';
import 'package:midterm_app/pages/Favorite.dart';
import 'package:midterm_app/pages/Join.dart';
import 'package:midterm_app/pages/Search_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create:(context) => CreateDealModel(),
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
                            builder: (context) => CreatedDealPage(),
                          ),
                        );
                      },
                      icon:Icon(Icons.add)
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => JoinDealPage(),
                          ),
                        );
                      }, 
                      icon:Icon(Icons.emoji_symbols_outlined)
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ),
                        );
                      }, 
                      icon:Icon(Icons.search)
                    )
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
                    Container(
                      alignment: Alignment.center,
                      child: Text('Search'),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => FqaPage(),
                          ),
                        );
                      }, 
                      icon:Icon(Icons.question_answer_sharp)
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => ContactUsPage(),
                          ),
                        );
                      }, 
                      icon:Icon(Icons.contact_mail)
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => FavoritePage(),
                          ),
                        );
                      }, 
                      icon:Icon(Icons.favorite_sharp)
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text('FQA'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('contact us'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child:Text('Favorite'),
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
