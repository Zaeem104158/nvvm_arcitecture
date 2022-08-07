import 'package:flutter/material.dart';
import 'package:practice_mvvm/resourse/component/custom_round_button.dart';
import 'package:practice_mvvm/utilits/routes/routes_name.dart';
import 'package:practice_mvvm/utilits/utilits.dart';
import 'package:practice_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
            title: const Text("SignUp Screen")),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  Utilits.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: '*',
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_clock_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: _obsecurePassword.value == true
                                ? const Icon(Icons.visibility_off_rounded)
                                : const Icon(Icons.visibility_rounded)),
                      ),
                    );
                  }),
              SizedBox(
                height: height * 0.050,
              ),
              CustomRoundButton(
                loading: authViewModel.signUploading,
                title: 'Sign Up',
                onPressed: () {
                  if (_emailController.text.isEmpty) {
                    Utilits.snackBarMessage(
                        'Please enter your email.', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utilits.snackBarMessage(
                        'Please enter your password.', context);
                  } else if (_passwordController.text.length <= 6) {
                    Utilits.snackBarMessage(
                        'Password must be 6 digit.', context);
                  } else {
                    Map saveddata = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };

                    authViewModel.signUpApi(saveddata, context);
                    print("post api hit");
                  }
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text("Already have an account? Click here")),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
