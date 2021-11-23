import 'package:flutter/material.dart';
import 'package:team_app/around_you.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D'];
    final List<String> price = <String>['50', '20', '30', '40'];
    final List<String> pname = <String>['Apple', 'Banana', 'Carrot', 'Orannge'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(title: Text('Favorite'), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationPage(),
                ),
              );
            },
            icon: Icon(Icons.map)),
        IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
      ]),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ProductTile(
            item: ProductItem(
              name: 'Deal ${entries[index]}',
              pname: '${pname[index]}',
              price: '${price[index]}',
              colorShade: colorCodes[index % 3],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class ProductItem {
  final String name;
  final String pname;
  final String price;
  final int colorShade;

  const ProductItem(
      {Key? key,
      required this.name,
      required this.price,
      required this.pname,
      required this.colorShade});
}

class ProductTile extends StatelessWidget {
  final ProductItem item;

  const ProductTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DealDetail(item: item),
          ),
        );
      },
      child: Container(
        height: 100,
        color: Colors.amber[item.colorShade],
        child: Center(
          child: Text('${item.name}'),
        ),
      ),
    );
  }
}

class DealDetail extends StatelessWidget {
  final ProductItem item;

  const DealDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deal Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${item.name}: Product ${item.pname}'),
          Text('Price: ${item.price}'),
        ],
      ),
    );
  }
}
