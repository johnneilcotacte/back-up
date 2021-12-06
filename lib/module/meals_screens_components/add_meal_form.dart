import 'package:flutter/material.dart';

class AddMealForm extends StatelessWidget {
  const AddMealForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          createTitle(),
          SizedBox(height: 8),
          createSubtitle(),
          SizedBox(height: 8),
          buildButton(),
        ],
      ),
    );
  }

  Widget createTitle() => TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Name',
        ),
      );
  Widget createSubtitle() => TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Recipe',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () {},
          child: Text('Save'),
        ),
      );
}
