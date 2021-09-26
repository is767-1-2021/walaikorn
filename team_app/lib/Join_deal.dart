import 'package:flutter/material.dart';

class JoinDeal extends StatefulWidget{
   JoinDeal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _JoinDealState createState() => _JoinDealState();
}

class _JoinDealState extends State<JoinDeal> {
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
        title: Text('Join Deal')
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 190.0,
                height: 190.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('image/profile.png')))),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "John Doe",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Joined',
        child: Text('Join'),
      ),
    );
  }
}
