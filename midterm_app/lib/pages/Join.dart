import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/Create_deal_model.dart';
import 'package:provider/provider.dart';

class JoinDealPage extends StatefulWidget{
  @override
  _JoinDealPageState createState() => _JoinDealPageState();
}

class _JoinDealPageState extends State<JoinDealPage> {
  int _counter = 0;

   void _incrementCounter() {

    setState(() {
      _counter++;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Deal'),
      ),
      body: Center(
        child: Column(
          children: [
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text('Host',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Deal',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/John.png',
                      width: 100
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Consumer<CreateDealModel>(
                        builder: (context, form, child) {
                          return Text('${form.dealtitle}',
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text('John Doe',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('',
                        style: TextStyle(fontSize: 20),
                      ), 
                    ),
                  ],
                ),   
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Deal Detail', 
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Consumer<CreateDealModel>(
                builder: (context, form, child) {
                  return Text('${form.dealdescription}',
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text('Location',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Consumer<CreateDealModel>(
                        builder: (context, form, child) {
                          return Text('${form.location}',
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text('Joiner',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Consumer<CreateDealModel>(
                        builder: (context, form, child) {
                          return Text('$_counter / ${form.numberofpeople}',
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text('Category',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Consumer<CreateDealModel>(
                        builder: (context, form, child) {
                          return Text('${form.category}',
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed:()=>{
          _incrementCounter(),
          Navigator.pop(context)
        },
        child: Text('Join'),
      ),
    );
  }
}