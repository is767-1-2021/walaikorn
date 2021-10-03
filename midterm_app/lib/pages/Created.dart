import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/Create_deal_model.dart';
import 'package:provider/provider.dart';

class CreatedDealPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Created Deal'),
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
             initialValue: context.read<CreateDealModel>().dealtitle,
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
             initialValue: context.read<CreateDealModel>().dealdescription,
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
            initialValue: context.read<CreateDealModel>().location,
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
            initialValue: context.read<CreateDealModel>().numberofpeople.toString(),
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
           TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'type category'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please choose deal category.';
              }

              return null;
            },
            onSaved: (value) {
              _category = value;
            },
             initialValue: context.read<CreateDealModel>().category,
          ),
          
          const SizedBox(height: 40),
          SizedBox(
            height:50,
            child: ElevatedButton(
              onPressed: () {
                if (_dealdetail.currentState!.validate()) {
                  _dealdetail.currentState!.save();

                  context.read<CreateDealModel>().dealtitle = _dealtitle;
                  context.read<CreateDealModel>().dealdescription = _dealdescription;
                  context.read<CreateDealModel>().location = _location;
                  context.read<CreateDealModel>().numberofpeople = _numberofpeople;
                  context.read<CreateDealModel>().category = _category;

                  Navigator.pop(context);
                }
              }, 
              child: Text('let someone join your deal',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
