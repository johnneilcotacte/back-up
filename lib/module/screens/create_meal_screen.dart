// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter_miniproject/module/edit_meal_screen_components/recipe_input.dart';
// import 'package:flutter_miniproject/module/edit_meal_screen_components/recipe_item.dart';
// import 'package:flutter_miniproject/provider/recipe_provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_miniproject/model/meal.dart';
// import 'package:flutter_miniproject/model/screen_argument.dart';
// import 'package:flutter_miniproject/module/edit_meal_screen_components/mealpost_inputs_checker.dart';
// import 'package:flutter_miniproject/module/edit_meal_screen_components/customtextfield.dart';
// import 'package:flutter_miniproject/module/edit_meal_screen_components/invalid_dialog.dart';
// import 'package:flutter_miniproject/module/edit_meal_screen_components/post_delete_dialog.dart';
// import 'package:flutter_miniproject/responsive.dart';
// import 'package:flutter_miniproject/provider/meal_provider.dart';
// import 'package:flutter_miniproject/provider/const_provider.dart';
// import 'package:uuid/uuid.dart';
// import 'package:intl/intl.dart';

// class CreateMealPage extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
//     String _initialname = '';
//     String? _initialimage;
//     Uuid uuid = Uuid();

//     final _image = useState<String?>(_initialimage);
//     final _namecontroller = useTextEditingController(text: _initialname);

//     final _recipeProvider = useProvider(recipeProvider);
//     final _recipeTextController = useTextEditingController();

//     final _mealProvider = useProvider(mealProvider);

//     final constants = useProvider(constantsProvider);
//     final double _height = MediaQuery.of(context).size.height;

//     _createMealObject() {
//       final now = new DateTime.now();
//       String formatter = DateFormat.yMMMMd('en_US').format(now);

//       final meal = Meal(
//           id: uuid.v1(),
//           name: _namecontroller.text,
//           image: _image.value,
//           ingredients: _recipeProvider.ingredients);
//       bool status = MealPostChecker.isComplete(meal);
//       if (status) {
//         _recipeProvider.deletePrevList();
//         _mealProvider.addMeal(newmeal: meal);
//         _namecontroller.clear();
//         _image.value = null;
//         _recipeTextController.clear();
//         showConfirmationDialog(context, 'Your meal is successfully uploaded.');
//       } else {
//         showInvalidDialog(context);
//       }
//     }

// /*
//     //Sauce: https://github.com/miguelpruivo/flutter_file_picker/wiki/API#-getdirectorypath
//     Future _pickImage() async {
//       //use filepicker rather than ImagePickerWeb. Lang kwenta yung ayaw magsupport ng sdk 2.12.0
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.custom, allowedExtensions: ['png', 'jpeg', 'jpg']);

//       if (result != null) {
//         _image.value = result.files.first.bytes;
//       }
//     }
// */

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         elevation: 0,
//       ),
//       body: Container(
//         padding: EdgeInsets.fromLTRB(
//             constants.kDefaultPadding * 2.5,
//             constants.kDefaultPadding,
//             constants.kDefaultPadding * 2.5,
//             constants.kDefaultPadding),
//         decoration: BoxDecoration(
//           color: Colors.white,
//         ),
//         child: ListView(
//           children: [
//             if (args.meal == null)
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Text(
//                   'ADD A MEAL',
//                   style: GoogleFonts.dancingScript(
//                       color: Colors.black,
//                       fontSize: (Responsive.isDesktop(context))
//                           ? 48
//                           : (Responsive.isTablet(context))
//                               ? 38
//                               : 30),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             //TODO: should i remove this box, or need ba to pag naupload na yung pic kasi di na null?
//             if (_image.value != null)
//               Container(
//                 width: double.infinity,
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: IconButton(
//                       icon: FaIcon(
//                         FontAwesomeIcons.windowClose,
//                         size: _height * .03,
//                         color: Colors.black,
//                       ),
//                       onPressed: () {
//                         _image.value = null;
//                       }),
//                 ),
//               ),
//             Padding(
//               padding: EdgeInsets.all(constants.kDefaultPadding - 10),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(17.0),
//                 child: AspectRatio(
//                   aspectRatio: 1.3,
//                   child: Container(
//                     width: double.infinity,
//                     //height: _height * .7,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                     ),
//                     //TODO: should i remove this box, or need ba to pag naupload na yung pic kasi di na null?
//                     child: (_image.value != null)
//                         ? FittedBox(
//                             fit: BoxFit.cover,
//                             child: Image.network(_image.value!),
//                           )
//                         : IconButton(
//                             onPressed: () {},
//                             icon: FaIcon(
//                               FontAwesomeIcons.image,
//                               size: _height * .08,
//                               color: Colors.red,
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(constants.kDefaultPadding),
//               child: CustomTextField(
//                 controller: _namecontroller,
//                 fontsize: Responsive.isDesktop(context) ? 32 : 24,
//                 labelText: 'Meal Title',
//                 fontweight: FontWeight.w600,
//                 height: 1.3,
//               ),
//             ),
//             Expanded(
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     RecipeInput(
//                       textController: _recipeTextController,
//                     ),
//                     FloatingActionButton(
//                       onPressed: () {
//                         _recipeProvider.addIngredient(
//                             body: _recipeTextController.text);
//                         _recipeTextController.clear();
//                       },
//                       child: Icon(Icons.add),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   itemBuilder: (context, i) {
//                     final recipe = _recipeProvider.ingredients[i];
//                     return RecipeListItem(
//                       ingredient: recipe,
//                     );
//                   },
//                   itemCount: _recipeProvider.ingredients.length,
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 width: (Responsive.isDesktop(context)) ? 150 : 70,
//                 height: (Responsive.isDesktop(context)) ? 50 : 40,
//                 child: ElevatedButton(
//                   onPressed: _createMealObject,
//                   child: Text('Add',
//                       style: TextStyle(
//                         fontSize: (Responsive.isDesktop(context)) ? 35 : 15,
//                       )),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
