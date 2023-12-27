import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trashcare/constants.dart';
import 'package:trashcare/rootpage.dart';
import 'package:trashcare/screens/forgot_password.dart';
import 'package:trashcare/screens/signup_page.dart';
import 'package:trashcare/screens/widgets/custom_textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/signin.png', height: 200, width: 200 ),
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomTextfield(
              obscureText: false,
              hintText: 'Enter Email',
              icon: Icons.alternate_email,
            ),
            const CustomTextfield(
              obscureText: true,
              hintText: 'Enter Password',
              icon: Icons.lock,
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const RootPage(),
                      type: PageTransitionType.bottomToTop),
                );
              },
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF395144),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const ForgotPassword(),
                      type: PageTransitionType.bottomToTop),
                );
              },
              child: Center(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Forgot Password?",
                      style: TextStyle(
                        color: Constants.blackColor,
                      ),
                    ),
                    TextSpan(
                        text: "Reset Here",
                        style: TextStyle(
                          color: Color(0xFF395144),
                          fontWeight: FontWeight.bold
                        )),
                  ]),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   children: const [
            //     Expanded(child: Divider()),
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       child: Text('OR'),
            //     ),
            //     Expanded(child: Divider()),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: size.width,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Constants.primaryColor),
            //       borderRadius: BorderRadius.circular(5)),
            //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       SizedBox(
            //         height: 20,
            //         child: Image.asset('images/google.png'),
            //       ),
            //       Text(
            //         'Sign in with google',
            //         style: TextStyle(
            //           color: Constants.blackColor,
            //           fontSize: 18.0,
            //         ),
            //       )
            //     ],
              // ),
            // ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const SignUp(),
                      type: PageTransitionType.bottomToTop),
                );
              },
              child: Center(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Have an account?",
                      style: TextStyle(
                        color: Constants.blackColor,
                      ),
                    ),
                    TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Color(0xFF395144),
                          fontWeight: FontWeight.bold
                        )),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
