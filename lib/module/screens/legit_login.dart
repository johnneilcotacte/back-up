import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/provider/loginpage_provider.dart';
import 'package:flutter_miniproject/responsive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    Timer _everysecond;
    List<String> _backgroundasset = [
      'assets/images/login_header.jpg',
      'assets/images/login_header2.jpg',
      'assets/images/login_header3.jpg'
    ];
    // List<BoxDecoration> _backgroundasset = [
    //   BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/login_header.jpg'),
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    //   BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/lechon.jpg'),
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    //   BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/hotdog.png'),
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    // ];
    final _background = useState(0);
    useEffect(
      () {
        _everysecond = Timer.periodic(Duration(seconds: 7), (Timer t) {
          if (_background.value == 2) {
            _background.value = 0;
          } else {
            _background.value++;
          }
        });
        return _everysecond.cancel;
      },
      [],
    );
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 801,
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      //decoration: _backgroundasset[_background.value],
                      width: _width,
                      height: 600,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset('assets/images/login_header.jpg'),
                        // child: Image.asset(_backgroundasset[_background.value]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 600.01,
                    //top: 0,
                    child: Container(
                      height: 200,
                      width: _width,
                      color: Colors.transparent,
                    ),
                  ),
                  Positioned(
                    top: 300,
                    //top: 0,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (Responsive.isDesktop(context))
                            Container(
                              child: SubtitleCard(),
                            ),
                          SizedBox(
                            width: 20,
                          ),
                          LoginForm(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
            ),
            if (!Responsive.isDesktop(context))
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: SubtitleCard(),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            FilipinoRecipe(),
            SizedBox(
              height: 500,
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends HookWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _passwordVisible = useProvider(loginProvider);
    final _formKey = GlobalKey<FormState>();
    final _passwordVisible = useState(false);
    return Container(
      width: 350,
      height: 500,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Sign In',
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            //controller: _passwordVisible.emailcontroller,
            decoration: InputDecoration(
              hintText: 'Enter email',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: _passwordVisible.password,
            obscureText: !_passwordVisible.value,
            decoration: InputDecoration(
              hintText: 'Password',
              counterText: 'Forgot password?',
              suffixIcon: IconButton(
                icon: Icon(
                  (!_passwordVisible.value)
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                ),
                onPressed: () {
                  _passwordVisible.value = !_passwordVisible.value;
                },
                // Icons.visibility_outlined,
                color: (!_passwordVisible.value) ? Colors.grey : Colors.blue,
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [],
          ),
          SizedBox(
            height: 25,
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: Size.zero, // <-- Add this
          //     padding: EdgeInsets.zero, // <-- and this
          //   ),
          //   onPressed: () {
          //     print('ok');
          //   },
          //   child: Container(
          //     color: Colors.purple,
          //     width: double.infinity,
          //     height: 36,
          //     child: Center(
          //       child: Text(
          //         'Log In',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.shade100,
                  spreadRadius: 10,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Sign In"))),
              onPressed: () => print("it's pressed"),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not Registered Yet?'),
              TextButton(
                  onPressed: () {
                    print('ok');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: Stack(
                            //  overflow: Overflow.visible,
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              SignUpForm(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class SignUpForm extends HookWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _passwordVisible = useProvider(loginProvider);
    final _formKey = GlobalKey<FormState>();
    final _passwordVisible = useState(false);
    return Container(
      width: 350,
      height: 500,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            //controller: _passwordVisible.emailcontroller,
            decoration: InputDecoration(
              hintText: 'Name',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            //controller: _passwordVisible.emailcontroller,
            decoration: InputDecoration(
              hintText: 'Email',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            // controller: _passwordVisible.password,
            obscureText: !_passwordVisible.value,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  (!_passwordVisible.value)
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                ),
                onPressed: () {
                  _passwordVisible.value = !_passwordVisible.value;
                },
                // Icons.visibility_outlined,
                color: (!_passwordVisible.value) ? Colors.grey : Colors.blue,
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [],
          ),
          SizedBox(
            height: 25,
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: Size.zero, // <-- Add this
          //     padding: EdgeInsets.zero, // <-- and this
          //   ),
          //   onPressed: () {
          //     print('ok');
          //   },
          //   child: Container(
          //     color: Colors.purple,
          //     width: double.infinity,
          //     height: 36,
          //     child: Center(
          //       child: Text(
          //         'Log In',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.shade100,
                  spreadRadius: 10,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Create Account"))),
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('All Ready Have An Account?'),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class SubtitleCard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Responsive.isMobile(context)) ? 332 : 500,
      height: (Responsive.isDesktop(context)) ? 500 : null,
      color: Colors.transparent,
      child: Column(
        children: [
          Text(
            'Ultimate Guide For Your Meal Everday.',
            style: TextStyle(
                color: (Responsive.isDesktop(context))
                    ? Colors.white
                    : Colors.black,
                fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          if (Responsive.isDesktop(context))
            Row(
              children: [
                SubtitlePictureCard(),
                SizedBox(
                  width: 4,
                ),
                SubtitlePictureCard(),
                SizedBox(
                  width: 4,
                ),
                SubtitlePictureCard(),
              ],
            ),
          if (Responsive.isDesktop(context))
            SizedBox(
              height: 10,
            ),
          if (Responsive.isDesktop(context))
            Row(
              children: [
                SubtitlePictureCard(),
                SizedBox(
                  width: 4,
                ),
                SubtitlePictureCard(),
                SizedBox(
                  width: 4,
                ),
                SubtitlePictureCard(),
              ],
            ),
          if (!Responsive.isDesktop(context))
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                SubtitlePictureCard(),
                SubtitlePictureCard(),
                SubtitlePictureCard(),
                SubtitlePictureCard(),
                SubtitlePictureCard(),
                SubtitlePictureCard(),
              ],
            )
        ],
      ),
    );
  }
}

class SubtitlePictureCard extends HookWidget {
  SubtitlePictureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      width: 164,
      child: Column(
        children: [
          Container(
            height: 140,
            color: Colors.red,
          ),
          Container(
            height: 20,
            color: Colors.blue,
          ),
          Container(
            height: 4,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}

class FilipinoRecipe extends HookWidget {
  FilipinoRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        width: 850,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FILIPINO RECIPE',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: [
                FilipinoRecipeCard(
                  name: 'Vegan Filipino Scrambled Egg',
                  image: 'assets/images/f1.jpg',
                  subtitle:
                      'Learn how to make these easy Filipino scrambled eggs!',
                ),
                FilipinoRecipeCard(
                  name: 'Tuyo, Tocino, Salted Egg, and Tomato',
                  image: 'assets/images/f2.jpg',
                  subtitle: 'This kept my tummy full for half a day!',
                ),
                FilipinoRecipeCard(
                  name: 'Crispy Kare-Kare',
                  image: 'assets/images/f3.jpg',
                  subtitle:
                      'Crispy and Juicy Meat of Lechon Kawali and the delicious nutty sauce of kare-kare. WoW-lap!',
                ),
                FilipinoRecipeCard(
                  image: 'assets/images/f4.jpg',
                  name: 'Adobo Loco Moco',
                  subtitle:
                      'This Adobo Loco Moco marries the rice plate with the classic Filipino Chicken Adobo.',
                ),
                FilipinoRecipeCard(
                  image: 'assets/images/f5.jpg',
                  name: 'Lumpia Shanghai ',
                  subtitle:
                      'Lumpia Shanghai is a perfect appetizer and finger food for parties!',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
