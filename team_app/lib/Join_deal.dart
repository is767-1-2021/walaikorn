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
         // crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.center,//
          children: <Widget>[
            
                   //image: AssetImage('image/profile.png')))),
          
              //"John Doe",//
          
            DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Host',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                DataColumn(
                  label: Text('Deal',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Expanded(
                        child: Text('John Doe', 
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ),
                    DataCell(
                      Expanded(
                        child: Text('Buffet hotpot', 
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ),
                  ]
                ),
              ], 
            ),

            
            DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Deal detail',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                DataColumn(
                  label: Text('',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Icon(Icons.campaign_rounded)
                    ),
                    DataCell(
                      Expanded(
                        child: Text('hotpot มา 4 จ่าย 3 เหลือคนละ 259',
                          maxLines: 3,
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.clip, 
                        ),
                      ),
                    ),
                  ]
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Icon(Icons.location_on_rounded)
                    ),
                  ],
                ),
              ], 
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
