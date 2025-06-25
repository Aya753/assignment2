import 'package:assignment2/core/app_images.dart';
import 'package:assignment2/core/routes.dart';
import 'package:assignment2/sign.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
bool rememberMe = false;

class _LoginState extends State<Login> {
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: Image.asset(
                AppImages.background,
                fit: BoxFit.fill,
                color: Colors.green.withOpacity(0.5),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned(
              top: 30,

              child: Text(
                "Foodtek",
                style: TextStyle(
                  fontFamily: "spicy rice",
                  fontSize: 50,
                  color: Color.fromRGBO(255, 255, 255, 50),
                ),
              ),
            ),

            Positioned(
              bottom: 80,
              child: Container(
                width: 320,
                height: 590,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "spicy rice",
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(fontSize: 10),
                          ),

                          TextSpan(
                            text: " sign up ",
                            style: TextStyle(color: Colors.green, fontSize: 10),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => sign()),
                                    );
                                  },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    Form(
                      key: formkey2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            //Email
                            LabelT(Label: "Email"),

                            custemfeild(
                              keyboardTypeC: TextInputType.emailAddress,
                              validatorC: (value) {
                                if ((value ?? '').isEmpty)
                                  return 'Enter your email';
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            //Password
                            LabelT(Label: "Password"),
                            custemfeild(
                              keyboardTypeC: TextInputType.visiblePassword,

                              obscureText: _isSecurePassword,
                              Suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isSecurePassword = !_isSecurePassword;
                                  });
                                },
                                icon:
                                    _isSecurePassword
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                              ),

                              validatorC: (value) {
                                if ((value ?? '').isEmpty || value!.length < 5)
                                  return 'Please enter password ';
                                return null;
                              },
                            ),

                            SizedBox(height: 30),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //TODO CHECK BOX
                                Checkbox.adaptive(
                                  checkColor: Colors.black,
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {});
                                    rememberMe = value ?? false;
                                    print(value);
                                  },
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(fontSize: 12),
                                ),

                                SizedBox(width: 40),

                                Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            //TextFormField(),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    //TODO ELEVATED Button
                    EleButton(
                      Label: "LogIn",
                      onPressedC: () {
                        if (formkey2.currentState!.validate()) {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRouts.home);

                          formkey.currentState?.save();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
