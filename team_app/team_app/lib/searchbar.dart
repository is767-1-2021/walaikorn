import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final keywords = [
    "Bubble Tea",
    "Netflix",
    "Viu",
    "Croissant",
    "Bakery",
    "Shabu",
    "Tepanyaki",
    "Yakiniku",
    "Movies",
    "Clothes",
    "Accessories",
    "Apple Back To School",
  ];
  final recentkeywords = [
    "Bubble Tea",
    "Netflix",
    "Viu",
    "Croissant",
  ]; // **history search

  @override
  List<Widget> buildActions(BuildContext context) {
    // what action we want perform for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon onthe left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context,
            ""); //* โค้ดจริงๆให้ใส่ null แต่เครือ่งบอกใส่ไม่ได้ เป็น not null
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    //จริงๆ ตรงนี้ต้องเป็นหน้า ListDeal
    return Center(
      child: Column(
        children: [Image.asset('image/bubble_tea.jpg'), Text('Bubble Tea')],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when user searchs for something
    final suggestionList = query.isEmpty
        ? recentkeywords
        : keywords
            .where((p) => p.startsWith(query))
            .toList(); //*predict element from start value **Case Sensitive

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.ac_unit),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
                //* แต่งสีตอนที่พิม search keywords
                color: Colors.indigo[600],
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index]
                      .substring(query.length), //*ทำสีตัว suggestion
                  style: TextStyle(color: Colors.grey[400]))
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
