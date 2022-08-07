import 'package:flutter/material.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/auth/register.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';
import 'package:stunting/widgets/button.dart';
import 'package:stunting/widgets/have_account.dart';
import 'package:stunting/widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final password = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Login'.toUpperCase(),
                  style: splashTextStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                Image.asset(
                  'assets/images/login.png',
                  width: 245.43,
                ),
                InputButtonWidget(
                  label: 'Email',
                  controller: emailController,
                  keyboard: TextInputType.emailAddress,
                  obsuretext: false,
                ),
                const SizedBox(
                  height: 5,
                ),
                InputButtonWidget(
                  label: 'Password',
                  controller: passwordController,
                  keyboard: TextInputType.name,
                  obsuretext: password,
                ),
                HaveAccount(
                  ask: 'Belum punya akun? ',
                  fiture: 'Register',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Register();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                  textColor: Colors.white,
                  buttonColor: buttonBlueColor,
                  text: 'Login',
                  press: () async {
                    await AuthServices.signIn(
                            emailController.text, passwordController.text)
                        .then(
                      (value) => Text(
                        'succes',
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
