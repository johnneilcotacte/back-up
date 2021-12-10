import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/config/route.dart';
import 'package:flutter_miniproject/model/screen_argument.dart';

class RecipePage extends HookWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Text(args.meal!.name!),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '${RouteGenerator.editmealRoute}',
                  arguments: ScreenArguments(args.meal));

              /*
                  showDialog(
                    context: context,
                    builder: (context) => const AddMealWidget(),
                  );
                  */
            },
            //color: Colors.blue
          ),
        ],
      ),
    );
  }
}
