import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_text_field.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = 'auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              //Radio button sign up

              ListTile(
                tileColor: _auth == Auth.signUp
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signUp,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),

              if (_auth == Auth.signUp)
                Form(
                  key: _signUpFormKey,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: "Name",
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: "Sign Up",
                            onTap: () {
                              debugPrint("");
                            }),
                      ],
                    ),
                  ),
                ),

              //Radio button sign in
              ListTile(
                title: const Text(
                  "Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signIn,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signIn)
                Form(
                  key: _signUpFormKey,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // CustomTextField(
                        //   controller: _nameController,
                        //   hintText: "Name",
                        //   textInputType: TextInputType.name,
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: "Sign In",
                            onTap: () {
                              debugPrint("Login");
                            }),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
