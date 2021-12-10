import 'package:firstapp/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShopRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'REGISTER',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 30.0,
            ),
            defaultFormField(
                controller: nameController,
                type: TextInputType.name,
                labelText: 'Name',
                prefix: Icons.ac_unit),
            SizedBox(
              height: 15.0,
            ),
            defaultFormField(
                controller: phoneController,
                type: TextInputType.phone,
                labelText: 'Phone',
                prefix: Icons.phone),
            SizedBox(
              height: 15.0,
            ),
            defaultFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              labelText: 'Email',
              prefix: Icons.email_outlined,
            ),
            SizedBox(
              height: 15.0,
            ),
            defaultFormField(
              controller: passwordController,
              type: TextInputType.visiblePassword,
              labelText: 'Password',
              prefix: Icons.lock,
              suffix: Icons.remove_red_eye,
            ),
          ],
        ),
      ),
    );
  }
}
