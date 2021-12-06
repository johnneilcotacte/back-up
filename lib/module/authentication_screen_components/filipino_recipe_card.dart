import 'package:flutter/material.dart';

class FilipinoRecipeCard extends StatelessWidget {
  final String name;
  final String image;
  final String subtitle;
  FilipinoRecipeCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 165,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 150,
            //color: Colors.red,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(image),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 30,
            // color: Colors.green,
            child: Text(
              name,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            //     height: 20,
            //color: Colors.green.shade100,
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
