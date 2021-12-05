import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Logins extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        // padding: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width / 8),
        children: [
          Menu(),
          // Padding(padding: EdgeInsets.only(bottom: 100), child: Body()),
          //Body(),
        ],
      ),
    );
  }
}

class Menu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8, vertical: 30),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _MenuItem(title: 'Home'),
              _MenuItem(title: 'About us'),
              _MenuItem(title: 'Contact us'),
              _MenuItem(title: 'Help'),
            ],
          ),
          Row(
            children: [
              _MenuItem(title: 'Sign In', isActive: true),
              _RegisterButton()
            ],
          ),
        ],
      ),
    );
    ;
  }
}

class _MenuItem extends HookWidget {
  final String title;
  final bool isActive;
  _MenuItem({Key? key, required this.title, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.deepPurple : Colors.grey,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
    ;
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFEEEEEE),
            spreadRadius: 10,
            blurRadius: 12,
          ),
        ],
      ),
      child: Text(
        'Register',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
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
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/lechon.jpg',
                    ),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(1), BlendMode.dstATop),
                    fit: BoxFit.cover),
              ),
              width: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    'Sign In to \nMy Application',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "If you don't have an account",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "You can",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          print(MediaQuery.of(context).size.width);
                        },
                        child: Text(
                          "Register here!",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
          Padding(
            // padding: EdgeInsets.symmetric(
            //  vertical: MediaQuery.of(context).size.height / 6),
            padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height / 6,
                20,
                MediaQuery.of(context).size.height / 6),
            child: Container(
              width: 320,
              child: _LoginForm(),
            ),
          )
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter email or Phone number',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blueGrey[50]),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.blueGrey[50]),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            counterText: 'Forgot password?',
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              //  borderSide: BorderSide(color: Colors.blueGrey[50]),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blueGrey[50]),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                //   color: Colors.deepPurple[100],
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
        SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Or continue with"),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // _loginWithButton(image: ''),
            // _loginWithButton(image: '', isActive: true),
            // _loginWithButton(image: ''),
          ],
        ),
      ],
    );
  }
}
