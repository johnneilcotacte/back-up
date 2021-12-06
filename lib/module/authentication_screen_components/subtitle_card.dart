import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/module/authentication_screen_components/subtitle_item_card.dart';
import 'package:flutter_miniproject/responsive.dart';

class SubtitleCard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Timer _everysecond;
    List<String> _subtitleassets = [
      'Ultimate Guide For Your Meal Everday.',
      "Don't Know What To Cook? We Made It Easy For You!",
      'No Worries! Enjoy Your Meal Everday.'
    ];
    final _textindex = useState(0);
    useEffect(
      () {
        _everysecond = Timer.periodic(Duration(seconds: 7), (Timer t) {
          if (_textindex.value == 2) {
            _textindex.value = 0;
          } else {
            _textindex.value++;
          }
        });
        return _everysecond.cancel;
      },
      [],
    );
    return Container(
      width: (Responsive.isMobile(context)) ? 332 : 500,
      height: (Responsive.isDesktop(context)) ? 500 : null,
      color: Colors.transparent,
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
            child: Text(
              //'Ultimate Guide For Your Meal Everday.',
              _subtitleassets[_textindex.value],
            ),
            style: TextStyle(
                color: (Responsive.isDesktop(context))
                    ? Colors.white
                    : Colors.black,
                fontSize: 30),
            duration: Duration(seconds: 1),
          ),
          SizedBox(
            height: 20,
          ),
          if (Responsive.isDesktop(context))
            Row(
              children: [
                SubtitleItemCard(
                  image: 'assets/images/STCARD1.jpg',
                  title: 'Add you favorite meal.',
                ),
                SizedBox(
                  width: 4,
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD2.png',
                  title: 'Randomize your food everday.',
                ),
                SizedBox(
                  width: 4,
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD3.jpg',
                  title: 'Want to eat outside?',
                ),
              ],
            ),
          if (Responsive.isDesktop(context))
            SizedBox(
              height: 10,
            ),
          if (Responsive.isDesktop(context))
            Row(
              children: [
                SubtitleItemCard(
                  image: 'assets/images/STCARD4.jpg',
                  title: 'Check your calorie intake!',
                ),
                SizedBox(
                  width: 4,
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD5.jpg',
                  title: 'A guide to your diet',
                ),
                SizedBox(
                  width: 4,
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD6.jpg',
                  title: 'Remember all ingredients of your favorite food.',
                ),
              ],
            ),
          if (!Responsive.isDesktop(context))
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                SubtitleItemCard(
                  image: 'assets/images/STCARD1.jpg',
                  title: 'Add you favorite meal.',
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD2.png',
                  title: 'Randomize your food everday.',
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD3.jpg',
                  title: 'Want to eat outside?',
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD4.jpg',
                  title: 'Check your calorie intake!',
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD5.jpg',
                  title: 'A guide to your diet',
                ),
                SubtitleItemCard(
                  image: 'assets/images/STCARD6.jpg',
                  title: 'Remember all ingredients of your favorite food.',
                ),
              ],
            )
        ],
      ),
    );
  }
}
