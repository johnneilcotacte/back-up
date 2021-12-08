import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpForm extends HookWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordVisible = useState(false);
    final _userfirstnamecontroller = useTextEditingController();
    final _userlastnamecontroller = useTextEditingController();
    final _emailcontroller = useTextEditingController();
    final _passwordcontroller = useTextEditingController();
    final _userfnvalidity = useState(true);
    final _userlnvalidity = useState(true);
    final _emailvalidity = useState(true);
    final _passwordvalidity = useState(true);

    bool _checkEmail() {
      bool emailValidity = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailcontroller.text);

      if (emailValidity) {
        //  _emailvalidity.value = true;
        return true;
      }
      return false;
    }

    bool _checkPassword() {
      bool passwordStrength = RegExp(
              r"^(?=(.*[a-z]){3,})(?=(.*[A-Z]){2,})(?=(.*[0-9]){2,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}$")
          .hasMatch(_passwordcontroller.text);
      if (passwordStrength) {
        return true;
      }
      return false;
    }

    _checkCredentials() {
      bool emailstatus = _checkEmail();
      bool passwordstatus = _checkPassword();
      if (emailstatus && passwordstatus) {
        print('good to go');
        Navigator.pop(context);
      } else {
        print(' not good to go');
        if (!emailstatus) {
          _emailvalidity.value = emailstatus;
        } else {
          _passwordvalidity.value = passwordstatus;
        }
      }
    }

    return Container(
      width: 350,
      height: (_emailvalidity.value && _passwordvalidity.value) ? 600 : 650,
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
          _CustomTextField(
            controller: _userfirstnamecontroller,
            obscureText: false,
            hintext: 'First Name',
            validity: _userfnvalidity,
          ),
          // TextField(
          //   controller: _userfirstnamecontroller,
          //   decoration: InputDecoration(
          //     hintText: 'First Name',
          //     filled: true,
          //     fillColor: Colors.blueGrey[50],
          //     labelStyle: TextStyle(fontSize: 12),
          //     contentPadding: EdgeInsets.only(left: 30),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: Colors.blueGrey.shade100),
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          _CustomTextField(
              controller: _userlastnamecontroller,
              obscureText: false,
              hintext: 'Last Name',
              validity: _userlnvalidity),
          // TextField(
          //   controller: _userlastnamecontroller,
          //   decoration: InputDecoration(
          //     hintText: 'Last Name',
          //     filled: true,
          //     fillColor: Colors.blueGrey[50],
          //     labelStyle: TextStyle(fontSize: 12),
          //     contentPadding: EdgeInsets.only(left: 30),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: Colors.blueGrey.shade100),
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),

          // TextField(
          //   controller: _emailcontroller,
          //   decoration: InputDecoration(
          //     hintText: 'Email',
          //     filled: true,
          //     fillColor: Colors.blueGrey[50],
          //     labelStyle: TextStyle(fontSize: 12),
          //     contentPadding: EdgeInsets.only(left: 30),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(
          //           color: (_emailvalidity.value)
          //               ? Colors.blueGrey.shade100
          //               : Colors.red.shade200),
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //   ),
          // ),
          _CustomTextField(
            controller: _emailcontroller,
            validity: _emailvalidity,
            obscureText: false,
            hintext: 'Email',
          ),
          SizedBox(
            height: 20,
          ),
          _CustomTextField(
            controller: _passwordcontroller,
            validity: _passwordvalidity,
            obscureText: true,
            hintext: 'Password',
            iconbutton: IconButton(
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
          ),
          // TextField(
          //   controller: _passwordcontroller,
          //   obscureText: !_passwordVisible.value,
          //   decoration: InputDecoration(
          //     hintText: 'Password',
          //     suffixIcon: IconButton(
          //       icon: Icon(
          //         (!_passwordVisible.value)
          //             ? Icons.visibility_off_outlined
          //             : Icons.visibility,
          //       ),
          //       onPressed: () {
          //         _passwordVisible.value = !_passwordVisible.value;
          //       },
          //       // Icons.visibility_outlined,
          //       color: (!_passwordVisible.value) ? Colors.grey : Colors.blue,
          //     ),
          //     filled: true,
          //     fillColor: Colors.blueGrey[50],
          //     labelStyle: TextStyle(fontSize: 12),
          //     contentPadding: EdgeInsets.only(left: 30),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(
          //           color: (_emailvalidity.value)
          //               ? Colors.blueGrey.shade100
          //               : Colors.red.shade200),
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              children: [
                if (!_emailvalidity.value)
                  Text(
                    'Invalid Email',
                    style: TextStyle(color: Colors.red, fontSize: 9),
                  ),
                if (!_passwordvalidity.value)
                  FittedBox(
                    child: Column(
                      children: [
                        Text(
                          'Password must have atleast',
                          style: TextStyle(color: Colors.red, fontSize: 9),
                        ),
                        Text(
                          '* 8 characters length',
                          style: TextStyle(color: Colors.red, fontSize: 9),
                        ),
                        Text(
                          '* 2 letters in Upper Case',
                          style: TextStyle(color: Colors.red, fontSize: 9),
                        ),
                        Text(
                          '* 1 Special Character',
                          style: TextStyle(color: Colors.red, fontSize: 9),
                        ),
                        Text(
                          '* 2 numerals',
                          style: TextStyle(color: Colors.red, fontSize: 9),
                        ),
                        Text(
                          '* 3 letters in Lower Case',
                          style: TextStyle(color: Colors.red, fontSize: 9),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
          SizedBox(
            height: 25,
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
                    'Log In',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class _CustomTextField extends HookWidget {
  final TextEditingController controller;
  final ValueNotifier<bool>? validity;
  final IconButton? iconbutton;
  final bool obscureText;
  final String hintext;
  _CustomTextField({
    required this.controller,
    required this.validity,
    this.iconbutton,
    required this.obscureText,
    required this.hintext,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: iconbutton,
        hintText: hintext,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: TextStyle(fontSize: 12),
        contentPadding: EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (validity!.value)
                  ? Colors.blueGrey.shade100
                  : Colors.red.shade200),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
