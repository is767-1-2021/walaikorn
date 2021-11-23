import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryDealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'History Deal',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple.shade600,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(
                    'KAMU BUY 1 GET 1',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรชานมไข่มุก KAMU 1 แถม 1 ค่ะ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 28 September 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/kamu.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'KRISPYKREME BUY 1 GET 1',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรโดนัท Krispy-Kreme 1 แถม 1 ค่ะ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 12 September 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/krispykreme.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('OISHI มา 4 จ่าย 3',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรบุฟเฟ่ต์ OISHI มา 4 จ่าย 3 ครับ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  3',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 30 August 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/oishi.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('POTATO CORNER BUY 1 GET 1',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรเฟรนฟราย Potato Corner 1 แถม 1 ครับ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 25 August 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/potatocorner.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('STARBUCKS BUY 1 GET 1',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรกาแฟ Starbucks ซื้อ 1 แถม 1 ค่ะ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 19 August 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/starbucks.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('SWENSENS BUY 1 GET 1',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรไอศกรีม Swensens ซื้อ 1 แถม 1 ค่ะ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 06 August 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/swensens.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('LEVIS BUY 1 GET 1',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารโปรซื้อกางเกนยีน Levis 1 แถม 1 ครับ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  Siam     Person:  1',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 28 July 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/levis.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('SHABU SHI มา 4 จ่าย 3',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('หาคนหารบุฟเฟ่ Shabu shi มา 4 จ่าย 3 ค่ะ',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Location:  CTW      Person:  3',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38)),
                        Text('Deal Date: 15 July 2021',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black38))
                      ],
                    ),
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60,
                      maxWidth: 60,
                      minHeight: 60,
                      minWidth: 60,
                    ),
                    child: Image.asset('image/shabu.jpg'),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
            ],
          ),
        ));
  }
}
