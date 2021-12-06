import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SubtitleItemCard extends HookWidget {
  final String image;
  final String title;
  SubtitleItemCard({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184,
      width: 164,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 164,
            child: FittedBox(
              child: Image.asset(image),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 41,
            width: 164,
            color: Colors.white,
            child: Text(
              title,
              style: TextStyle(fontSize: 10),
            ),
          ),
          Container(
            height: 3,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
