import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/config/route.dart';
import 'package:flutter_miniproject/module/authentication_screen_components/signup_form.dart';
import 'package:flutter_miniproject/module/screens/authentication_screen.dart';
import 'package:flutter_miniproject/provider/userauth_api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends HookWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _passwordVisible = useProvider(loginProvider);

    final _passwordVisible = useState(false);
    final _login = useProvider(authAPIProvider);
    final _emailcontroller = useTextEditingController();
    final _passwordcontroller = useTextEditingController();
    _checkCredentials() async {
      bool status = await _login.auth.logInUser(
          email: _emailcontroller.text, password: _passwordcontroller.text);
      if (status) {
        //https://stackoverflow.com/questions/65683630/how-to-get-back-to-app-home-page-after-successful-login-in-flutter
        Navigator.pushNamedAndRemoveUntil(
            context, RouteGenerator.homeRoute, (Route<dynamic> route) => false);
      } else {
        print('Account not found!');
      }
    }

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
            controller: _emailcontroller,
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
            controller: _passwordcontroller,
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
              onPressed: _checkCredentials,
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
