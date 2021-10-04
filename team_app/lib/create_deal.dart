

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Created_Deal_Model.dart';

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
          SizedBox(
            height:60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Deal Title', 
                style: TextStyle(
                  fontSize: 20.0, 
                  color: Colors.purple[900], 
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
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
            initialValue: context.read<CreatedDealModel>().dealtitle,
          ),
          SizedBox(
          height:60,
          child: Align(
            alignment: Alignment.centerLeft,
              child: Text('Deal Description', 
                style: TextStyle(
                  fontSize: 20.0, 
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'type something',
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
            initialValue: context.read<CreatedDealModel>().dealdescription,
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Deal location',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your Deal at ...',
              prefixIcon: Icon(Icons.location_on)
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
            initialValue: context.read<CreatedDealModel>().location,
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Number of people', 
                style:TextStyle(
                  fontSize: 20.0, 
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
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
             initialValue: context.read<CreatedDealModel>().numberofpeople.toString(),
          ),
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Category', 
                style: TextStyle(
                  fontSize: 20.0, 
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          DropdownButtonFormField<String>(
            value: _category,
            isExpanded: true,
            items: ['Food & Berverage', 'Entertainment', 'Travel', 'Groceries', 'Other'] //list of categories
            .map((label) => DropdownMenuItem(
              child: Text(label,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
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
          const SizedBox(height:60),
          SizedBox(
            height:60,
            child:ElevatedButton(
              onPressed: () {
                if (_dealdetail.currentState!.validate()) {
                  _dealdetail.currentState!.save();

                  context.read<CreatedDealModel>().dealtitle = _dealtitle;
                  context.read<CreatedDealModel>().dealdescription = _dealdescription;
                  context.read<CreatedDealModel>().location = _location;
                  context.read<CreatedDealModel>().numberofpeople = _numberofpeople;
                  context.read<CreatedDealModel>().category = _category;

                  Navigator.pop(context);
                }
              }, 
              child: Text('Create',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
