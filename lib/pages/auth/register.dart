import 'package:flutter/material.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/auth/login.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';
import 'package:stunting/widgets/button.dart';
import 'package:stunting/widgets/have_account.dart';
import 'package:stunting/widgets/text_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final password = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController namaController = TextEditingController();
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
                  'Register'.toUpperCase(),
                  style: splashTextStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                Image.asset(
                  'assets/images/register.png',
                  width: 155.43,
                ),
                InputButtonWidget(
                  label: 'Nama',
                  controller: namaController,
                  keyboard: TextInputType.name,
                  obsuretext: false,
                ),
                const SizedBox(
                  height: 5,
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
                  ask: 'Sudah punya akun? ',
                  fiture: 'Login',
                  press: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (contex) => const Login(),
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
                  text: 'Register',
                  press: () async {
                    await AuthServices.signUp(
                      emailController.text,
                      passwordController.text,
                      namaController.text,
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
