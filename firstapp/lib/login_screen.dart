import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
              TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  // onChanged: (String value) {
                  //   print(value);
                  // },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                    border: OutlineInputBorder(),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
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
    );
  }
}
