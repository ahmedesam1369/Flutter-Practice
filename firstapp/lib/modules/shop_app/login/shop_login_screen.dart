import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/layout/shop_layout/shop_layout.dart';
import 'package:firstapp/modules/shop_app/login/cubit/cubit.dart';
import 'package:firstapp/modules/shop_app/login/cubit/states.dart';
import 'package:firstapp/modules/shop_app/register/shop_register_screen.dart';
import 'package:firstapp/shared/component/components.dart';
import 'package:firstapp/shared/component/constants.dart';
import 'package:firstapp/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              );
              navigateAndFinish(
                context,
                ShopLayout(),
              );
              showToast(
                text: state.loginModel.message,
                state: ToastStates.SUCCESS,
              );
            } else {
              showToast(
                  text: state.loginModel.message, state: ToastStates.ERROR);
              print(state.loginModel.message);
            }
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        labelText: 'Email Address',
                        prefix: Icons.email_outlined,
                        // Show Message for validate
                        showMessage: 'Please enter email address',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        labelText: 'Password',
                        prefix: Icons.lock_outline,
                        suffix: ShopLoginCubit.get(context).suffix,
                        showMessage: 'Password is too short',
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        ispassword: ShopLoginCubit.get(context).isPassword,
                        // suffix pressed
                        onPressed: () {
                          ShopLoginCubit.get(context)
                              .changePasswordvisibility();
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                            ;
                          },
                          text: 'Login',
                          isUpperCse: true,
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          defaultTextButton(
                            function: () {
                              navigateTo(context, ShopRegisterScreen());
                            },
                            text: 'Register',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
