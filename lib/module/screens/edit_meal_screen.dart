// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter_miniproject/model/ingredient.dart';
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

// class EditMealPage extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
//     String _initialname = '';
//     Uint8List? byte_image;
//     String? network_image = '';
//     Uuid uuid = Uuid();
//     String _initialIn1 = '';
//     String _initialIn2 = '';
//     if (args.meal != null) {
//       _initialname = args.meal!.name!;
//       network_image = args.meal!.image;
//     }
//     final _byteimage = useState<Uint8List?>(byte_image);
//     final _networkimage = useState<String?>(network_image);
//     final _namecontroller = useTextEditingController(text: _initialname);

//     final _in1controller = useTextEditingController(text: _initialIn1);
//     final _in2controller = useTextEditingController(text: _initialIn2);

//     final _mealProvider = useProvider(mealProvider);
//     final constants = useProvider(constantsProvider);
//     final double _height = MediaQuery.of(context).size.height;
//     bool _checkImageByte(Uint8List? imagebyte) {
//       if (imagebyte != null) {
//         return true;
//       } else {
//         return false;
//       }
//     }

//     _createMealObject() {
//       bool hasimagebyte = _checkImageByte(_byteimage.value);
//       if (hasimagebyte) {
//         final meal = Meal(
//             id: uuid.v1(),
//             name: _namecontroller.text,
//             image: '',
//             ingredients: [
//               _in1controller.text,
//               _in2controller.text,
//             ]);
//         bool status = MealPostChecker.isComplete(meal);
//         if (status) {
//           _mealProvider.addMeal(newmeal: meal);
//           _namecontroller.clear();
//           _byteimage.value = null;
//           _in2controller.clear;
//           _in1controller.clear;
//           showConfirmationDialog(
//               context, 'Your meal is successfully uploaded.');
//         } else {
//           showInvalidDialog(context);
//         }
//       }
//       {
//           showInvalidDialog(context);
//       }
//     }

//     _updateMealObject() {

//       final meal = Meal(
//           id: args.meal!.id,
//           name: _namecontroller.text,
//           image: _image.value,
//           ingredients: [_in1controller.text, _in2controller.text]);

//       bool status = MealPostChecker.isComplete(meal);
//       if (status) {
//         _mealProvider.updateMeal(
//             updatedMeal: Meal(
//                 id: args.meal!.id,
//                 name: _namecontroller.text,
//                 image: _image.value,
//                 ingredients: [
//               _in1controller.text,
//               _in2controller.text,
//             ]));
//         _namecontroller.clear();
//         _image.value = null;
//         _in1controller.clear();
//         _in2controller.clear();
//         showConfirmationDialog(context, 'Your meal is successfully updated.');
//       } else {
//         showInvalidDialog(context);
//       }
//     }

//     //Sauce: https://github.com/miguelpruivo/flutter_file_picker/wiki/API#-getdirectorypath
//     Future _pickImage() async {
//       //use filepicker rather than ImagePickerWeb. Lang kwenta yung ayaw magsupport ng sdk 2.12.0
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.custom, allowedExtensions: ['png', 'jpeg', 'jpg']);

//       if (result != null) {
//         _image.value = result.files.first.bytes;
//       }
//     }

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
//                       image:
//                           DecorationImage(image: NetworkImage(_image.value!)),
//                       color: Colors.grey.shade200,
//                     ),
//                     // child: (_image.value != null)
//                     //     ? FittedBox(
//                     //         fit: BoxFit.cover,
//                     //         child: Image.network(_image.value!),
//                     //       )
//                     //     : IconButton(
//                     //         onPressed: () {},
//                     //         icon: FaIcon(
//                     //           FontAwesomeIcons.image,
//                     //           size: _height * .08,
//                     //           color: Colors.red,
//                     //         ),
//                     //       ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(constants.kDefaultPadding),
//               child: Column(children: [
//                 CustomTextField(
//                   controller: _namecontroller,
//                   fontsize: Responsive.isDesktop(context) ? 32 : 24,
//                   labelText: 'Title',
//                   fontweight: FontWeight.w600,
//                   height: 1.3,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   controller: _in1controller,
//                   fontsize: Responsive.isDesktop(context) ? 32 : 24,
//                   labelText: 'Ingredient1',
//                   fontweight: FontWeight.w600,
//                   height: 1.3,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   controller: _in2controller,
//                   fontsize: Responsive.isDesktop(context) ? 32 : 24,
//                   labelText: 'Ingredient2',
//                   fontweight: FontWeight.w600,
//                   height: 1.3,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     width: (Responsive.isDesktop(context)) ? 150 : 70,
//                     height: (Responsive.isDesktop(context)) ? 50 : 40,
//                     child: ElevatedButton(
//                       onPressed: (args.meal != null)
//                           ? _updateMealObject
//                           : _createMealObject,
//                       child: (args.meal != null)
//                           ? Text(
//                               'Update',
//                               style: TextStyle(
//                                 fontSize:
//                                     (Responsive.isDesktop(context)) ? 35 : 15,
//                               ),
//                             )
//                           : Text(
//                               'Add',
//                               style: TextStyle(
//                                 fontSize:
//                                     (Responsive.isDesktop(context)) ? 35 : 15,
//                               ),
//                             ),
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
