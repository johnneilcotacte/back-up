import 'package:flutter/material.dart';
import 'package:flutter_miniproject/module/meals_screens_components/add_meal_form.dart';

class AddMealWidget extends StatefulWidget {
  const AddMealWidget({Key? key}) : super(key: key);

  @override
  _ShareStoryWidgetState createState() => _ShareStoryWidgetState();
}

class _ShareStoryWidgetState extends State<AddMealWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Meal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              AddMealForm(),
            ],
          ),
        ),
      );
}
