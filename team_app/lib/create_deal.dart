import 'package:flutter/material.dart';

class CreateDeal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Deal'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        child: NewDeal()),
    );
  }
}

class NewDeal extends StatefulWidget{
  @override
  _NewDealState createState() => _NewDealState();
}

class _NewDealState extends State<NewDeal> {
  final _dealdetail = GlobalKey<FormState>();
  String? _dealtitle;
  String? _dealdescription;
  String? _location;
  int? _numberofpeople;
  String? _category;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _dealdetail,
      
      child: Column(
        children: [
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Deal Title', style: TextStyle(fontSize: 20.0, color: Colors.white))
            ),
              decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'type your deal'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type Deal Title.';
              }

              return null;
            },
            onSaved: (value) {
              _dealtitle = value;
            },
          ),
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Deal Description', style: TextStyle(fontSize: 20.0, color: Colors.white ))
            ),
              decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
          ),
           TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'type something'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type Deal Description.';
              }

              return null;
            },
            onSaved: (value) {
              _dealdescription = value;
            },
          ),
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Deal location', style: TextStyle(fontSize: 20.0, color: Colors.white))
            ),
              decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
          ),
           TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Your Deal at ...'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter location.';
              }

              return null;
            },
            onSaved: (value) {
              _location = value;
            },
          ),
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Number of people', style:TextStyle(fontSize: 20.0, color: Colors.white))
            ),
              decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
          ),
           TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'How many people you are looking for...'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter number of people.';
              }

              if (int.parse(value) < 0) {
                return 'Number not valid';
              }

              return null;
            },
            onSaved: (value) {
              _numberofpeople = int.parse(value!);
            },
          ),
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Category', style: TextStyle(fontSize: 20.0, color: Colors.white ))
            ),
              decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
          ),
          DropdownButtonFormField<String>(
            value: _category,
            items: ['Food & Berverage', 'Entertainment', 'Travel', 'Groceries', 'Other'] //list of categories
              .map((label) => DropdownMenuItem(
                child: Text(label),
                value: label,
              ))
              .toList(),
            hint: Text('Choose category'),
            onChanged: (value) {
              setState(() {
                _category = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please choose deal catergory.';
              }

              return null;
            },
            onSaved: (value) {
              _category = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_dealdetail.currentState!.validate()) {
                _dealdetail.currentState!.save();

              print('your deal has created = $_dealtitle $_dealdescription $_location $_numberofpeople $_category');
 
              }
            }, 
            child: Text('let someone join your deal'),
          ),
        ],
      ),
    );
  }
}
