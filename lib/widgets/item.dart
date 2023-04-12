import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  late String url;
  late String label;

  Item({required this.url, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 100,
          width: 100,
          color: Colors.grey.shade200,
          child: Image.network(
            url,
          ),
        ),
        Text(label)
      ],
    ));
  }
}
