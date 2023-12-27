import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trashcare/constants.dart';
import 'package:trashcare/rootpage.dart';
import 'package:trashcare/screens/widgets/custom_textfield.dart';
import 'package:trashcare/signin_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
            Image.asset('images/signup.png', height: 200, width: 200),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextfield(
              obscureText: false,
              hintText: 'Enter Email',
              icon: Icons.alternate_email,
            ),
            const CustomTextfield(
              obscureText: false,
              hintText: 'Enter Full name',
              icon: Icons.person,
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
                  color: const Color(0xFF395144),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const Center(
                  child: Text(
                    'Sign up',
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
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const SignIn(),
                      type: PageTransitionType.bottomToTop),
                );
              },
              child: Center(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Have an accout?",
                      style: TextStyle(
                        color: Constants.blackColor,
                      ),
                    ),
                    TextSpan(
                        text: "Login",
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
