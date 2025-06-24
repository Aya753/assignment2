import 'package:assignment2/core/app_images.dart';
import 'package:assignment2/core/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _signState extends State<sign> {
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

            SizedBox(height: 10),

            Positioned(
              top: 100,
              child: Container(
                width: 320,
                margin: EdgeInsets.only(bottom: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Sign In",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "spicy rice",
                              fontSize: 30,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account?",
                                  style: TextStyle(fontSize: 10),
                                ),

                                TextSpan(
                                  text: " Login ",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Full Name
                              LabelT(Label: "Full Name"),
                              custemfeild(
                                keyboardTypeC: TextInputType.name,

                                validatorC: (value) {
                                  if ((value ?? '').isEmpty)
                                    return 'Please enter your name';
                                  return null;
                                },
                              ),
                              SizedBox(height: 5),

                              //Email
                              LabelT(Label: "Email"),
                              custemfeild(
                                keyboardTypeC: TextInputType.emailAddress,
                                validatorC: (value) {
                                  if ((value ?? '').isEmpty)
                                    return 'Please enter your email';
                                  return null;
                                },
                              ),
                              SizedBox(height: 5),
                              //Birth Day
                              LabelT(Label: "Birth of date"),
                              custemfeild(
                                keyboardTypeC: TextInputType.name,
                                Suffix: Icon(Icons.calendar_month),
                                validatorC: (value) {
                                  if ((value ?? '').isEmpty)
                                    return 'Please enter your date of birth';
                                  return null;
                                },
                              ),
                              SizedBox(height: 5),

                              //Phone Number
                              LabelT(Label: "Phone Number"),
                              custemfeild(
                                keyboardTypeC: TextInputType.name,
                                validatorC: (value) {
                                  if ((value ?? '').isEmpty ||
                                      value!.length < 10)
                                    return 'Please enter your phone number';
                                  return null;
                                },
                                format: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              //Password
                              LabelT(Label: "Set Password"),
                              custemfeild(
                                keyboardTypeC: TextInputType.visiblePassword,
                                obscureText: true,
                                Suffix: Icon(Icons.visibility_off),
                                validatorC: (value) {
                                  if ((value ?? '').isEmpty ||
                                      value!.length < 5)
                                    return 'Please enter password ';
                                  return null;
                                },
                              ),
                              SizedBox(height: 5),
                              //TextFormField(),
                            ],
                          ),
                        ),

                        EleButton(
                          Label: "Register",

                          onPressedC: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRouts.home,
                                (routs) => false,
                              );
                              formkey.currentState!.save();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class custemfeild extends StatelessWidget {
  const custemfeild({
    super.key,
    required this.keyboardTypeC,
    this.Suffix,
    this.validatorC,
    this.format,
    this.obscureText = false,
  });
  final TextInputType keyboardTypeC;
  final Icon? Suffix;
  final FormFieldValidator<String>? validatorC;
  final format;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: TextFormField(
        obscureText: obscureText,
        validator: validatorC,
        keyboardType: keyboardTypeC,
        inputFormatters: format,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: Suffix,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<FormFieldValidator<String>?>.has(
        'validatorC',
        validatorC,
      ),
    );
  }
}

class LabelT extends StatelessWidget {
  const LabelT({super.key, required this.Label});

  final String Label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 5),
      child: Text(
        Label,
        style: TextStyle(color: Colors.grey[400], fontSize: 13),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class EleButton extends StatelessWidget {
  const EleButton({super.key, required this.Label, required this.onPressedC});
  final String Label;
  final VoidCallback onPressedC;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedC,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        fixedSize: Size(280, 50),
        alignment: Alignment.center,
      ),
      child: Text(Label, style: TextStyle(fontSize: 15)),
    );
  }
}
