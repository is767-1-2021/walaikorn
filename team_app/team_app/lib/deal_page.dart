import 'dart:ui';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:team_app/chatpage.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/deal_detail.dart';
import 'package:team_app/model/deal_model.dart';
import 'package:flutter/material.dart';
import 'package:team_app/model/user_model2.dart';
import 'package:team_app/profile.dart';
import 'package:team_app/services/deal_services.dart';
import 'around_you.dart';
import 'create_deal.dart';
import 'model/deal_model2.dart';
import 'package:provider/provider.dart';

class DealPage extends StatefulWidget {
  final DealController controller;
  // CollectionReference deal =
  //     FirebaseFirestore.instance.collection('group_deals');

  DealPage({Key? key, required this.controller}) : super(key: key);

  @override
  _DealPageState createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  List<Deal> deals = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    _getDeals();
    var ds = FirebaseServices();
    var dealList = ds.getFromFirebase(context.read<UserModel>().uid);
    dealList.then((value) {
      context.read<DealModel>().dealList = value;
    print(context.read<DealModel>().dealID);
    print(context.read<UserModel>().uid);
    });


    super.initState();
   
    
    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getDeals() async {
    var newDeals = await widget.controller.fectDeals();

    setState(() {
      deals = newDeals;
    });
  }

  // void _updateTodos(int id, bool completed) async {
  //   await widget.controller.updateTodos(id, completed);
  // }

  Widget get body => isLoading
    ? CircularProgressIndicator()
    : SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 5),
      child: Column(
      children: <Widget>[
        ImageSlideshow(
          height: 250,
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset('image/HOTPOT4BUY3.jpg', fit: BoxFit.cover),
            Image.asset('image/JUMBODEAL.jpg', fit: BoxFit.cover),
            Image.asset('image/OISHI4BUY3.jpg', fit: BoxFit.cover),
            Image.asset('image/MLB50OFF.jpg', fit: BoxFit.cover),
            Image.asset('image/HMSALE.jpg', fit: BoxFit.cover),
          ]
        ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  itemCount: deals.isEmpty ? 1 : deals.length,
                  itemBuilder: (BuildContext context, int index) {
                    Deal ds = deals[index];
                    var services = FirebaseServices();
                    var controller = DealController(services);
                    if (deals.isNotEmpty) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DealDetail2(ds: ds, controller: controller)
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            child: Row(
                              mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Icon(
                                      deals[index].category =='Food & Beverage'? Icons.dinner_dining:
                                      deals[index].category =='Entertainment'? Icons.tv:
                                      deals[index].category =='Travel'? Icons.landscape:
                                      deals[index].category == 'Groceries'? Icons.shopping_bag:
                                      deals[index].category == 'Other'? Icons.money: 
                                      null,                               
                                      size: 35.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                    children: [
                                      Text(deals[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0
                                        ),
                                      ),
                                      Text(deals[index].caption,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16.0
                                        ),
                                      ),
                                      Wrap(
                                        spacing: 100.0,
                                        children:[
                                          Text(
                                            deals[index].place,
                                            style: TextStyle(
                                              fontSize: 14.0
                                            ),
                                          ),
                                          Text(deals[index].member.toString(),
                                            style:TextStyle(
                                              fontSize: 14.0
                                            )
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 35.0,
                                    height: 35.0,
                                    child: Icon(Icons.favorite_border),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text('No Deal');
                    }
                      // DealDB deal = dList[index];
                      // DocumentSnapshot ds =
                  } //     snapshot.data!.docs[index];
                ),
              )
            ],
          ),
        );
  // : ListView.builder(
  //     itemCount: deals.isEmpty ? 1 : deals.length,
  //     itemBuilder: (context, index) {
  //       if (deals.isEmpty) {
  //         return Text("Tap Button to fetch Deals");
  //       }

  //       return CheckboxListTile(
  //         onChanged: (bool? isClosed) {
  //           setState(() {
  //             // deals[index].completed = completed!;
  //             // _updateTodos(todos[index].id, completed);
  //           });
  //         },
  //         value: deals[index].isClosed,
  //         title: Text(deals[index].title),
  //       );
  //     },
  //   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.all(0.5),
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Text('WeDeal Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            ListTile(
              title: Text('Around You',
                  style:
                      TextStyle(color: Colors.deepPurple[900], fontSize: 15)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationPage()));
              },
              trailing: Icon(Icons.location_on),
            ),
            ListTile(
              title: Text('Profile',
                  style:
                      TextStyle(color: Colors.deepPurple[900], fontSize: 15)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              trailing: Icon(Icons.person_pin_rounded),
            ),
            ListTile(
              title: Text('Chats',
                  style:
                      TextStyle(color: Colors.deepPurple[900], fontSize: 15)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              },
              trailing: Icon(Icons.chat_outlined),
            ),
          ],
        )),
        body: Center(
          child: body,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _getDeals,
        //   child: Icon(Icons.add),
        floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple[600],
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateDeal()));
            }));
    // ));
  }
}
