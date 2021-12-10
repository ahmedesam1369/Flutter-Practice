import 'package:firstapp/shared/component/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool eyeOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  // onChanged: (String value) {
                  //   print(value);
                  // },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email address must not be Empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // hintText: 'Email Address',
                    labelText: 'Email Address',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // ****************
                defaultFormField(
                  labelText: 'Password',
                  controller: passwordController,
                  prefix: Icons.lock,
                  type: TextInputType.visiblePassword,
                  showMessage: 'Password must nor be EMpty',
                  suffix: eyeOn ? Icons.visibility_off : Icons.visibility,
                  ispassword: eyeOn,
                  onPressed: () {
                    setState(() {
                      eyeOn = !(eyeOn);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                  text: 'login',
                  background: Colors.green,
                  function: () {
                    if (formkey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an Account ?'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register Now',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
